#ifndef MERGE_AND_SHRINK_MERGE_AND_SHRINK_ALGORITHM_H
#define MERGE_AND_SHRINK_MERGE_AND_SHRINK_ALGORITHM_H

#include "../utils/logging.h"

#include <memory>
#include <unordered_map>
#include <unordered_set>
#include <vector>

class TaskProxy;

namespace plugins {
class ConstructContext;
class Feature;
class Options;
}

namespace utils {
class CountdownTimer;
}

namespace merge_and_shrink {
class FactoredTransitionSystem;
class LabelReduction;
class MergeStrategyFactory;
class ShrinkStrategy;

class MergeAndShrinkAlgorithm {
    // TODO: when the option parser supports it, the following should become
    // unique pointers.
    std::shared_ptr<MergeStrategyFactory> merge_strategy_factory;
    std::shared_ptr<ShrinkStrategy> shrink_strategy;
    std::shared_ptr<LabelReduction> label_reduction;

    // Options for shrinking
    // Hard limit: the maximum size of a transition system at any point.
    int max_states;
    // Hard limit: the maximum size of a transition system before being merged.
    int max_states_before_merge;
    /* A soft limit for triggering shrinking even if the hard limits
       max_states and max_states_before_merge are not violated. */
    int shrink_threshold_before_merge;

    // Options for pruning
    const bool prune_unreachable_states;
    const bool prune_irrelevant_states;

    mutable utils::LogProxy log;
    const double main_loop_max_time;

    long starting_peak_memory;

    /*
      For each axiom-induced factor (keyed by its FTS index at the time it
      was built), the set of primary variables (S_d) it embeds that have not
      yet been absorbed via merge as a standalone atomic factor. Bisimulation
      shrinking of such a factor is unsound while this set is non-empty: the
      same primary variable would otherwise be represented both exactly (in
      its still-separate atomic factor) and approximately (collapsed by
      bisimulation inside the axiom factor), and merging the two later does
      not enforce them to agree.
    */
    std::unordered_map<int, std::unordered_set<int>> axiom_factor_pending_vars;

    /*
      For each entry in axiom_factor_pending_vars, the exact value of those
      pending primary variables for every state of the factor at creation
      time: axiom_factor_pending_var_order[index] gives the variable ids (in
      the order used by axiom_factor_pending_values[index][state]). This lets
      the main loop shrink a pending axiom factor without ever collapsing two
      states that disagree on a pending variable's value (which would be
      unsound while that variable is still also represented exactly
      elsewhere), instead of forbidding shrinking it outright.
    */
    std::unordered_map<int, std::vector<int>> axiom_factor_pending_var_order;
    std::unordered_map<int, std::vector<std::vector<int>>>
        axiom_factor_pending_values;

    void report_peak_memory_delta(bool final = false) const;
    void dump_options() const;
    void warn_on_unusual_options() const;
    bool ran_out_of_time(const utils::CountdownTimer &timer) const;
    void statistics(int maximum_intermediate_size) const;
    void main_loop(FactoredTransitionSystem &fts, const TaskProxy &task_proxy);
public:
    MergeAndShrinkAlgorithm(
        const std::shared_ptr<MergeStrategyFactory> &merge_strategy,
        const std::shared_ptr<ShrinkStrategy> &shrink_strategy,
        const std::shared_ptr<LabelReduction> &label_reduction,
        bool prune_unreachable_states, bool prune_irrelevant_states,
        int max_states, int max_states_before_merge, int threshold_before_merge,
        double main_loop_max_time, utils::Verbosity verbosity);
    FactoredTransitionSystem build_factored_transition_system(
        const TaskProxy &task_proxy);
};

extern std::tuple<int, int, int> handle_shrink_limit_defaults(
    int max_states, int max_states_before_merge,
    int shrink_threshold_before_merge, utils::LogProxy &log);
extern void add_merge_and_shrink_algorithm_options_to_feature(
    plugins::Feature &feature);
std::tuple<
    std::shared_ptr<MergeStrategyFactory>, std::shared_ptr<ShrinkStrategy>,
    std::shared_ptr<LabelReduction>, bool, bool, int, int, int, double>
get_merge_and_shrink_algorithm_arguments_from_options(
    const plugins::Options &opts);
extern void add_transition_system_size_limit_options_to_feature(
    plugins::Feature &feature);
std::tuple<int, int, int>
get_transition_system_size_limit_arguments_from_options(
    const plugins::Options &opts);
}

#endif
