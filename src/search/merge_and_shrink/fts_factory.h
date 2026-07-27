#ifndef MERGE_AND_SHRINK_FTS_FACTORY_H
#define MERGE_AND_SHRINK_FTS_FACTORY_H

#include <unordered_set>
#include <vector>

/*
  Factory for factored transition systems.

  Takes a planning task and produces a factored transition system that
  represents the planning task. This provides the main bridge from
  planning tasks to the concepts on which merge-and-shrink abstractions
  are based (transition systems, labels, etc.). The "internal" classes of
  merge-and-shrink should not need to know about planning task concepts.
*/

class TaskProxy;

namespace utils {
class LogProxy;
}

namespace merge_and_shrink {
class FactoredTransitionSystem;

extern FactoredTransitionSystem create_factored_transition_system(
    const TaskProxy &task_proxy, bool compute_init_distances,
    bool compute_goal_distances, utils::LogProxy &log);

extern std::unordered_set<int> compute_axiom_factor_primary_vars(
    const TaskProxy &task_proxy, int derived_var_id);

/*
  Build the abstract factor Theta_{S,d} for the derived variable
  derived_var_id and inject it into fts via add_factor.

  The primary representation S_d is the union of all primary (non-derived)
  variables that appear in any axiom body for derived_var_id. The factor's
  states are all combined assignments to those variables. Goal states are
  the assignments that satisfy the primary preconditions of at least one
  axiom body for derived_var_id (derived preconditions are ignored; this
  is a safe over-approximation that preserves admissibility).

  Must be called before any M&S transformations (label reduction, shrinking,
  merging), so that all label IDs still correspond 1-to-1 to operators.

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
