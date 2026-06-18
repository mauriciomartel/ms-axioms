#ifndef MERGE_AND_SHRINK_SHRINK_QUASI_BISIMULATION_H
#define MERGE_AND_SHRINK_SHRINK_QUASI_BISIMULATION_H

#include "shrink_strategy.h"

namespace merge_and_shrink {
struct Signature;

/*
  Shrink strategy based on quasi-bisimulation rather than standard bisimulation.

  Standard bisimulation requires that equivalent states mirror each other's
  transitions exactly: if s1 ~ s2 and s1 --l--> t1, then s2 must also have an
  l-transition to some t2 ~ t1 (and vice versa).

  Quasi-bisimulation relaxes condition QBISIM2: if s1 ~Q s2 and s1 --l--> t1,
  then EITHER s2 has no l-transition at all, OR s2 --l--> t2 for some t2 ~Q t1.
  A state without an l-transition is therefore allowed to be equivalent to a
  state that does have one.

  This coarser notion is needed for derived variables (axioms), whose
  "transitions" are implicitly encoded in the axiom rules rather than appearing
  as explicit transitions in their atomic factor. When building the auxiliary
  transition system Theta_{S,d} for a derived goal variable d, some states will
  naturally lack transitions under certain labels, and standard bisimulation
  would split them off unnecessarily.
*/
class ShrinkQuasiBisimulation : public ShrinkStrategy {
    /*
      Partition states into initial groups: goal states in group 0, non-goal
      states grouped by h (goal distance). This is the same starting partition
      used by standard bisimulation; the quasi-bisimulation modification only
      affects how signatures are computed in subsequent refinement rounds.

      If seed is non-null, it must assign every state an additional "must not
      collapse" class id (e.g. the exact value tuple of variables that are not
      yet allowed to be abstracted away). States with different seed values
      are always placed in different initial groups, on top of the usual
      goal/h-based split; since refinement only ever splits groups further,
      this guarantees the seed classes are never merged across.
    */
    int initialize_groups(
        const TransitionSystem &ts, const Distances &distances,
        std::vector<int> &state_to_group,
        const std::vector<int> *seed = nullptr) const;

    /*
      Compute a signature for each state that encodes its current group and
      successor behaviour. Two states get the same signature iff they should
      not be split in this round.

      Unlike standard bisimulation, states that have no outgoing transition
      under a label are given a "wildcard" entry for that label rather than
      an empty slot. This prevents them from being split into a separate
      partition from states that do have transitions under the same label.
    */
    void compute_signatures(
        const TransitionSystem &ts, const Distances &distances,
        std::vector<Signature> &signatures,
        const std::vector<int> &state_to_group) const;

    /*
      Shared refinement loop used by both compute_equivalence_relation and
      compute_equivalence_relation_with_seed. state_to_group/num_groups must
      already hold the initial partition (see initialize_groups); this
      function only ever splits groups further, so whatever distinctions the
      initial partition already encodes (h/goal, and optionally a seed class)
      are preserved in the result.
    */
    StateEquivalenceRelation refine_and_build_relation(
        const TransitionSystem &ts, const Distances &distances,
        int target_size, std::vector<int> &state_to_group,
        int num_groups) const;
protected:
    virtual void dump_strategy_specific_options(
        utils::LogProxy &log) const override;
    virtual std::string name() const override;
public:
    ShrinkQuasiBisimulation() = default;
    virtual StateEquivalenceRelation compute_equivalence_relation(
        const TransitionSystem &ts, const Distances &distances, int target_size,
        utils::LogProxy &log) const override;

    /*
      Like compute_equivalence_relation, but additionally guarantees that two
      states are only ever placed in the same equivalence class if they agree
      on seed[state] (see initialize_groups). Used to shrink axiom-derived
      factors that still embed primary variables not yet exclusively
      represented by this factor: collapsing two states that disagree on the
      exact value of such a variable would be unsound, since the variable is
      still also tracked exactly elsewhere in the FTS.
    */
    StateEquivalenceRelation compute_equivalence_relation_with_seed(
        const TransitionSystem &ts, const Distances &distances, int target_size,
        const std::vector<int> &seed, utils::LogProxy &log) const;

    virtual bool requires_init_distances() const override {
        return false;
    }

    virtual bool requires_goal_distances() const override {
        return true;
    }
};
}

#endif