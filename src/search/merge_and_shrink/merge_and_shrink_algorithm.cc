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
#include "shrink_quasi_bisimulation.h"
#include "shrink_strategy.h"
#include "transition_system.h"
#include "types.h"
#include "utils.h"

#include "../plugins/plugin.h"
#include "../task_utils/task_properties.h"
#include "../utils/component_errors.h"
#include "../utils/countdown_timer.h"
#include "../utils/markup.h"
#include "../utils/math.h"
#include "../utils/system.h"
#include "../utils/timer.h"

#include <cassert>
#include <iostream>
#include <limits>
#include <string>
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
    double main_loop_max_time, utils::Verbosity verbosity,
    AxiomFactorMode axiom_factor_mode)
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
      starting_peak_memory(0),
      axiom_factor_mode(axiom_factor_mode) {
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

        // Shrinking
        bool shrunk = shrink_before_merge_step(
            fts, merge_index1, merge_index2, max_states,
            max_states_before_merge, shrink_threshold_before_merge,
            *shrink_strategy, log);
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
        // Merging
        int merged_index = fts.merge(merge_index1, merge_index2, log);
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

/*
  Collect derived variables that need a real axiom-induced abstract factor,
  filtered by the chosen axiom_factor_mode.

  NONE: returns an empty list — no axiom factors are built.

  ONLY_GOAL / ONLY_GOAL_CAPPED: includes only derived variables that appear
  directly in the planning goal. Purely precondition-derived variables are
  excluded. Goal-derived closures are small in practice, so ONLY_GOAL runs
  without a BFS work-estimate guard; ONLY_GOAL_CAPPED additionally applies
  the guard inside build_axiom_factor.

  ALL_CAPPED (default): includes goal-derived variables plus any derived
  variable read by an operator — either as a precondition or as a condition
  of a conditional effect — subject to the BFS work-estimate guard. Without
  this, operators whose applicability or conditional effects depend on a
  non-goal derived variable are unsound in the abstraction: that variable's
  plain atomic factor never changes (axioms, not operators, set derived
  values), so the operator looks permanently inapplicable, which can make a
  solvable task appear unsolvable even under exact bisimulation shrinking.

  In all modes, derived variables with zero axiom rules are excluded even if
  they pass the checks above: such a variable is a translator-introduced
  constant that never changes from its initial value, so its existing atomic
  factor is already correct. build_axiom_factor assumes its target variable
  has at least one axiom rule, so calling it on a rule-less variable would
  yield a degenerate empty closure.
*/
static vector<int> collect_relevant_derived_variables(
    const TaskProxy &task_proxy, AxiomFactorMode mode) {
    if (mode == AxiomFactorMode::NONE)
        return {};

    int num_variables = task_proxy.get_variables().size();
    vector<bool> needs_axiom_factor(num_variables, false);

    for (FactProxy goal : task_proxy.get_goals())
        if (goal.get_variable().is_derived())
            needs_axiom_factor[goal.get_variable().get_id()] = true;

    if (mode == AxiomFactorMode::ALL_CAPPED) {
        for (OperatorProxy op : task_proxy.get_operators()) {
            for (FactProxy pre : op.get_preconditions())
                if (pre.get_variable().is_derived())
                    needs_axiom_factor[pre.get_variable().get_id()] = true;
            for (EffectProxy eff : op.get_effects())
                for (FactProxy cond : eff.get_conditions())
                    if (cond.get_variable().is_derived())
                        needs_axiom_factor[cond.get_variable().get_id()] = true;
        }
    }

    vector<bool> has_axiom_rule(num_variables, false);
    for (OperatorProxy axiom : task_proxy.get_axioms())
        has_axiom_rule[axiom.get_effects()[0].get_fact().get_variable().get_id()] = true;

    vector<int> result;
    for (int var_id = 0; var_id < num_variables; ++var_id)
        if (needs_axiom_factor[var_id] && has_axiom_rule[var_id])
            result.push_back(var_id);
    return result;
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

    // Collect derived variables that need explicit axiom factors, filtered
    // by axiom_factor_mode. NONE returns an empty list (no factors built).
    // ONLY_GOAL / ONLY_GOAL_CAPPED include only goal-derived variables.
    // ALL_CAPPED (default) also includes precondition- and effect-condition-
    // derived variables. ShrinkQuasiBisimulation needs goal distances for
    // axiom factors, so goal-distance computation is forced on whenever the
    // list is non-empty.
    vector<int> derived_vars_needing_axiom_factor =
        collect_relevant_derived_variables(task_proxy, axiom_factor_mode);
    bool has_relevant_derived_vars = !derived_vars_needing_axiom_factor.empty();

    if (log.is_at_least_normal()) {
        log << "axiom_factor_mode=" << static_cast<int>(axiom_factor_mode)
            << ": selected " << derived_vars_needing_axiom_factor.size()
            << " derived variable(s) for axiom factors";
        for (int v : derived_vars_needing_axiom_factor)
            log << " var" << v;
        log << "." << endl;
    }

    const bool compute_init_distances =
        shrink_strategy->requires_init_distances() ||
        merge_strategy_factory->requires_init_distances() ||
        prune_unreachable_states;
    const bool compute_goal_distances =
        shrink_strategy->requires_goal_distances() ||
        merge_strategy_factory->requires_goal_distances() ||
        prune_irrelevant_states ||
        has_relevant_derived_vars;
    FactoredTransitionSystem fts = create_factored_transition_system(
        task_proxy, compute_init_distances, compute_goal_distances, log);
    if (log.is_at_least_normal()) {
        log_progress(timer, "after computation of atomic factors", log);
    }

    // Derived variables referenced in goals, operator preconditions, or
    // when-clause conditions whose S_d sets (primary-variable dependency
    // closures) overlap must be built as a single combined factor.
    // M&S requires each variable to be represented by exactly one live
    // factor at a time; building separate per-derived-variable factors that
    // share primary variables and bisimulation-shrinking them independently
    // destroys the correlation between the shared variables and produces
    // unsound abstract states.
    if (has_relevant_derived_vars) {
        const vector<int> &goal_derived_vars = derived_vars_needing_axiom_factor;

        vector<unordered_set<int>> primary_sets;
        primary_sets.reserve(goal_derived_vars.size());
        for (int d : goal_derived_vars)
            primary_sets.push_back(
                compute_axiom_factor_primary_vars(task_proxy, d));

        // Union-find over goal_derived_vars: merge any two whose S_d sets
        // intersect (transitively), so they end up in the same group.
        vector<int> uf_parent(goal_derived_vars.size());
        for (size_t i = 0; i < uf_parent.size(); ++i) uf_parent[i] = i;
        function<int(int)> uf_find = [&](int x) {
            while (uf_parent[x] != x)
                x = uf_parent[x] = uf_parent[uf_parent[x]];
            return x;
        };

        unordered_set<int> task_goal_derived;
        for (FactProxy g : task_proxy.get_goals())
            if (g.get_variable().is_derived())
                task_goal_derived.insert(g.get_variable().get_id());

        for (size_t i = 0; i < goal_derived_vars.size(); ++i)
            for (size_t j = i + 1; j < goal_derived_vars.size(); ++j) {
                // Never group a goal-derived variable with a non-goal-derived
                // variable: doing so adds N's operator constraints to G's
                // factor, which can make abstract distances exceed h* (inadmissible).
                bool i_goal = task_goal_derived.count(goal_derived_vars[i]);
                bool j_goal = task_goal_derived.count(goal_derived_vars[j]);
                if (i_goal != j_goal) continue;
                bool overlap = false;
                for (int v : primary_sets[j])
                    if (primary_sets[i].count(v)) { overlap = true; break; }
                if (overlap) {
                    int ri = uf_find(i), rj = uf_find(j);
                    if (ri != rj) uf_parent[ri] = rj;
                }
            }

        // Build one joint factor per equivalence class.
        unordered_map<int, vector<int>> groups;
        for (size_t i = 0; i < goal_derived_vars.size(); ++i)
            groups[uf_find(i)].push_back(goal_derived_vars[i]);

                for (auto &[root, derived_var_ids] : groups) {
            if (log.is_at_least_normal()) {
                log << "Building axiom factor for derived variable(s)";
                for (int d : derived_var_ids) log << " " << d;
                log << "." << endl;
            }

            // Build one joint product factor for all derived variables in
            // this group. The output parameters capture, for every reachable
            // abstract state, the exact values of the S_d primary variables
            // (pending_var_order gives the variable ids; pending_state_values
            // gives the corresponding value tuple per state). This information
            // is used below to prevent unsound shrinking while those primary
            // variables are still dually represented (see below).
            // apply_cap controls whether the pre-BFS work-estimate guard is
            // applied: true for ONLY_GOAL_CAPPED and ALL_CAPPED; false for
            // ONLY_GOAL, where goal-derived closures are small enough that
            // the guard is not needed.
            vector<int> pending_var_order;
            vector<vector<int>> pending_state_values;
            bool apply_cap = (axiom_factor_mode == AxiomFactorMode::ONLY_GOAL_CAPPED ||
                              axiom_factor_mode == AxiomFactorMode::ALL_CAPPED);
            int axiom_index = build_axiom_factor(
                task_proxy, derived_var_ids, fts, log,
                &pending_var_order, &pending_state_values, apply_cap);

            // Collapse dead-end axiom factor states (goal_dist=INF) into the
            // goal state. Task states mapping to dead-end axiom factor states
            // receive h=INF; if those task states can reach the goal in the
            // real task, this is inadmissible. Merging them into the goal
            // state gives h=0 (admissible: 0 <= h*).
            if (axiom_index >= 0) {
                const TransitionSystem &ax_ts =
                    fts.get_transition_system(axiom_index);
                const Distances &ax_d = fts.get_distances(axiom_index);
                int ax_size = ax_ts.get_size();
                if (ax_d.are_goal_distances_computed()) {
                    int goal_sink = -1;
                    for (int s = 0; s < ax_size; ++s)
                        if (ax_ts.is_goal_state(s)) { goal_sink = s; break; }
                    bool has_dead_ends = false;
                    for (int s = 0; s < ax_size; ++s)
                        if (ax_d.get_goal_distance(s) == INF) {
                            has_dead_ends = true; break;
                        }
                    if (has_dead_ends && goal_sink >= 0) {
                        StateEquivalenceRelation rel;
                        StateEquivalenceClass sink_class;
                        for (int s = 0; s < ax_size; ++s) {
                            if (s == goal_sink || ax_d.get_goal_distance(s) == INF) {
                                sink_class.push_front(s);
                            } else {
                                StateEquivalenceClass cls;
                                cls.push_front(s);
                                rel.push_back(move(cls));
                            }
                        }
                        rel.push_back(move(sink_class));
                        fts.apply_abstraction(axiom_index, rel, log);
                    }
                }
            }

            // Collapse each derived-variable atomic factor to a single
            // abstract state. Operators cannot set derived variables, so
            // those factors have no operator transitions and their initial
            // state (value=false) appears irrelevant to the goal
            // (value=true). Collapsing them prevents inadmissible h=INF
            // from irrelevance-pruning while still allowing the main loop
            // to merge them into the axiom factor later.
            for (int d : derived_var_ids) {
                if (fts.is_active(d)) {
                    int sz = fts.get_transition_system(d).get_size();
                    StateEquivalenceRelation relation(1);
                    for (int s = 0; s < sz; ++s)
                        relation[0].push_front(s);
                    fts.apply_abstraction(d, relation, log);
                }
            }

            // build_axiom_factor returns -1 when the BFS exceeded the
            // built-in state cap. In that case no factor was added to the
            // FTS, so no pending tracking is needed: the primary variables
            // remain represented only by their existing atomic factors and
            // can be shrunk freely by the main loop.
            if (axiom_index >= 0) {
                // Collect every primary variable that belongs to the S_d
                // closure of any derived variable in this group. Each of
                // these is now represented TWICE in the FTS: exactly (one
                // value per state) by its own atomic factor at index v, and
                // approximately (collapsed by bisimulation inside the axiom
                // factor) by the newly built axiom factor. The two must not
                // be shrunk in a way that makes them disagree, or the merged
                // product will contain abstract states with no concrete
                // counterpart (e.g. X=1 in one factor merged with X=2 in the
                // other).
                unordered_set<int> pending_vars;
                for (size_t i = 0; i < goal_derived_vars.size(); ++i)
                    if (uf_find(i) == root)
                        pending_vars.insert(
                            primary_sets[i].begin(), primary_sets[i].end());

                // Seed pending tracking for each atomic factor whose variable
                // is now pending. An atomic factor's states are already the
                // variable's values one-to-one, so the identity table is the
                // trivial pending-value representation: state s has value s.
                // This ensures the main loop applies the same no-lossy-shrink
                // constraint symmetrically to both sides of each pending pair.
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

                // Register the axiom factor itself with its pending set and
                // the per-state value table filled in by build_axiom_factor.
                // The main loop reads these to constrain shrinking and to
                // detect and handle absorption (when the axiom factor is
                // eventually merged with each pending atomic factor, that
                // variable leaves the pending set and inconsistent product
                // states are pruned).
                axiom_factor_pending_vars[axiom_index] = move(pending_vars);
                axiom_factor_pending_var_order[axiom_index] =
                    move(pending_var_order);
                axiom_factor_pending_values[axiom_index] =
                    move(pending_state_values);
            }

            if (log.is_at_least_normal())
                log_progress(timer, "after building axiom factor", log);
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
        bool effective_prune_irrelevant = prune_irrelevant_states && !is_axiom_factor && !is_derived_atomic;
        if (effective_prune_unreachable || effective_prune_irrelevant) {
            bool pruned_factor = prune_step(
                fts, index,
                effective_prune_unreachable, effective_prune_irrelevant,
                log);
            pruned = pruned || pruned_factor;
        }
        if (!is_axiom_factor && !is_derived_atomic && !fts.is_factor_solvable(index)) {
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

    feature.add_option<int>(
    "axiom_factor_mode",
    "Controls which derived variables receive explicit axiom factors. "
    "0=none, 1=only_goal (no BFS cap), 2=only_goal_capped, 3=all_capped (default).",
    "3",
    Bounds("0", "3"));
}

tuple<
    shared_ptr<MergeStrategyFactory>, shared_ptr<ShrinkStrategy>,
    shared_ptr<LabelReduction>, bool, bool, int, int, int, double,
    AxiomFactorMode>
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
    make_tuple(opts.get<double>("main_loop_max_time"),
               static_cast<AxiomFactorMode>(opts.get<int>("axiom_factor_mode"))));
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
