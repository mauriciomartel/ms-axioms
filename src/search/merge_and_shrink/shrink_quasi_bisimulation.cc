#include "shrink_quasi_bisimulation.h"

#include "distances.h"
#include "factored_transition_system.h"
#include "transition_system.h"

#include "../plugins/plugin.h"
#include "../utils/collections.h"
#include "../utils/logging.h"
#include "../utils/system.h"

#include <algorithm>
#include <cassert>
#include <limits>
#include <memory>
#include <unordered_map>

using namespace std;

namespace merge_and_shrink {

/*
  A successor signature encodes the transition behaviour of a state as seen by
  the quasi-bisimulation algorithm. Each entry is a (label_group_id, target_group)
  pair. States with identical successor signatures are not distinguished in the
  current refinement round. The vector must be sorted and duplicate-free.
*/
using SuccessorSignature = vector<pair<int, int>>;

/*
  SENTINEL is used as an end marker in the sorted signatures array so that
  the main loop can detect the end without a bounds check. Since unreachable
  states have goal distance INF = numeric_limits<int>::max(), we use INF-1
  (IRRELEVANT) for them to guarantee they always sort before the sentinel.
*/
const int SENTINEL = numeric_limits<int>::max();
const int IRRELEVANT = SENTINEL - 1;

/*
  A Signature bundles everything the quasi-bisimulation algorithm needs to
  know about a state in a single comparable record:
    - h_and_goal: -1 for goal states (always h=0), otherwise the goal distance.
      Goal states sort before all non-goal states regardless of h.
    - group: the current partition group of this state.
    - succ_signature: encoded successor behaviour (see above).
    - state: the original state index, used as a tie-breaker to make the
      ordering total and to recover the state after sorting.

  Two states should be merged iff they have the same h_and_goal, the same
  group (they were not split in a previous round), and the same succ_signature.
*/
struct Signature {
    int h_and_goal;
    int group;
    SuccessorSignature succ_signature;
    int state;

    Signature(
        int h, bool is_goal, int group_,
        const SuccessorSignature &succ_signature_, int state_)
        : group(group_), succ_signature(succ_signature_), state(state_) {
        if (is_goal) {
            assert(h == 0);
            h_and_goal = -1;
        } else {
            h_and_goal = h;
        }
    }

    bool operator<(const Signature &other) const {
        if (h_and_goal != other.h_and_goal)
            return h_and_goal < other.h_and_goal;
        if (group != other.group)
            return group < other.group;
        if (succ_signature != other.succ_signature)
            return succ_signature < other.succ_signature;
        return state < other.state;
    }
};

int ShrinkQuasiBisimulation::initialize_groups(
    const TransitionSystem &ts, const Distances &distances,
    vector<int> &state_to_group) const {
    /*
      Initial partition: group 0 holds all goal states; every distinct h value
      among non-goal states forms its own group. Separating by h is sound
      because states with different goal distances can never be bisimilar
      (the heuristic value would differ), so we save refinement iterations by
      distinguishing them upfront.
    */
    typedef unordered_map<int, int> GroupMap;
    GroupMap h_to_group;
    bool has_goals = false;
    for (int state = 0; state < ts.get_size(); ++state) {
        if (ts.is_goal_state(state)) { has_goals = true; break; }
    }
    int num_groups = has_goals ? 1 : 0;
    for (int state = 0; state < ts.get_size(); ++state) {
        int h = distances.get_goal_distance(state);
        if (h == INF) {
            h = IRRELEVANT;
        }
        if (ts.is_goal_state(state)) {
            assert(h == 0);
            state_to_group[state] = 0;
        } else {
            pair<GroupMap::iterator, bool> result =
                h_to_group.insert(make_pair(h, num_groups));
            state_to_group[state] = result.first->second;
            if (result.second) {
                ++num_groups;
            }
        }
    }
    return num_groups;
}

void ShrinkQuasiBisimulation::compute_signatures(
    const TransitionSystem &ts, const Distances &distances,
    vector<Signature> &signatures, const vector<int> &state_to_group) const {
    assert(signatures.empty());
    int num_states = ts.get_size();

    // Step 1: Create one Signature per state (no transition info yet), plus
    // two sentinels so the main loop can always safely read one element back.
    signatures.push_back(Signature(-2, false, -1, SuccessorSignature(), -1));
    for (int state = 0; state < num_states; ++state) {
        int h = distances.get_goal_distance(state);
        if (h == INF) {
            h = IRRELEVANT;
        }
        signatures.push_back(Signature(
            h, ts.is_goal_state(state), state_to_group[state],
            SuccessorSignature(), state));
    }
    signatures.push_back(
        Signature(SENTINEL, false, -1, SuccessorSignature(), -1));

    // Step 2: Augment each signature with transition information.
    int label_group_counter = 0;
    for (const LocalLabelInfo &local_label_info : ts) {
        const vector<Transition> &transitions =
            local_label_info.get_transitions();

        /*
          Quasi-bisimulation modification (QBISIM2):

          In standard bisimulation, states with no outgoing transition under
          label group l get no entry for l in their successor signature. After
          sorting, they form a separate partition from states that do have an
          l-transition, so they are always split off — even when splitting them
          is unnecessary for heuristic correctness.

          Quasi-bisimulation allows a state s2 to have no l-transition even
          when its equivalent partner s1 does. To implement this, we give every
          state that lacks an l-transition a "wildcard" entry
              (label_group_counter, min_target_group)
          where min_target_group is the smallest target-group ID among all
          l-transitions originating from the same current group. This makes the
          no-transition state sort together with the "first" subgroup of states
          that do have l-transitions, instead of sorting into its own separate
          partition.

          If an entire group has no l-transitions, all its members already have
          the same (empty) entry for l and no wildcard is needed.
        */
        vector<bool> has_transition(num_states, false);
        // Maps each source group to the minimum target-group ID seen so far
        // among l-transitions from that group.
        unordered_map<int, int> group_to_min_target;

        for (const Transition &transition : transitions) {
            assert(signatures[transition.src + 1].state == transition.src);
            int target_group = state_to_group[transition.target];
            assert(target_group != -1 && target_group != SENTINEL);
            signatures[transition.src + 1].succ_signature.push_back(
                make_pair(label_group_counter, target_group));
            has_transition[transition.src] = true;

            int src_group = state_to_group[transition.src];
            auto result = group_to_min_target.emplace(src_group, target_group);
            if (!result.second) {
                // A transition from this group was already seen; keep the min.
                result.first->second = min(result.first->second, target_group);
            }
        }

        // Assign wildcard entries to states without an l-transition whose
        // group contains at least one state that does have one.
        for (int state = 0; state < num_states; ++state) {
            if (!has_transition[state]) {
                int src_group = state_to_group[state];
                auto it = group_to_min_target.find(src_group);
                if (it != group_to_min_target.end()) {
                    signatures[state + 1].succ_signature.push_back(
                        make_pair(label_group_counter, it->second));
                }
            }
        }

        ++label_group_counter;
    }

    // Step 3: Sort and deduplicate each successor signature, then sort the
    // whole signatures array. After this, states that should not be split
    // occupy contiguous positions with identical Signature values.
    for (size_t i = 0; i < signatures.size(); ++i) {
        SuccessorSignature &succ_sig = signatures[i].succ_signature;
        ::sort(succ_sig.begin(), succ_sig.end());
        succ_sig.erase(
            ::unique(succ_sig.begin(), succ_sig.end()), succ_sig.end());
    }

    ::sort(signatures.begin(), signatures.end());
}

StateEquivalenceRelation ShrinkQuasiBisimulation::compute_equivalence_relation(
    const TransitionSystem &ts, const Distances &distances, int target_size,
    utils::LogProxy &) const {
    assert(distances.are_goal_distances_computed());
    int num_states = ts.get_size();

    vector<int> state_to_group(num_states);
    vector<Signature> signatures;
    signatures.reserve(num_states + 2);

    int num_groups = initialize_groups(ts, distances, state_to_group);

    /*
      Iterative refinement: repeatedly split groups whose members disagree on
      successor behaviour, until no further splits are possible (stable) or
      the target state count would be exceeded (stop_requested).
    */
    bool stable = false;
    bool stop_requested = false;
    while (!stable && !stop_requested && num_groups < target_size) {
        stable = true;

        signatures.clear();
        compute_signatures(ts, distances, signatures, state_to_group);

        assert(static_cast<int>(signatures.size()) == num_states + 2);
        assert(signatures[0].h_and_goal == -2);
        assert(signatures[num_states + 1].h_and_goal == SENTINEL);

        /*
          Walk the sorted signatures. States with the same h_and_goal form a
          "block". Within a block, consecutive states with the same group but
          different succ_signature must be split into new groups. States in
          different groups are never merged (group IDs are preserved).
        */
        int sig_start = 1; // skip the leading sentinel
        while (true) {
            int h_and_goal = signatures[sig_start].h_and_goal;
            if (h_and_goal == SENTINEL) {
                assert(sig_start + 1 == static_cast<int>(signatures.size()));
                break;
            }

            // Count how many old groups and new groups this block produces.
            int num_old_groups = 0;
            int num_new_groups = 0;
            int sig_end;
            for (sig_end = sig_start; true; ++sig_end) {
                if (signatures[sig_end].h_and_goal != h_and_goal) {
                    break;
                }

                const Signature &prev_sig = signatures[sig_end - 1];
                const Signature &curr_sig = signatures[sig_end];

                if (sig_end == sig_start) {
                    // The sentinel has a different group, so this always fires.
                    assert(prev_sig.group != curr_sig.group);
                }

                if (prev_sig.group != curr_sig.group) {
                    // Entering a new pre-existing group.
                    ++num_old_groups;
                    ++num_new_groups;
                } else if (prev_sig.succ_signature != curr_sig.succ_signature) {
                    // Same old group, different behaviour: needs a new group.
                    ++num_new_groups;
                }
            }
            assert(sig_end > sig_start);

            if (num_groups - num_old_groups + num_new_groups > target_size) {
                // Splitting this block would exceed the size limit; abort.
                stop_requested = true;
                break;
            } else if (num_new_groups != num_old_groups) {
                stable = false;

                // Assign group numbers: the first subgroup of each old group
                // keeps the old group number; additional subgroups get new ones.
                int new_group_no = -1;
                for (int i = sig_start; i < sig_end; ++i) {
                    const Signature &prev_sig = signatures[i - 1];
                    const Signature &curr_sig = signatures[i];

                    if (prev_sig.group != curr_sig.group) {
                        new_group_no = curr_sig.group;
                    } else if (
                        prev_sig.succ_signature != curr_sig.succ_signature) {
                        new_group_no = num_groups++;
                        assert(num_groups <= target_size);
                    }

                    assert(new_group_no != -1);
                    state_to_group[curr_sig.state] = new_group_no;
                    if (num_groups == target_size)
                        break;
                }
                if (num_groups == target_size)
                    break;
            }
            sig_start = sig_end;
        }
    }

    utils::release_vector_memory(signatures);

    // Build the final equivalence relation from state_to_group.
    StateEquivalenceRelation equivalence_relation;
    equivalence_relation.resize(num_groups);
    for (int state = 0; state < num_states; ++state) {
        int group = state_to_group[state];
        if (group != -1) {
            assert(group >= 0 && group < num_groups);
            equivalence_relation[group].push_front(state);
        }
    }

    return equivalence_relation;
}

string ShrinkQuasiBisimulation::name() const {
    return "quasi_bisimulation";
}

void ShrinkQuasiBisimulation::dump_strategy_specific_options(
    utils::LogProxy &log) const {
    if (log.is_at_least_normal()) {
        log << "Quasi-bisimulation (exact)" << endl;
    }
}

class ShrinkQuasiBisimulationFeature
    : public plugins::TypedFeature<ShrinkStrategy, ShrinkQuasiBisimulation> {
public:
    ShrinkQuasiBisimulationFeature()
        : TypedFeature("shrink_quasi_bisimulation") {
        document_title("Quasi-bisimulation based shrink strategy");
        document_synopsis(
            "Quasi-bisimulation is a coarser equivalence than standard "
            "bisimulation. States that have no outgoing transition under some "
            "label are allowed to be grouped with states that do have such a "
            "transition, which is permitted by condition QBISIM2. This is used "
            "to handle derived variables (axioms) in the merge-and-shrink "
            "framework.");
    }

    virtual shared_ptr<ShrinkQuasiBisimulation> create_component(
        const plugins::Options &) const override {
        return make_shared<ShrinkQuasiBisimulation>();
    }
};

static plugins::FeaturePlugin<ShrinkQuasiBisimulationFeature> _plugin;
}