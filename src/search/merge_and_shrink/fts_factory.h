#ifndef MERGE_AND_SHRINK_FTS_FACTORY_H
#define MERGE_AND_SHRINK_FTS_FACTORY_H

/*
  Factory for factored transition systems.

  Takes a planning task and produces a factored transition system that
  represents the planning task. This provides the main bridge from
  planning tasks to the concepts on which merge-and-shrink abstractions
  are based (transition systems, labels, etc.). The "internal" classes of
  merge-and-shrink should not need to know about planning task concepts.
*/

#include <unordered_set>
#include <vector>

class TaskProxy;

namespace utils {
class LogProxy;
}

namespace merge_and_shrink {
class FactoredTransitionSystem;

extern FactoredTransitionSystem create_factored_transition_system(
    const TaskProxy &task_proxy, bool compute_init_distances,
    bool compute_goal_distances, utils::LogProxy &log);

/*
  Compute S_d: the union of all primary (non-derived) variables that the
  derived variable derived_var_id transitively depends on via axiom bodies.
*/
extern std::unordered_set<int> compute_axiom_factor_primary_vars(
    const TaskProxy &task_proxy, int derived_var_id);

/*
  Build the abstract factor Theta_{S,d} for the derived variables in
  derived_var_ids and inject it into fts via add_factor.

  S_d is the union of all primary (non-derived) variables that appear in any
  axiom body for any variable in derived_var_ids (transitively, following
  dependencies between derived variables). The factor's states are all
  combined assignments to those variables. A state is a goal state iff every
  variable in derived_var_ids evaluates to its goal value there after full
  stratified axiom evaluation.

  All derived goal variables whose S_d sets overlap (share at least one
  primary variable) must be passed together in a single call. M&S requires
  that each variable be represented by exactly one live factor at a time;
  building separate factors with overlapping primary variables, each
  bisimulation-shrunk independently before being merged, would destroy the
  correlation between the shared variables and produce unsound (spuriously
  inconsistent) abstract states once merged.

  Must be called before any M&S transformations (label reduction, shrinking,
  merging), so that all label IDs still correspond 1-to-1 to operators.

  If out_pending_var_order and out_state_pending_values are both non-null,
  they are filled with the exact assignment, for every state of the newly
  built factor, of the primary variables in S_d: out_pending_var_order holds
  the variable ids (sorted, matching the factor's incorporated_variables),
  and out_state_pending_values[s] holds the corresponding values for state s,
  aligned with out_pending_var_order. This lets callers track the exact value
  of these variables through later merges/shrinks, which is needed to safely
  shrink the factor before all of S_d has been exclusively absorbed into it
  (see MergeAndShrinkAlgorithm::axiom_factor_pending_vars).

  Returns the index of the newly added factor in the FTS.
*/
extern int build_axiom_factor(
    const TaskProxy &task_proxy,
    const std::vector<int> &derived_var_ids,
    FactoredTransitionSystem &fts,
    utils::LogProxy &log,
    std::vector<int> *out_pending_var_order = nullptr,
    std::vector<std::vector<int>> *out_state_pending_values = nullptr);
}

#endif
