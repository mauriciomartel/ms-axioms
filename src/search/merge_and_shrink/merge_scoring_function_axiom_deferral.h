#ifndef MERGE_AND_SHRINK_MERGE_SCORING_FUNCTION_AXIOM_DEFERRAL_H
#define MERGE_AND_SHRINK_MERGE_SCORING_FUNCTION_AXIOM_DEFERRAL_H

#include "merge_scoring_function.h"

namespace merge_and_shrink {
/*
  Scores merge candidates so that merging an axiom-derived factor is always
  deprioritized relative to a candidate that avoids it. Placed first in a
  scoring_functions list, this defers axiom-derived merges until they are
  the only candidates left, preventing bisimulation-based shrinking from
  ever running on a partial (incompletely merged) axiom-derived factor.
*/
class MergeScoringFunctionAxiomDeferral : public MergeScoringFunction {
    virtual std::string name() const override;
public:
    MergeScoringFunctionAxiomDeferral() = default;
    virtual std::vector<double> compute_scores(
        const FactoredTransitionSystem &fts,
        const std::vector<std::pair<int, int>> &merge_candidates) override;

    virtual bool requires_init_distances() const override {
        return false;
    }

    virtual bool requires_goal_distances() const override {
        return false;
    }
};
}

#endif