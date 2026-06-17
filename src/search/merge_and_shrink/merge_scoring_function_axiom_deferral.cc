#include "merge_scoring_function_axiom_deferral.h"

#include "factored_transition_system.h"
#include "transition_system.h"
#include "utils.h"

#include "../plugins/plugin.h"

using namespace std;

namespace merge_and_shrink {
vector<double> MergeScoringFunctionAxiomDeferral::compute_scores(
    const FactoredTransitionSystem &fts,
    const vector<pair<int, int>> &merge_candidates) {
    // Score 0 (best) iff neither side is axiom-derived; score 1 otherwise.
    // Combined with score_based_filtering, this keeps any non-axiom merge
    // candidate strictly preferred over one touching an axiom-derived
    // factor, until no such candidate remains.
    vector<double> scores;
    scores.reserve(merge_candidates.size());
    for (pair<int, int> merge_candidate : merge_candidates) {
        const TransitionSystem &ts1 =
            fts.get_transition_system(merge_candidate.first);
        const TransitionSystem &ts2 =
            fts.get_transition_system(merge_candidate.second);
        double score =
            (ts1.is_axiom_derived() || ts2.is_axiom_derived()) ? 1 : 0;
        scores.push_back(score);
    }
    return scores;
}

string MergeScoringFunctionAxiomDeferral::name() const {
    return "axiom deferral";
}

class MergeScoringFunctionAxiomDeferralFeature
    : public plugins::TypedFeature<
          MergeScoringFunction, MergeScoringFunctionAxiomDeferral> {
public:
    MergeScoringFunctionAxiomDeferralFeature()
        : TypedFeature("axiom_deferral") {
        document_title("Axiom deferral scoring");
        document_synopsis(
            "This scoring function assigns a merge candidate a value of 0 iff "
            "neither transition system of the candidate is axiom-derived, and "
            "a value of 1 otherwise. Used to defer merging axiom-derived "
            "factors until no other merge candidate remains, so that "
            "bisimulation-based shrinking is never applied to a partial "
            "axiom-derived composite.");
    }

    virtual shared_ptr<MergeScoringFunctionAxiomDeferral> create_component(
        const plugins::Options &) const override {
        return make_shared<MergeScoringFunctionAxiomDeferral>();
    }
};

static plugins::FeaturePlugin<MergeScoringFunctionAxiomDeferralFeature> _plugin;
}