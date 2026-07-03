#include "merge_scoring_function_total_order.h"

#include "factored_transition_system.h"
#include "transition_system.h"

#include "../task_proxy.h"

#include "../plugins/plugin.h"
#include "../utils/logging.h"
#include "../utils/markup.h"
#include "../utils/rng.h"
#include "../utils/rng_options.h"

#include <cassert>

using namespace std;

namespace merge_and_shrink {
MergeScoringFunctionTotalOrder::MergeScoringFunctionTotalOrder(
    AtomicTSOrder atomic_ts_order, ProductTSOrder product_ts_order,
    bool atomic_before_product, int random_seed)
    : atomic_ts_order(atomic_ts_order),
      product_ts_order(product_ts_order),
      atomic_before_product(atomic_before_product),
      random_seed(random_seed),
      rng(utils::get_rng(random_seed)) {
}

vector<double> MergeScoringFunctionTotalOrder::compute_scores(
    const FactoredTransitionSystem &,
    const vector<pair<int, int>> &merge_candidates) {
    assert(initialized);
    vector<double> scores;
    scores.reserve(merge_candidates.size());
    for (size_t candidate_index = 0; candidate_index < merge_candidates.size();
         ++candidate_index) {
        pair<int, int> merge_candidate = merge_candidates[candidate_index];
        int ts_index1 = merge_candidate.first;
        int ts_index2 = merge_candidate.second;
        for (size_t merge_candidate_order_index = 0;
             merge_candidate_order_index < merge_candidate_order.size();
             ++merge_candidate_order_index) {
            pair<int, int> other_candidate =
                merge_candidate_order[merge_candidate_order_index];
            if ((other_candidate.first == ts_index1 &&
                 other_candidate.second == ts_index2) ||
                (other_candidate.second == ts_index1 &&
                 other_candidate.first == ts_index2)) {
                // use the index in the merge candidate order as score
                scores.push_back(merge_candidate_order_index);
                break;
            }
        }
        // We must have inserted a score for the current candidate.
        assert(scores.size() == candidate_index + 1);
    }
        return scores;
}

namespace {
/*
  Count every derived variable that build_factored_transition_system will
  build a real axiom-induced factor Theta_{S,d} for: goal-derived variables,
  plus any derived variable read directly by an operator (as a precondition
  or as a condition of one of its conditional effects), excluding derived
  variables that have zero axiom rules (translator-introduced constants that
  never get a real factor). This must stay in sync with
  collect_relevant_derived_variables in merge_and_shrink_algorithm.cc:
  undercounting here desynchronizes transition_system_order/
  merge_candidate_order from the factors that actually exist in the FTS,
  causing compute_scores to fail to find a score for some merge candidates.
*/
static int count_relevant_derived_variables(const TaskProxy &task_proxy) {
    int num_variables = task_proxy.get_variables().size();
    vector<bool> needs_axiom_factor(num_variables, false);

    for (FactProxy goal : task_proxy.get_goals())
        if (goal.get_variable().is_derived())
            needs_axiom_factor[goal.get_variable().get_id()] = true;

    for (OperatorProxy op : task_proxy.get_operators()) {
        for (FactProxy precondition : op.get_preconditions())
            if (precondition.get_variable().is_derived())
                needs_axiom_factor[precondition.get_variable().get_id()] = true;
        for (EffectProxy effect : op.get_effects())
            for (FactProxy condition : effect.get_conditions())
                if (condition.get_variable().is_derived())
                    needs_axiom_factor[condition.get_variable().get_id()] = true;
    }

    vector<bool> has_axiom_rule(num_variables, false);
    for (OperatorProxy axiom : task_proxy.get_axioms())
        has_axiom_rule[axiom.get_effects()[0].get_fact().get_variable().get_id()] = true;

    int count = 0;
    for (int var_id = 0; var_id < num_variables; ++var_id)
        if (needs_axiom_factor[var_id] && has_axiom_rule[var_id])
            ++count;
    return count;
}
}

void MergeScoringFunctionTotalOrder::initialize(const TaskProxy &task_proxy) {
    initialized = true;
    // Axiom factors are inserted after atomic factors but before merging starts.
    // Include them so the precomputed order covers all initial factor indices.
    int num_variables = task_proxy.get_variables().size();
    int num_axiom_factors = count_relevant_derived_variables(task_proxy);
    int num_initial_factors = num_variables + num_axiom_factors;
    int max_transition_system_count = num_initial_factors * 2 - 1;
    vector<int> transition_system_order;
    transition_system_order.reserve(max_transition_system_count);

    // Compute the order in which atomic transition systems are considered
    vector<int> atomic_tso;
    atomic_tso.reserve(num_initial_factors);
    for (int i = 0; i < num_initial_factors; ++i) {
        atomic_tso.push_back(i);
    }
    if (atomic_ts_order == AtomicTSOrder::LEVEL) {
        reverse(atomic_tso.begin(), atomic_tso.end());
    } else if (atomic_ts_order == AtomicTSOrder::RANDOM) {
        rng->shuffle(atomic_tso);
    }

    // Compute the order in which product transition systems are considered
    vector<int> product_tso;
    for (int i = num_initial_factors; i < max_transition_system_count; ++i) {
        product_tso.push_back(i);
    }
    if (product_ts_order == ProductTSOrder::NEW_TO_OLD) {
        reverse(product_tso.begin(), product_tso.end());
    } else if (product_ts_order == ProductTSOrder::RANDOM) {
        rng->shuffle(product_tso);
    }

    // Put the orders in the correct order
    if (atomic_before_product) {
        transition_system_order.insert(
            transition_system_order.end(), atomic_tso.begin(),
            atomic_tso.end());
        transition_system_order.insert(
            transition_system_order.end(), product_tso.begin(),
            product_tso.end());
    } else {
        transition_system_order.insert(
            transition_system_order.end(), product_tso.begin(),
            product_tso.end());
        transition_system_order.insert(
            transition_system_order.end(), atomic_tso.begin(),
            atomic_tso.end());
    }

    merge_candidate_order.reserve(
        max_transition_system_count * max_transition_system_count / 2);
    for (size_t i = 0; i < transition_system_order.size(); ++i) {
        for (size_t j = i + 1; j < transition_system_order.size(); ++j) {
            merge_candidate_order.emplace_back(
                transition_system_order[i], transition_system_order[j]);
        }
    }
}

string MergeScoringFunctionTotalOrder::name() const {
    return "total order";
}

void MergeScoringFunctionTotalOrder::dump_function_specific_options(
    utils::LogProxy &log) const {
    if (log.is_at_least_normal()) {
        log << "Atomic transition system order: ";
        switch (atomic_ts_order) {
        case AtomicTSOrder::REVERSE_LEVEL:
            log << "reverse level";
            break;
        case AtomicTSOrder::LEVEL:
            log << "level";
            break;
        case AtomicTSOrder::RANDOM:
            log << "random";
            break;
        }
        log << endl;

        log << "Product transition system order: ";
        switch (product_ts_order) {
        case ProductTSOrder::OLD_TO_NEW:
            log << "old to new";
            break;
        case ProductTSOrder::NEW_TO_OLD:
            log << "new to old";
            break;
        case ProductTSOrder::RANDOM:
            log << "random";
            break;
        }
        log << endl;

        log << "Consider "
            << (atomic_before_product ? "atomic before product"
                                      : "product before atomic")
            << " transition systems" << endl;
        log << "Random seed: " << random_seed << endl;
    }
}

void MergeScoringFunctionTotalOrder::add_options_to_feature(
    plugins::Feature &feature) {
    feature.add_option<AtomicTSOrder>(
        "atomic_ts_order",
        "The order in which atomic transition systems are considered when "
        "considering pairs of potential merges.",
        "reverse_level");

    feature.add_option<ProductTSOrder>(
        "product_ts_order",
        "The order in which product transition systems are considered when "
        "considering pairs of potential merges.",
        "new_to_old");

    feature.add_option<bool>(
        "atomic_before_product",
        "Consider atomic transition systems before composite ones iff true.",
        "false");

    utils::add_rng_options_to_feature(feature);
}

class MergeScoringFunctionTotalOrderFeature
    : public plugins::TypedFeature<
          MergeScoringFunction, MergeScoringFunctionTotalOrder> {
public:
    MergeScoringFunctionTotalOrderFeature() : TypedFeature("total_order") {
        document_title("Total order");
        document_synopsis(
            "This scoring function computes a total order on the merge candidates, "
            "based on the specified options. The score for each merge candidate "
            "correponds to its position in the order. This scoring function is "
            "mainly intended as tie-breaking, and has been introduced in the "
            "following paper:" +
            utils::format_conference_reference(
                {"Silvan Sievers", "Martin Wehrle", "Malte Helmert"},
                "An Analysis of Merge Strategies for Merge-and-Shrink Heuristics",
                "https://ai.dmi.unibas.ch/papers/sievers-et-al-icaps2016.pdf",
                "Proceedings of the 26th International Conference on Automated "
                "Planning and Scheduling (ICAPS 2016)",
                "294-298", "AAAI Press", "2016") +
            "Furthermore, using the atomic_ts_order option, this scoring function, "
            "if used alone in a score based filtering merge selector, can be used "
            "to emulate the corresponding (precomputed) linear merge strategies "
            "reverse level/level (independently of the other options).");
        MergeScoringFunctionTotalOrder::add_options_to_feature(*this);
    }

    virtual shared_ptr<MergeScoringFunctionTotalOrder> create_component(
        const plugins::Options &opts) const override {
        return plugins::make_shared_from_arg_tuples<
            MergeScoringFunctionTotalOrder>(
            opts.get<AtomicTSOrder>("atomic_ts_order"),
            opts.get<ProductTSOrder>("product_ts_order"),
            opts.get<bool>("atomic_before_product"),
            utils::get_rng_arguments_from_options(opts));
    }
};

static plugins::FeaturePlugin<MergeScoringFunctionTotalOrderFeature> _plugin;

static plugins::TypedEnumPlugin<AtomicTSOrder> _atomic_ts_order_enum_plugin(
    {{"reverse_level", "the variable order of Fast Downward"},
     {"level", "opposite of reverse_level"},
     {"random", "a randomized order"}});

static plugins::TypedEnumPlugin<ProductTSOrder> _product_ts_order_enum_plugin(
    {{"old_to_new",
      "consider composite transition systems from oldest to most recent"},
     {"new_to_old", "opposite of old_to_new"},
     {"random", "a randomized order"}});
}
