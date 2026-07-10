#include "merge_and_shrink_algorithm.h"

#include "distances.h"
#include "factored_transition_system.h"
#include "fts_factory.h"
#include "label_reduction.h"
#include "labels.h"
#include "merge_and_shrink_representation.h"
#include "merge_strategy.h"
#include "merge_strategy_factory.h"
#include "primary_representation.h"
#include "shrink_strategy.h"
#include "transition_system.h"
#include "types.h"
#include "utils.h"

#include "../plugins/plugin.h"
#include "../task_utils/task_properties.h"
#include "../utils/collections.h"
#include "../utils/component_errors.h"
#include "../utils/countdown_timer.h"
#include "../utils/markup.h"
#include "../utils/math.h"
#include "../utils/system.h"
#include "../utils/timer.h"

#include <cassert>
#include <functional>
#include <iostream>
#include <limits>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <vector>

using namespace std;
using plugins::Bounds;
using utils::ExitCode;

namespace merge_and_shrink {
static void log_progress(
    const utils::Timer &timer, const string &msg, utils::LogProxy &log) {
    log << "M&S algorithm timer: " << timer << " (" << msg << ")" << endl;
}
MergeAndShrinkAlgorithm::MergeAndShrinkAlgorithm(
    const shared_ptr<MergeStrategyFactory> &merge_strategy,
    const shared_ptr<ShrinkStrategy> &shrink_strategy,
    const shared_ptr<LabelReduction> &label_reduction,
    bool prune_unreachable_states, bool prune_irrelevant_states, int max_states,
    int max_states_before_merge, int threshold_before_merge,
    double main_loop_max_time, utils::Verbosity verbosity)
    : merge_strategy_factory(merge_strategy),
      shrink_strategy(shrink_strategy),
      label_reduction(label_reduction),
      max_states(max_states),
      max_states_before_merge(max_states_before_merge),
      shrink_threshold_before_merge(threshold_before_merge),
      prune_unreachable_states(prune_unreachable_states),
      prune_irrelevant_states(prune_irrelevant_states),
      log(utils::get_log_for_verbosity(verbosity)),
      main_loop_max_time(main_loop_max_time),
      starting_peak_memory(0) {
    tie(this->max_states, this->max_states_before_merge,
        this->shrink_threshold_before_merge) =
        handle_shrink_limit_defaults(
            this->max_states, this->max_states_before_merge,
            this->shrink_threshold_before_merge, log);
    // Asserting fields (not parameters).
    assert(this->max_states_before_merge >= 1);
    assert(this->max_states >= this->max_states_before_merge);
}

tuple<int, int, int> handle_shrink_limit_defaults(
    int max_states, int max_states_before_merge,
    int shrink_threshold_before_merge, utils::LogProxy &log) {
    // If none of the two state limits has been set: set default limit.
    if (max_states == -1 && max_states_before_merge == -1) {
        max_states = 50000;
    }

    // If one of the max_states options has not been set, set the other
    // so that it imposes no further limits.
    if (max_states_before_merge == -1) {
        max_states_before_merge = max_states;
    } else if (max_states == -1) {
        if (utils::is_product_within_limit(
                max_states_before_merge, max_states_before_merge, INF)) {
            max_states = max_states_before_merge * max_states_before_merge;
        } else {
            max_states = INF;
        }
    }

    if (max_states_before_merge > max_states) {
        max_states_before_merge = max_states;
        if (log.is_warning()) {
            log << "WARNING: " << "max_states_before_merge exceeds max_states, "
                << "correcting max_states_before_merge." << endl;
        }
    }

    utils::verify_argument(
        max_states >= 1, "Transition system size must be at least 1.");

    utils::verify_argument(
        max_states_before_merge >= 1,
        "Transition system size before merge must be at least 1.");

    if (shrink_threshold_before_merge == -1) {
        shrink_threshold_before_merge = max_states;
    }

    utils::verify_argument(
        shrink_threshold_before_merge >= 1, "Threshold must be at least 1.");

    if (shrink_threshold_before_merge > max_states) {
        shrink_threshold_before_merge = max_states;
        if (log.is_warning()) {
            log << "WARNING: " << "threshold exceeds max_states, "
                << "correcting threshold." << endl;
        }
    }
    return make_tuple(
        max_states, max_states_before_merge, shrink_threshold_before_merge);
}

void MergeAndShrinkAlgorithm::report_peak_memory_delta(bool final) const {
    if (final)
        log << "Final";
    else
        log << "Current";
    log << " peak memory increase of merge-and-shrink algorithm: "
        << utils::get_peak_memory_in_kb() - starting_peak_memory << " KB"
        << endl;
}

void MergeAndShrinkAlgorithm::dump_options() const {
    if (log.is_at_least_normal()) {
        if (merge_strategy_factory) { // deleted after merge strategy extraction
            merge_strategy_factory->dump_options();
            log << endl;
        }

        log << "Options related to size limits and shrinking: " << endl;
        log << "Transition system size limit: " << max_states << endl
            << "Transition system size limit right before merge: "
            << max_states_before_merge << endl;
        log << "Threshold to trigger shrinking right before merge: "
            << shrink_threshold_before_merge << endl;
        log << endl;

        shrink_strategy->dump_options(log);
        log << endl;

        log << "Pruning unreachable states: "
            << (prune_unreachable_states ? "yes" : "no") << endl;
        log << "Pruning irrelevant states: "
            << (prune_irrelevant_states ? "yes" : "no") << endl;
        log << endl;

        if (label_reduction) {
            label_reduction->dump_options(log);
        } else {
            log << "Label reduction disabled" << endl;
        }
        log << endl;

        log << "Main loop max time in seconds: " << main_loop_max_time << endl;
        log << endl;
    }
}

void MergeAndShrinkAlgorithm::warn_on_unusual_options() const {
    string dashes(79, '=');
    if (!label_reduction) {
        if (log.is_warning()) {
            log << dashes << endl
                << "WARNING! You did not enable label reduction. " << endl
                << "This may drastically reduce the performance of merge-and-shrink!"
                << endl
                << dashes << endl;
        }
    } else if (
        label_reduction->reduce_before_merging() &&
        label_reduction->reduce_before_shrinking()) {
        if (log.is_warning()) {
            log << dashes << endl
                << "WARNING! You set label reduction to be applied twice in each merge-and-shrink"
                << endl
                << "iteration, both before shrinking and merging. This double computation effort"
                << endl
                << "does not pay off for most configurations!" << endl
                << dashes << endl;
        }
    } else {
        if (label_reduction->reduce_before_shrinking() &&
            (shrink_strategy->get_name() == "f-preserving" ||
             shrink_strategy->get_name() == "random")) {
            if (log.is_warning()) {
                log << dashes << endl
                    << "WARNING! Bucket-based shrink strategies such as f-preserving random perform"
                    << endl
                    << "best if used with label reduction before merging, not before shrinking!"
                    << endl
                    << dashes << endl;
            }
        }
        if (label_reduction->reduce_before_merging() &&
            shrink_strategy->get_name() == "bisimulation") {
            if (log.is_warning()) {
                log << dashes << endl
                    << "WARNING! Shrinking based on bisimulation performs best if used with label"
                    << endl
                    << "reduction before shrinking, not before merging!" << endl
                    << dashes << endl;
            }
        }
    }

    if (!prune_unreachable_states || !prune_irrelevant_states) {
        if (log.is_warning()) {
            log << dashes << endl
                << "WARNING! Pruning is (partially) turned off!" << endl
                << "This may drastically reduce the performance of merge-and-shrink!"
                << endl
                << dashes << endl;
        }
    }
}

bool MergeAndShrinkAlgorithm::ran_out_of_time(
    const utils::CountdownTimer &timer) const {
    if (timer.is_expired()) {
        if (log.is_at_least_normal()) {
            log << "Ran out of time, stopping computation." << endl;
            log << endl;
        }
        return true;
    }
    return false;
}

void MergeAndShrinkAlgorithm::main_loop(
    FactoredTransitionSystem &fts, const TaskProxy &task_proxy) {
    utils::CountdownTimer timer(main_loop_max_time);
    if (log.is_at_least_normal()) {
        log << "Starting main loop ";
        if (main_loop_max_time == numeric_limits<double>::infinity()) {
            log << "without a time limit." << endl;
        } else {
            log << "with a time limit of " << main_loop_max_time << "s."
                << endl;
        }
    }
    int maximum_intermediate_size = 0;
    for (int i = 0; i < fts.get_size(); ++i) {
        int size = fts.get_transition_system(i).get_size();
        if (size > maximum_intermediate_size) {
            maximum_intermediate_size = size;
        }
    }

    if (label_reduction) {
        label_reduction->initialize(task_proxy);
    }
    unique_ptr<MergeStrategy> merge_strategy =
        merge_strategy_factory->compute_merge_strategy(task_proxy, fts);
    merge_strategy_factory = nullptr;

    auto log_main_loop_progress = [&timer, this](const string &msg) {
        log << "M&S algorithm main loop timer: " << timer.get_elapsed_time()
            << " (" << msg << ")" << endl;
    };
    /*
      Track which factors incorporate axiom-factor information. Axiom factors
      sit at indices >= num_variables. Any merged factor inheriting from one
      must skip prune_irrelevant_states for the same reason the initial loop
      skips it: backward reachability within the partial subspace does not
      capture all operator paths to the goal in the full system.
    */
    int num_variables = task_proxy.get_variables().size();
    vector<bool> is_axiom_derived(fts.get_size(), false);
    for (int i = num_variables; i < fts.get_size(); ++i)
        is_axiom_derived[i] = true;
    /*
      Per-factor set of S_d primary variables that an axiom-induced factor
      still shares with a separate, exact atomic factor elsewhere in the FTS.
      Indices without an entry have nothing pending (empty set). See the
      declaration of axiom_factor_pending_vars for why this is needed.
    */
    vector<unordered_set<int>> pending_vars(fts.get_size());
    for (auto &[index, vars] : axiom_factor_pending_vars)
        pending_vars[index] = vars;
    /*
      Parallel bookkeeping for the exact value of each factor's still-pending
      variables, per state (see axiom_factor_pending_var_order/_values).
      Indices without an entry have empty order/values, meaning "no pending
      constraint, shrink normally."
    */
    vector<vector<int>> pending_var_order(fts.get_size());
    vector<vector<vector<int>>> pending_state_values(fts.get_size());
    for (auto &[index, order] : axiom_factor_pending_var_order)
        pending_var_order[index] = order;
    for (auto &[index, values] : axiom_factor_pending_values)
        pending_state_values[index] = values;
    while (fts.get_num_active_entries() > 1) {
        // Choose next transition systems to merge
        pair<int, int> merge_indices = merge_strategy->get_next();
        if (ran_out_of_time(timer)) {
            break;
        }
        int merge_index1 = merge_indices.first;
        int merge_index2 = merge_indices.second;
        assert(merge_index1 != merge_index2);
        if (log.is_at_least_normal()) {
            log << "Next pair of indices: (" << merge_index1 << ", "
                << merge_index2 << ")" << endl;
            if (log.is_at_least_verbose()) {
                fts.statistics(merge_index1, log);
                fts.statistics(merge_index2, log);
            }
            log_main_loop_progress("after computation of next merge");
        }
        // Label reduction (before shrinking)
        if (label_reduction && label_reduction->reduce_before_shrinking()) {
            bool reduced = label_reduction->reduce(merge_indices, fts, log);
            if (log.is_at_least_normal() && reduced) {
                log_main_loop_progress("after label reduction");
            }
        }

        if (ran_out_of_time(timer)) {
            break;
        }

        // Shrinking. Factors with pending variables are shrunk via a
        // constrained, value-preserving equivalence (see
        // shrink_before_merge_step) instead of being skipped outright, so
        // their size stays bounded even before all pending variables are
        // absorbed.
        bool shrunk = shrink_before_merge_step(
            fts, merge_index1, merge_index2, max_states,
            max_states_before_merge, shrink_threshold_before_merge,
            *shrink_strategy, log,
            pending_state_values[merge_index1],
            pending_state_values[merge_index2]);
        if (log.is_at_least_normal() && shrunk) {
            log_main_loop_progress("after shrinking");
        }

        if (ran_out_of_time(timer)) {
            break;
        }

        // Label reduction (before merging)
        if (label_reduction && label_reduction->reduce_before_merging()) {
            bool reduced = label_reduction->reduce(merge_indices, fts, log);
            if (log.is_at_least_normal() && reduced) {
                log_main_loop_progress("after label reduction");
            }
        }

        if (ran_out_of_time(timer)) {
            break;
        }

        is_axiom_derived.push_back(
            is_axiom_derived[merge_index1] || is_axiom_derived[merge_index2]);
        // Every pending variable is tracked by exactly two lineages at a
        // time: the axiom-derived factor whose S_d it belongs to, and its
        // own separate exact atomic factor (see the seeding code above this
        // function). A variable becomes absorbed (no longer pending, safe to
        // shrink across) exactly when a merge reunites those two lineages,
        // i.e. when it appears in *both* sides' pending sets simultaneously
        // (it cannot appear in both for any other reason, since each side's
        // pending set always traces back to a single, distinct lineage).
        unordered_set<int> new_pending = pending_vars[merge_index1];
        new_pending.insert(
            pending_vars[merge_index2].begin(), pending_vars[merge_index2].end());
        for (int v : pending_vars[merge_index1]) {
            if (pending_vars[merge_index2].count(v))
                new_pending.erase(v);
        }
        pending_vars.push_back(move(new_pending));
        // Propagate the per-state pending-variable value tables across the
        // merge (see axiom_factor_pending_var_order/_values): the new
        // factor's state s1 * size2 + s2 (matching TransitionSystem::merge's
        // encoding) carries the concatenation of the two sides' rows,
        // restricted to the variables that are still pending after this
        // merge (a variable just absorbed by an exact, non-axiom-derived
        // side no longer needs tracking).
        const unordered_set<int> &pending_vars_after = pending_vars.back();
        /*
          A variable absorbed by this merge (present in both sides' pending
          sets, see above) is, right now, represented twice in the raw
          cartesian product that TransitionSystem::merge is about to build:
          once via its embedded value inside the axiom-derived lineage, and
          once via the other (exact, single-variable) lineage. Because the
          two lineages were tracked completely independently up to this
          point (that is the entire reason shrinking had to be constrained
          while the variable was pending), the merge's product space
          contains states combining every value of the axiom-side copy with
          every value of the other-side copy, including combinations where
          the two disagree on the variable's value. Such states do not
          correspond to any reachable concrete state and must be pruned
          immediately after merging (consistent_mask below), or they pollute
          later bisimulation refinement and can make a solvable task appear
          unsolvable.
        */
        vector<pair<int, int>> absorbed_positions;
        {
            const vector<int> &order1 = pending_var_order[merge_index1];
            const vector<int> &order2 = pending_var_order[merge_index2];
            for (size_t i = 0; i < order1.size(); ++i)
                for (size_t j = 0; j < order2.size(); ++j)
                    if (order1[i] == order2[j])
                        absorbed_positions.emplace_back(i, j);
        }
        vector<bool> consistent_mask;
        if (!pending_var_order[merge_index1].empty() ||
            !pending_var_order[merge_index2].empty()) {
            int size1 = fts.get_transition_system(merge_index1).get_size();
            int size2 = fts.get_transition_system(merge_index2).get_size();
            vector<int> combined_order = pending_var_order[merge_index1];
            combined_order.insert(
                combined_order.end(), pending_var_order[merge_index2].begin(),
                pending_var_order[merge_index2].end());
            vector<int> new_order;
            vector<int> keep_positions;
            for (size_t i = 0; i < combined_order.size(); ++i) {
                if (pending_vars_after.count(combined_order[i])) {
                    new_order.push_back(combined_order[i]);
                    keep_positions.push_back(i);
                }
            }
            vector<vector<int>> merged_values;
            const vector<vector<int>> &vals1 = pending_state_values[merge_index1];
            const vector<vector<int>> &vals2 = pending_state_values[merge_index2];
            if (!absorbed_positions.empty())
                consistent_mask.assign(static_cast<size_t>(size1) * size2, true);
            if (!new_order.empty() || !absorbed_positions.empty()) {
                merged_values.resize(static_cast<size_t>(size1) * size2);
                for (int s1 = 0; s1 < size1; ++s1) {
                    for (int s2 = 0; s2 < size2; ++s2) {
                        size_t flat = static_cast<size_t>(s1) * size2 + s2;
                        if (!absorbed_positions.empty()) {
                            bool ok = true;
                            for (const auto &pos_pair : absorbed_positions) {
                                if (vals1[s1][pos_pair.first] !=
                                    vals2[s2][pos_pair.second]) {
                                    ok = false;
                                    break;
                                }
                            }
                            consistent_mask[flat] = ok;
                        }
                        if (new_order.empty())
                            continue;
                        vector<int> combined_row;
                        combined_row.reserve(combined_order.size());
                        if (!vals1.empty())
                            combined_row.insert(
                                combined_row.end(), vals1[s1].begin(), vals1[s1].end());
                        if (!vals2.empty())
                            combined_row.insert(
                                combined_row.end(), vals2[s2].begin(), vals2[s2].end());
                        vector<int> row;
                        row.reserve(new_order.size());
                        for (int pos : keep_positions)
                            row.push_back(combined_row[pos]);
                        merged_values[flat] = move(row);
                    }
                }
            }
            pending_var_order.push_back(move(new_order));
            pending_state_values.push_back(move(merged_values));
        } else {
            pending_var_order.push_back(vector<int>());
            pending_state_values.push_back(vector<vector<int>>());
        }
        // Free the now-dead sides' tables to keep memory bounded.
        utils::release_vector_memory(pending_state_values[merge_index1]);
        utils::release_vector_memory(pending_state_values[merge_index2]);
        // Merging
        int merged_index = fts.merge(merge_index1, merge_index2, log);
        if (!consistent_mask.empty()) {
            int total = static_cast<int>(consistent_mask.size());
            StateEquivalenceRelation relation;
            relation.reserve(total);
            int pruned_count = 0;
            for (int s = 0; s < total; ++s) {
                if (consistent_mask[s]) {
                    StateEquivalenceClass cls;
                    cls.push_front(s);
                    relation.push_back(move(cls));
                } else {
                    ++pruned_count;
                }
            }
            if (pruned_count > 0) {
                fts.apply_abstraction(merged_index, relation, log);
                vector<vector<int>> &vals = pending_state_values[merged_index];
                if (!vals.empty()) {
                    vector<vector<int>> kept;
                    kept.reserve(relation.size());
                    for (int s = 0; s < total; ++s)
                        if (consistent_mask[s])
                            kept.push_back(move(vals[s]));
                    vals = move(kept);
                }
                if (log.is_at_least_verbose()) {
                    log << "Pruned " << pruned_count << " states inconsistent "
                        << "with an already-tracked variable value while "
                        << "absorbing a pending variable." << endl;
                }
            }
        }
        int abs_size = fts.get_transition_system(merged_index).get_size();
        if (abs_size > maximum_intermediate_size) {
            maximum_intermediate_size = abs_size;
        }

        if (log.is_at_least_normal()) {
            if (log.is_at_least_verbose()) {
                fts.statistics(merged_index, log);
            }
            log_main_loop_progress("after merging");
        }

        if (ran_out_of_time(timer)) {
            break;
        }

        // Pruning
        // - Factors with derived variables in incorporated_variables (derived
        //   atomic TS): skip both prunings; axiom rules set derived values,
        //   not operators, so operator-based analysis is incorrect.
        // - Axiom-derived merged factors (is_axiom_derived): skip
        //   prune_irrelevant_states; backward reachability within the partial
        //   subspace misses paths that require variables not yet merged in.
        bool merged_has_derived = false;
        for (int v : fts.get_transition_system(merged_index).get_incorporated_variables()) {
            if (task_proxy.get_variables()[v].is_derived()) {
                merged_has_derived = true;
                break;
            }
        }
        bool effective_prune_unreachable =
            prune_unreachable_states && !merged_has_derived && !is_axiom_derived[merged_index];
        bool effective_prune_irrelevant =
            prune_irrelevant_states && !merged_has_derived && !is_axiom_derived[merged_index];
        if (effective_prune_unreachable || effective_prune_irrelevant) {
            // prune_step may drop and renumber states of merged_index; keep
            // pending_state_values[merged_index] (if any pending variables
            // remain unabsorbed) aligned with the post-prune state numbering
            // using the exact same survival criterion, mirroring the
            // analogous sync done for atomic factors before the main loop.
            // Without this, later consistency checks at absorbing merges
            // would read pending-value rows under stale state indices,
            // causing them to wrongly classify states as inconsistent.
            vector<vector<int>> &pending_vals = pending_state_values[merged_index];
            if (!pending_vals.empty()) {
                const Distances &distances_before = fts.get_distances(merged_index);
                vector<vector<int>> kept;
                kept.reserve(pending_vals.size());
                for (size_t s = 0; s < pending_vals.size(); ++s) {
                    bool prune_state =
                        (effective_prune_unreachable &&
                         distances_before.get_init_distance(s) == INF) ||
                        (effective_prune_irrelevant &&
                         distances_before.get_goal_distance(s) == INF);
                    if (!prune_state)
                        kept.push_back(move(pending_vals[s]));
                }
                pending_vals = move(kept);
            }
            bool pruned = prune_step(
                fts, merged_index, effective_prune_unreachable,
                effective_prune_irrelevant, log);
            if (log.is_at_least_normal() && pruned) {
                if (log.is_at_least_verbose()) {
                    fts.statistics(merged_index, log);
                }
                log_main_loop_progress("after pruning");
            }
        }
        
        /*
          NOTE: both the shrink strategy classes and the construction
          of the composite transition system require the input
          transition systems to be non-empty, i.e. the initial state
          not to be pruned/not to be evaluated as infinity.
        */
        if (!is_axiom_derived[merged_index] && !fts.is_factor_solvable(merged_index)) {
            if (log.is_at_least_normal()) {
                log << "Abstract problem is unsolvable, stopping "
                       "computation. "
                    << endl
                    << endl;
            }
            break;
        }

        if (ran_out_of_time(timer)) {
            break;
        }

        // End-of-iteration output.
        if (log.is_at_least_verbose()) {
            report_peak_memory_delta();
        }
        if (log.is_at_least_normal()) {
            log << endl;
        }
    }

    log << "End of merge-and-shrink algorithm, statistics:" << endl;
    log << "Main loop runtime: " << timer.get_elapsed_time() << endl;
    log << "Maximum intermediate abstraction size: "
        << maximum_intermediate_size << endl;
    shrink_strategy = nullptr;
    label_reduction = nullptr;
}

FactoredTransitionSystem
MergeAndShrinkAlgorithm::build_factored_transition_system(
    const TaskProxy &task_proxy) {
    if (starting_peak_memory) {
        cerr << "Calling build_factored_transition_system twice is not "
             << "supported!" << endl;
        utils::exit_with(utils::ExitCode::SEARCH_CRITICAL_ERROR);
    }
    starting_peak_memory = utils::get_peak_memory_in_kb();

    utils::Timer timer;
    log << "Running merge-and-shrink algorithm..." << endl;
    // task_properties::verify_no_axioms(task_proxy);
    dump_options();
    warn_on_unusual_options();
    log << endl;

    // The main loop's shrinking of axiom factors (once their primary
    // variables are absorbed) needs goal distances, so force them on
    // whenever derived goal variables are present.
    bool has_derived_goals = false;
    for (FactProxy goal : task_proxy.get_goals())
        if (goal.get_variable().is_derived()) { has_derived_goals = true; break; }

    const bool compute_init_distances =
        shrink_strategy->requires_init_distances() ||
        merge_strategy_factory->requires_init_distances() ||
        prune_unreachable_states;
    const bool compute_goal_distances =
        shrink_strategy->requires_goal_distances() ||
        merge_strategy_factory->requires_goal_distances() ||
        prune_irrelevant_states ||
        has_derived_goals;
    FactoredTransitionSystem fts = create_factored_transition_system(
        task_proxy, compute_init_distances, compute_goal_distances, log);
    if (log.is_at_least_normal()) {
        log_progress(timer, "after computation of atomic factors", log);
    }

    // For each derived goal variable, build an axiom-induced abstract factor
    // Theta_{S,d} and immediately shrink it with quasi-bisimulation.
    // This must happen before the pruning loop so the loop can detect
    // unsolvable axiom factors and abort early.
    //
    // Derived goal variables whose S_d sets (primary-variable dependency
    // closures) overlap are grouped and built as a single combined factor.
    // M&S requires that each variable be represented by exactly one live
    // factor at a time; building separate per-derived-variable factors that
    // share primary variables, and bisimulation-shrinking each of them
    // independently before they are later merged, destroys the correlation
    // between the shared variables and produces unsound abstract states.
    if (has_derived_goals) {
        vector<int> goal_derived_vars;
        for (FactProxy goal : task_proxy.get_goals())
            if (goal.get_variable().is_derived())
                goal_derived_vars.push_back(goal.get_variable().get_id());

        vector<unordered_set<int>> primary_sets;
        primary_sets.reserve(goal_derived_vars.size());
        for (int d : goal_derived_vars)
            primary_sets.push_back(
                compute_axiom_factor_primary_vars(task_proxy, d));

        // Union-find over goal_derived_vars, grouping any two whose S_d sets
        // intersect (transitively).
        vector<int> uf_parent(goal_derived_vars.size());
        for (size_t i = 0; i < uf_parent.size(); ++i)
            uf_parent[i] = i;
        function<int(int)> uf_find = [&](int x) {
            while (uf_parent[x] != x)
                x = uf_parent[x] = uf_parent[uf_parent[x]];
            return x;
        };
        for (size_t i = 0; i < goal_derived_vars.size(); ++i) {
            for (size_t j = i + 1; j < goal_derived_vars.size(); ++j) {
                bool overlap = false;
                for (int v : primary_sets[j]) {
                    if (primary_sets[i].count(v)) {
                        overlap = true;
                        break;
                    }
                }
                if (overlap) {
                    int ri = uf_find(i);
                    int rj = uf_find(j);
                    if (ri != rj)
                        uf_parent[ri] = rj;
                }
            }
        }

        unordered_map<int, vector<int>> groups; // uf root -> derived var ids
        for (size_t i = 0; i < goal_derived_vars.size(); ++i)
            groups[uf_find(i)].push_back(goal_derived_vars[i]);

        for (auto &[root, derived_var_ids] : groups) {
            if (log.is_at_least_normal()) {
                log << "Building axiom factor for derived variable(s)";
                for (int d : derived_var_ids)
                    log << " " << d;
                log << "." << endl;
            }
            // Build the product transition system for the primary variables
            // in S_d and inject it into the FTS. Distances are computed
            // immediately inside add_factor using the FTS-level flags,
            // so goal distances are guaranteed to be available here.
            // Also capture, for every state, the exact values of the S_d
            // primary variables: while any of them is still pending (see
            // below), the main loop uses this to shrink the factor without
            // ever collapsing two states that disagree on a pending
            // variable, which would be unsound (that variable is still also
            // represented exactly by a separate, not-yet-absorbed atomic
            // factor elsewhere in the FTS).
            vector<int> pending_var_order;
            vector<vector<int>> pending_state_values;
            int axiom_index = build_axiom_factor(
                task_proxy, derived_var_ids, fts, log,
                &pending_var_order, &pending_state_values);
            // build_axiom_factor returns -1 when the reachable product state
            // space exceeds the built-in limit. Skip pending-variable tracking
            // in that case: no factor was added to the FTS, so no absorption
            // synchronisation is needed, and the atomic factors for the primary
            // variables can be shrunk freely by the main loop.
            if (axiom_index >= 0) {
                unordered_set<int> pending_vars;
                for (size_t i = 0; i < goal_derived_vars.size(); ++i) {
                    if (uf_find(i) == root)
                        pending_vars.insert(
                            primary_sets[i].begin(), primary_sets[i].end());
                }
                // Every primary variable in this axiom factor's pending set is
                //, right now, *also* represented exactly by its own untouched
                // atomic factor (FTS index == variable id). That atomic factor
                // must not be lossily shrunk either until the two
                // representations of the variable are reunited by a merge (see
                // the symmetric absorption check in main_loop): seed the same
                // pending tracking for it (trivially, since an atomic factor's
                // states already are the variable's values one-to-one).
                for (int v : pending_vars) {
                    if (!axiom_factor_pending_vars.count(v)) {
                        int dom = fts.get_transition_system(v).get_size();
                        vector<vector<int>> identity_values(dom);
                        for (int val = 0; val < dom; ++val)
                            identity_values[val] = {val};
                        axiom_factor_pending_vars[v] = {v};
                        axiom_factor_pending_var_order[v] = {v};
                        axiom_factor_pending_values[v] = move(identity_values);
                    }
                }
                axiom_factor_pending_vars[axiom_index] = move(pending_vars);
                axiom_factor_pending_var_order[axiom_index] = move(pending_var_order);
                axiom_factor_pending_values[axiom_index] = move(pending_state_values);
            }
            if (log.is_at_least_normal()) {
                log_progress(timer, "after building axiom factor", log);
            }
        }
    }

    /*
      Prune all atomic factors according to the chosen options. Stop early if
      one factor is unsolvable.

      TODO: think about if we can prune already while creating the atomic FTS.
    */
    bool pruned = false;
    bool unsolvable = false;
    // AFTER:
    int num_variables = task_proxy.get_variables().size();
    for (int index = 0; index < fts.get_size(); ++index) {
        assert(fts.is_active(index));
        // Pruning for atomic and axiom factors:
        // - Derived variable atomic factors (index < num_variables, is_derived):
        //   skip prune_unreachable_states. Their values are set by axiom
        //   evaluation, not operators, so forward reachability from the init
        //   state is unsound for them.
        // - Axiom factors (index >= num_variables): skip prune_irrelevant_states.
        //   The axiom factor covers only a subset of primary variables; backward
        //   reachability within that subspace does not capture all operator
        //   paths to the goal in the full system and would incorrectly mark
        //   reachable states as irrelevant.
        bool is_derived_atomic = index < num_variables &&
                                 task_proxy.get_variables()[index].is_derived();
        bool is_axiom_factor = index >= num_variables;
        bool effective_prune_unreachable = prune_unreachable_states && !is_derived_atomic;
        bool effective_prune_irrelevant = prune_irrelevant_states && !is_axiom_factor;
        if (effective_prune_unreachable || effective_prune_irrelevant) {
            // prune_step may drop states from this factor; keep the pending-
            // variable value table (if any) in sync by applying the exact
            // same survival criterion before the prune actually happens
            // (apply_abstraction replaces the Distances object).
            auto pending_it = axiom_factor_pending_values.find(index);
            if (pending_it != axiom_factor_pending_values.end()) {
                const Distances &distances_before = fts.get_distances(index);
                vector<vector<int>> &vals = pending_it->second;
                vector<vector<int>> kept;
                kept.reserve(vals.size());
                for (size_t s = 0; s < vals.size(); ++s) {
                    bool prune_state =
                        (effective_prune_unreachable &&
                         distances_before.get_init_distance(s) == INF) ||
                        (effective_prune_irrelevant &&
                         distances_before.get_goal_distance(s) == INF);
                    if (!prune_state)
                        kept.push_back(move(vals[s]));
                }
                vals = move(kept);
            }
            bool pruned_factor = prune_step(
                fts, index,
                effective_prune_unreachable, effective_prune_irrelevant,
                log);
            pruned = pruned || pruned_factor;
        }
        if (!is_axiom_factor && !fts.is_factor_solvable(index)) {
            log << "Atomic FTS is unsolvable, stopping computation." << endl;
            unsolvable = true;
            break;
        }
    }
    if (log.is_at_least_normal()) {
        if (pruned) {
            log_progress(timer, "after pruning atomic factors", log);
        }
        log << endl;
    }

    if (!unsolvable && main_loop_max_time > 0) {
        main_loop(fts, task_proxy);
    }
    const bool final = true;
    report_peak_memory_delta(final);
    log << "Merge-and-shrink algorithm runtime: " << timer << endl;
    log << endl;
    return fts;
}

void add_merge_and_shrink_algorithm_options_to_feature(
    plugins::Feature &feature) {
    // Merge strategy option.
    feature.add_option<shared_ptr<MergeStrategyFactory>>(
        "merge_strategy",
        "See detailed documentation for merge strategies. "
        "We currently recommend SCC-DFP, which can be achieved using "
        "{{{merge_strategy=merge_sccs(order_of_sccs=topological,merge_selector="
        "score_based_filtering(scoring_functions=[goal_relevance,dfp,total_order"
        "]))}}}");

    // Shrink strategy option.
    feature.add_option<shared_ptr<ShrinkStrategy>>(
        "shrink_strategy",
        "See detailed documentation for shrink strategies. "
        "We currently recommend non-greedy shrink_bisimulation, which can be "
        "achieved using {{{shrink_strategy=shrink_bisimulation(greedy=false)}}}");

    // Label reduction option.
    feature.add_option<shared_ptr<LabelReduction>>(
        "label_reduction",
        "See detailed documentation for labels. There is currently only "
        "one 'option' to use label_reduction, which is {{{label_reduction=exact}}} "
        "Also note the interaction with shrink strategies.",
        plugins::ArgumentInfo::NO_DEFAULT);

    // Pruning options.
    feature.add_option<bool>(
        "prune_unreachable_states",
        "If true, prune abstract states unreachable from the initial state.",
        "true");
    feature.add_option<bool>(
        "prune_irrelevant_states",
        "If true, prune abstract states from which no goal state can be "
        "reached.",
        "true");

    add_transition_system_size_limit_options_to_feature(feature);

    feature.add_option<double>(
        "main_loop_max_time",
        "A limit in seconds on the runtime of the main loop of the algorithm. "
        "If the limit is exceeded, the algorithm terminates, potentially "
        "returning a factored transition system with several factors. Also "
        "note that the time limit is only checked between transformations "
        "of the main loop, but not during, so it can be exceeded if a "
        "transformation is runtime-intense.",
        "infinity", Bounds("0.0", "infinity"));
}

tuple<
    shared_ptr<MergeStrategyFactory>, shared_ptr<ShrinkStrategy>,
    shared_ptr<LabelReduction>, bool, bool, int, int, int, double>
get_merge_and_shrink_algorithm_arguments_from_options(
    const plugins::Options &opts) {
    return tuple_cat(
        make_tuple(
            opts.get<shared_ptr<MergeStrategyFactory>>("merge_strategy"),
            opts.get<shared_ptr<ShrinkStrategy>>("shrink_strategy"),
            opts.get<shared_ptr<LabelReduction>>("label_reduction", nullptr),
            opts.get<bool>("prune_unreachable_states"),
            opts.get<bool>("prune_irrelevant_states")),
        get_transition_system_size_limit_arguments_from_options(opts),
        make_tuple(opts.get<double>("main_loop_max_time")));
}

void add_transition_system_size_limit_options_to_feature(
    plugins::Feature &feature) {
    feature.add_option<int>(
        "max_states",
        "maximum transition system size allowed at any time point.", "-1",
        Bounds("-1", "infinity"));
    feature.add_option<int>(
        "max_states_before_merge",
        "maximum transition system size allowed for two transition systems "
        "before being merged to form the synchronized product.",
        "-1", Bounds("-1", "infinity"));
    feature.add_option<int>(
        "threshold_before_merge",
        "If a transition system, before being merged, surpasses this soft "
        "transition system size limit, the shrink strategy is called to "
        "possibly shrink the transition system.",
        "-1", Bounds("-1", "infinity"));
}

tuple<int, int, int> get_transition_system_size_limit_arguments_from_options(
    const plugins::Options &opts) {
    return make_tuple(
        opts.get<int>("max_states"), opts.get<int>("max_states_before_merge"),
        opts.get<int>("threshold_before_merge"));
}
}
