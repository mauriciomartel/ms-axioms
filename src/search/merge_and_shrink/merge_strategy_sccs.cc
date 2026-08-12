#include "merge_strategy_sccs.h"

#include "factored_transition_system.h"
#include "merge_selector.h"
#include "merge_tree.h"
#include "merge_tree_factory.h"
#include "transition_system.h"

#include <algorithm>
#include <cassert>
#include <iostream>
#include <unordered_set>

using namespace std;

namespace merge_and_shrink {
MergeStrategySCCs::MergeStrategySCCs(
    const FactoredTransitionSystem &fts,
    const shared_ptr<MergeSelector> &merge_selector,
    vector<vector<int>> &&non_singleton_cg_sccs)
    : MergeStrategy(fts),
      merge_selector(merge_selector),
      non_singleton_cg_sccs(move(non_singleton_cg_sccs)) {
}

MergeStrategySCCs::~MergeStrategySCCs() {
}

pair<int, int> MergeStrategySCCs::get_next() {
    if (current_ts_indices.empty()) {
        /*
          We are currently not dealing with merging all factors of an SCC, so
          we need to either get the next one or allow merging any existing
          factors of the FTS if there is no SCC left.
        */
        last_merge_involved_scc_member = false;
        if (non_singleton_cg_sccs.empty()) {
            // We are done dealing with all SCCs, allow merging any factors.
            current_ts_indices.reserve(fts.get_num_active_entries());
            for (int ts_index : fts) {
                current_ts_indices.push_back(ts_index);
            }
        } else {
            /*
              There is another SCC we have to deal with. Store its factors so
              that we merge them over the next iterations.
            */
            vector<int> &current_scc = non_singleton_cg_sccs.front();
            assert(current_scc.size() > 1);
            current_ts_indices = move(current_scc);
            non_singleton_cg_sccs.erase(non_singleton_cg_sccs.begin());
        }
    } else if (last_merge_involved_scc_member) {
        /*
          The previous merge involved at least one SCC-tracked factor, so the
          product belongs to the current SCC and must be tracked here.
        */
        current_ts_indices.push_back(fts.get_size() - 1);
    }
    /*
      If last_merge_involved_scc_member is false the previous merge was between
      two external factors.  Their product is active in the FTS and will be
      picked up naturally in the external-factor scan below.
    */

    /*
      Build the set of factor indices that are off-limits: those belonging to
      SCCs not yet started.  Any active factor NOT in this set and NOT already
      in current_ts_indices is a singleton or a completed-SCC product that the
      merge selector is allowed to consider as a cross-SCC candidate.
    */
    unordered_set<int> in_current(current_ts_indices.begin(), current_ts_indices.end());
    unordered_set<int> in_future_sccs;
    for (const auto &scc : non_singleton_cg_sccs) {
        for (int idx : scc) {
            in_future_sccs.insert(idx);
        }
    }

    vector<int> candidate_indices = current_ts_indices;
    for (int ts_index : fts) {
        if (!in_current.count(ts_index) && !in_future_sccs.count(ts_index)) {
            candidate_indices.push_back(ts_index);
        }
    }

    // Compute all merge candidates for the augmented set of indices.
    vector<pair<int, int>> merge_candidates;
    merge_candidates.reserve(
        (candidate_indices.size() * (candidate_indices.size() - 1)) / 2);
    assert(candidate_indices.size() > 1);
    for (size_t i = 0; i < candidate_indices.size(); ++i) {
        int ts_index1 = candidate_indices[i];
        assert(fts.is_active(ts_index1));
        for (size_t j = i + 1; j < candidate_indices.size(); ++j) {
            int ts_index2 = candidate_indices[j];
            assert(fts.is_active(ts_index2));
            merge_candidates.emplace_back(ts_index1, ts_index2);
        }
    }

    // Select the next merge for the augmented set of indices.
    pair<int, int> next_pair = merge_selector->select_merge_from_candidates(
        fts, move(merge_candidates));

    /*
      Record whether the selected merge involves a factor tracked as part of
      the current SCC.  The product is added to current_ts_indices on the next
      call only when this is true.
    */
    last_merge_involved_scc_member =
        in_current.count(next_pair.first) || in_current.count(next_pair.second);

    // Remove the two merged indices from the SCC-tracking set.
    for (vector<int>::iterator it = current_ts_indices.begin();
         it != current_ts_indices.end();) {
        if (*it == next_pair.first || *it == next_pair.second) {
            it = current_ts_indices.erase(it);
        } else {
            ++it;
        }
    }
    return next_pair;
}
}
