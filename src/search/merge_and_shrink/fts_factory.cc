#include "fts_factory.h"
#include "primary_representation.h"

#include "distances.h"
#include "factored_transition_system.h"
#include "labels.h"
#include "merge_and_shrink_representation.h"
#include "transition_system.h"
#include "types.h"

#include "../task_proxy.h"

#include "../utils/collections.h"
#include "../utils/logging.h"

#include <algorithm>
#include <cassert>
#include <functional>
#include <iostream>
#include <queue>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace std;

namespace merge_and_shrink {
class FTSFactory {
    const TaskProxy &task_proxy;

    struct TransitionSystemData {
        // The following two attributes are only used for statistics
        int num_variables;
        vector<int> incorporated_variables;

        vector<int> label_to_local_label;
        vector<LocalLabelInfo> local_label_infos;
        vector<bool> relevant_labels;
        int num_states;
        vector<bool> goal_states;
        int init_state;
        TransitionSystemData(TransitionSystemData &&other)
            : num_variables(other.num_variables),
              incorporated_variables(move(other.incorporated_variables)),
              label_to_local_label(move(other.label_to_local_label)),
              local_label_infos(move(other.local_label_infos)),
              relevant_labels(move(other.relevant_labels)),
              num_states(other.num_states),
              goal_states(move(other.goal_states)),
              init_state(other.init_state) {
        }
        TransitionSystemData() = default;
        TransitionSystemData(TransitionSystemData &other) = delete;
        TransitionSystemData &operator=(TransitionSystemData &other) = delete;
    };
    vector<TransitionSystemData> transition_system_data_by_var;
    // see TODO in build_transitions()
    int task_has_conditional_effects;

    unique_ptr<Labels> create_labels();
    void build_state_data(VariableProxy var,
                      const std::vector<PrimaryRepresentation> &derived_goal_reprs);
    void initialize_transition_system_data(const Labels &labels);
    bool is_relevant(int var_id, int label) const;
    void mark_as_relevant(int var_id, int label);
    unordered_map<int, int> compute_preconditions(OperatorProxy op);
    void handle_operator_effect(
        OperatorProxy op, EffectProxy effect,
        const unordered_map<int, int> &pre_val, vector<bool> &has_effect_on_var,
        vector<vector<Transition>> &transitions_by_var);
    void handle_operator_precondition(
        OperatorProxy op, FactProxy precondition,
        const vector<bool> &has_effect_on_var,
        vector<vector<Transition>> &transitions_by_var);
    void build_transitions_for_operator(OperatorProxy op);
    void build_transitions_for_irrelevant_ops(
        const VariableProxy &variable, const Labels &labels);
    void build_transitions(const Labels &labels);
    vector<unique_ptr<TransitionSystem>> create_transition_systems(
        const Labels &labels);
    vector<unique_ptr<MergeAndShrinkRepresentation>>
    create_mas_representations() const;
    vector<unique_ptr<Distances>> create_distances(
        const vector<unique_ptr<TransitionSystem>> &transition_systems) const;
public:
    explicit FTSFactory(const TaskProxy &task_proxy);
    ~FTSFactory();

    /*
      Note: create() may only be called once. We don't worry about
      misuse because the class is only used internally in this file.
    */
    FactoredTransitionSystem create(
        bool compute_init_distances, bool compute_goal_distances,
        utils::LogProxy &log);
};

FTSFactory::FTSFactory(const TaskProxy &task_proxy)
    : task_proxy(task_proxy), task_has_conditional_effects(false) {
}

FTSFactory::~FTSFactory() {
}

unique_ptr<Labels> FTSFactory::create_labels() {
    vector<int> label_costs;
    OperatorsProxy ops = task_proxy.get_operators();
    int num_ops = ops.size();
    int max_num_labels = 0;
    if (num_ops > 0) {
        max_num_labels = 2 * num_ops - 1;
        label_costs.reserve(max_num_labels);
        for (OperatorProxy op : ops) {
            label_costs.push_back(op.get_cost());
        }
    }
    return make_unique<Labels>(move(label_costs), max_num_labels);
}

void FTSFactory::build_state_data(
    VariableProxy var,
    const vector<PrimaryRepresentation> &derived_goal_reprs) {
    int var_id = var.get_id();
    TransitionSystemData &ts_data = transition_system_data_by_var[var_id];
    ts_data.init_state = task_proxy.get_initial_state()[var_id].get_value();

    int range = task_proxy.get_variables()[var_id].get_domain_size();
    ts_data.num_states = range;

    // Find the goal value for this variable, if any (-1 means no goal condition).
    int goal_value = -1;
    GoalsProxy goals = task_proxy.get_goals();
    for (FactProxy goal : goals) {
        if (goal.get_variable().get_id() == var_id) {
            assert(goal_value == -1);
            goal_value = goal.get_value();
            break;
        }
    }

    // Derived variables have no operator transitions; their goal condition is
    // fully encoded in the axiom factor Θ_{S,d}. Mark all states as goals so
    // the atomic factor does not falsely declare the task unsolvable.
    if (var.is_derived())
        goal_value = -1;

    ts_data.goal_states.resize(range, false);
    for (int value = 0; value < range; ++value) {
        if (value == goal_value || goal_value == -1) {
            /*
              Apply the (·)^A transformation for primary variables:
              a value is a goal state only if it is compatible with every
              derived goal variable, i.e., it lies in the projection of S_d
              onto this variable's domain. Derived variables are left
              unchanged — their goal states are determined by the goal value
              of the derived variable itself, not by axiom rule structure.
            */
            bool compatible = true;
            if (!var.is_derived()) {
                for (const PrimaryRepresentation &pr : derived_goal_reprs) {
                    if (!pr.is_compatible(var_id, value)) {
                        compatible = false;
                        break;
                    }
                }
            }
            ts_data.goal_states[value] = compatible;
        }
    }
}

void FTSFactory::initialize_transition_system_data(const Labels &labels) {
    VariablesProxy variables = task_proxy.get_variables();
    transition_system_data_by_var.resize(variables.size());

    /*
      Precompute primary representations for all derived variables that
      appear in the goal. Each PrimaryRepresentation encodes, for every
      primary variable v and value c, whether c is compatible with the
      derived goal variable being true (i.e., whether v=c lies in the
      projection of S_d). These are passed to build_state_data so that
      goal states in atomic factors are restricted accordingly.
    */
    vector<PrimaryRepresentation> derived_goal_reprs;
    for (FactProxy goal : task_proxy.get_goals()) {
        if (goal.get_variable().is_derived()) {
            derived_goal_reprs.emplace_back(task_proxy,
                                            goal.get_variable().get_id());
        }
    }

    for (VariableProxy var : variables) {
        TransitionSystemData &ts_data =
            transition_system_data_by_var[var.get_id()];
        ts_data.num_variables = variables.size();
        ts_data.incorporated_variables.push_back(var.get_id());
        ts_data.label_to_local_label.resize(labels.get_max_num_labels(), -1);
        ts_data.relevant_labels.resize(labels.get_num_total_labels(), false);
        build_state_data(var, derived_goal_reprs);
    }
}

bool FTSFactory::is_relevant(int var_id, int label) const {
    return transition_system_data_by_var[var_id].relevant_labels[label];
}

void FTSFactory::mark_as_relevant(int var_id, int label) {
    transition_system_data_by_var[var_id].relevant_labels[label] = true;
}

unordered_map<int, int> FTSFactory::compute_preconditions(OperatorProxy op) {
    unordered_map<int, int> pre_val;
    for (FactProxy precondition : op.get_preconditions())
        pre_val[precondition.get_variable().get_id()] =
            precondition.get_value();
    return pre_val;
}

void FTSFactory::handle_operator_effect(
    OperatorProxy op, EffectProxy effect,
    const unordered_map<int, int> &pre_val, vector<bool> &has_effect_on_var,
    vector<vector<Transition>> &transitions_by_var) {
    int label = op.get_id();
    FactProxy fact = effect.get_fact();
    VariableProxy var = fact.get_variable();
    int var_id = var.get_id();
    has_effect_on_var[var_id] = true;
    int post_value = fact.get_value();

    // Determine possible values that var can have when this
    // operator is applicable.
    int pre_value = -1;
    auto pre_val_it = pre_val.find(var_id);
    if (pre_val_it != pre_val.end())
        pre_value = pre_val_it->second;
    int pre_value_min, pre_value_max;
    if (pre_value == -1) {
        pre_value_min = 0;
        pre_value_max = var.get_domain_size();
    } else {
        pre_value_min = pre_value;
        pre_value_max = pre_value + 1;
    }

    /*
      cond_effect_pre_value == x means that the effect has an
      effect condition "var == x".
      cond_effect_pre_value == -1 means no effect condition on var.
      has_other_effect_cond is true iff there exists an effect
      condition on a variable other than var.
    */
    EffectConditionsProxy effect_conditions = effect.get_conditions();
    int cond_effect_pre_value = -1;
    bool has_other_effect_cond = false;
    for (FactProxy condition : effect_conditions) {
        if (condition.get_variable() == var) {
            cond_effect_pre_value = condition.get_value();
        } else {
            has_other_effect_cond = true;
        }
    }

    // Handle transitions that occur when the effect triggers.
    for (int value = pre_value_min; value < pre_value_max; ++value) {
        /*
          Only add a transition if it is possible that the effect
          triggers. We can rule out that the effect triggers if it has
          a condition on var and this condition is not satisfied.
        */
        if (cond_effect_pre_value == -1 || cond_effect_pre_value == value)
            transitions_by_var[var_id].emplace_back(value, post_value);
    }

    // Handle transitions that occur when the effect does not trigger.
    if (!effect_conditions.empty()) {
        for (int value = pre_value_min; value < pre_value_max; ++value) {
            /*
              Add self-loop if the effect might not trigger.
              If the effect has a condition on another variable, then
              it can fail to trigger no matter which value var has.
              If it only has a condition on var, then the effect
              fails to trigger if this condition is false.
            */
            if (has_other_effect_cond || value != cond_effect_pre_value)
                transitions_by_var[var_id].emplace_back(value, value);
        }
        task_has_conditional_effects = true;
    }
    mark_as_relevant(var_id, label);
}

void FTSFactory::handle_operator_precondition(
    OperatorProxy op, FactProxy precondition,
    const vector<bool> &has_effect_on_var,
    vector<vector<Transition>> &transitions_by_var) {
    int label = op.get_id();
    int var_id = precondition.get_variable().get_id();
    if (!has_effect_on_var[var_id]) {
        int value = precondition.get_value();
        transitions_by_var[var_id].emplace_back(value, value);
        mark_as_relevant(var_id, label);
    }
}

void FTSFactory::build_transitions_for_operator(OperatorProxy op) {
    /*
      - Mark op as relevant in the transition systems corresponding
        to variables on which it has a precondition or effect.
      - Add transitions induced by op in these transition systems.
    */
    unordered_map<int, int> pre_val = compute_preconditions(op);
    int num_variables = task_proxy.get_variables().size();
    vector<bool> has_effect_on_var(task_proxy.get_variables().size(), false);
    vector<vector<Transition>> transitions_by_var(num_variables);

    for (EffectProxy effect : op.get_effects())
        handle_operator_effect(
            op, effect, pre_val, has_effect_on_var, transitions_by_var);

    /*
      We must handle preconditions *after* effects because handling
      the effects sets has_effect_on_var.
    */
    for (FactProxy precondition : op.get_preconditions())
        handle_operator_precondition(
            op, precondition, has_effect_on_var, transitions_by_var);

    int label = op.get_id();
    int label_cost = op.get_cost();
    for (int var_id = 0; var_id < num_variables; ++var_id) {
        if (!is_relevant(var_id, label)) {
            /*
              We do not want to add transitions of irrelevant labels here,
              since they are handled together in a separate step.
            */
            continue;
        }
        vector<Transition> &transitions = transitions_by_var[var_id];
        /*
          TODO: Our method for generating transitions is only guarantueed
          to generate sorted and unique transitions if the task has no
          conditional effects.
        */
        if (task_has_conditional_effects) {
            utils::sort_unique(transitions);
        } else {
            assert(utils::is_sorted_unique(transitions));
        }

        vector<int> &label_to_local_label =
            transition_system_data_by_var[var_id].label_to_local_label;
        vector<LocalLabelInfo> &local_label_infos =
            transition_system_data_by_var[var_id].local_label_infos;
        bool found_locally_equivalent_label_group = false;
        for (size_t local_label = 0; local_label < local_label_infos.size();
             ++local_label) {
            LocalLabelInfo &local_label_info = local_label_infos[local_label];
            const vector<Transition> &local_label_transitions =
                local_label_info.get_transitions();
            if (transitions == local_label_transitions) {
                assert(label_to_local_label[label] == -1);
                label_to_local_label[label] = local_label;
                local_label_info.add_label(label, label_cost);
                found_locally_equivalent_label_group = true;
                break;
            }
        }

        if (!found_locally_equivalent_label_group) {
            int new_local_label = local_label_infos.size();
            LabelGroup label_group = {label};
            local_label_infos.emplace_back(
                move(label_group), move(transitions), label_cost);
            assert(label_to_local_label[label] == -1);
            label_to_local_label[label] = new_local_label;
        }
    }
}

void FTSFactory::build_transitions_for_irrelevant_ops(
    const VariableProxy &variable, const Labels &labels) {
    int var_id = variable.get_id();
    int num_states = variable.get_domain_size();

    // Collect all irrelevant labels for this variable.
    LabelGroup irrelevant_labels;
    int cost = INF;
    for (int label : labels) {
        if (!is_relevant(var_id, label)) {
            irrelevant_labels.push_back(label);
            cost = min(cost, labels.get_label_cost(label));
        }
    }

    TransitionSystemData &ts_data = transition_system_data_by_var[var_id];
    if (!irrelevant_labels.empty()) {
        vector<Transition> transitions;
        transitions.reserve(num_states);
        for (int state = 0; state < num_states; ++state)
            transitions.emplace_back(state, state);
        int new_local_label = ts_data.local_label_infos.size();
        for (int label : irrelevant_labels) {
            assert(ts_data.label_to_local_label[label] == -1);
            ts_data.label_to_local_label[label] = new_local_label;
        }
        ts_data.local_label_infos.emplace_back(
            move(irrelevant_labels), move(transitions), cost);
    }
}

void FTSFactory::build_transitions(const Labels &labels) {
    /*
      - Compute all transitions of all operators for all variables, grouping
        transitions of locally equivalent labels for a given variable.
      - Computes relevant operator information as a side effect.
    */
    for (OperatorProxy op : task_proxy.get_operators())
        build_transitions_for_operator(op);

    /*
      Compute transitions of irrelevant operators for each variable only
      once and put the labels into a single label group.
    */
    for (VariableProxy variable : task_proxy.get_variables())
        build_transitions_for_irrelevant_ops(variable, labels);
}

vector<unique_ptr<TransitionSystem>> FTSFactory::create_transition_systems(
    const Labels &labels) {
    // Create the actual TransitionSystem objects.
    int num_variables = task_proxy.get_variables().size();

    // We reserve space for the transition systems added later by merging.
    vector<unique_ptr<TransitionSystem>> result;
    assert(num_variables >= 1);
    result.reserve(num_variables * 2 - 1);

    for (int var_id = 0; var_id < num_variables; ++var_id) {
        TransitionSystemData &ts_data = transition_system_data_by_var[var_id];
        result.push_back(make_unique<TransitionSystem>(
            ts_data.num_variables, move(ts_data.incorporated_variables), labels,
            move(ts_data.label_to_local_label), move(ts_data.local_label_infos),
            ts_data.num_states, move(ts_data.goal_states), ts_data.init_state));
    }
    return result;
}

vector<unique_ptr<MergeAndShrinkRepresentation>>
FTSFactory::create_mas_representations() const {
    // Create the actual MergeAndShrinkRepresentation objects.
    int num_variables = task_proxy.get_variables().size();

    // We reserve space for the transition systems added later by merging.
    vector<unique_ptr<MergeAndShrinkRepresentation>> result;
    assert(num_variables >= 1);
    result.reserve(num_variables * 2 - 1);

    for (int var_id = 0; var_id < num_variables; ++var_id) {
        int range = task_proxy.get_variables()[var_id].get_domain_size();
        result.push_back(
            make_unique<MergeAndShrinkRepresentationLeaf>(var_id, range));
    }
    return result;
}

vector<unique_ptr<Distances>> FTSFactory::create_distances(
    const vector<unique_ptr<TransitionSystem>> &transition_systems) const {
    // Create the actual Distances objects.
    int num_variables = task_proxy.get_variables().size();

    // We reserve space for the transition systems added later by merging.
    vector<unique_ptr<Distances>> result;
    assert(num_variables >= 1);
    result.reserve(num_variables * 2 - 1);

    for (int var_id = 0; var_id < num_variables; ++var_id) {
        result.push_back(make_unique<Distances>(*transition_systems[var_id]));
    }
    return result;
}

FactoredTransitionSystem FTSFactory::create(
    const bool compute_init_distances, const bool compute_goal_distances,
    utils::LogProxy &log) {
    if (log.is_at_least_normal()) {
        log << "Building atomic transition systems... " << endl;
    }

    unique_ptr<Labels> labels = create_labels();

    initialize_transition_system_data(*labels);
    build_transitions(*labels);
    vector<unique_ptr<TransitionSystem>> transition_systems =
        create_transition_systems(*labels);
    vector<unique_ptr<MergeAndShrinkRepresentation>> mas_representations =
        create_mas_representations();
    vector<unique_ptr<Distances>> distances =
        create_distances(transition_systems);

    return FactoredTransitionSystem(
        move(labels), move(transition_systems), move(mas_representations),
        move(distances), compute_init_distances, compute_goal_distances, log);
}

FactoredTransitionSystem create_factored_transition_system(
    const TaskProxy &task_proxy, const bool compute_init_distances,
    const bool compute_goal_distances, utils::LogProxy &log) {
    return FTSFactory(task_proxy)
        .create(compute_init_distances, compute_goal_distances, log);
}

int build_axiom_factor(
    const TaskProxy &task_proxy,
    int derived_var_id,
    FactoredTransitionSystem &fts,
    utils::LogProxy &log) {

    const Labels &labels = fts.get_labels();
    VariablesProxy variables = task_proxy.get_variables();
    int num_total_vars = variables.size();

    // Step 1: Identify primary variables in S_d via transitive dependency BFS.
    // Derived variables can depend on other derived variables ("blocked" ->
    // "blocked-trans" -> primary var), so we must follow the chain.
    unordered_set<int> visited_derived;
    queue<int> derived_queue;
    derived_queue.push(derived_var_id);
    visited_derived.insert(derived_var_id);
    unordered_set<int> primary_var_set;

    // === DEBUG: BFS axiom analysis ===
    {
        int total_axioms = 0;
        for (OperatorProxy ax : task_proxy.get_axioms()) { (void)ax; ++total_axioms; }
        std::cerr << "[BFS_DEBUG] var=" << derived_var_id
                  << " name=" << task_proxy.get_variables()[derived_var_id].get_name()
                  << " total_axioms=" << total_axioms << "\n";
        // Print per-variable axiom counts and precondition types
        std::unordered_map<int,int> eff_counts;
        for (OperatorProxy ax : task_proxy.get_axioms()) {
            int vid = ax.get_effects()[0].get_fact().get_variable().get_id();
            eff_counts[vid]++;
        }
        for (auto &kv : eff_counts) {
            std::cerr << "  axioms for var " << kv.first
                      << " (" << task_proxy.get_variables()[kv.first].get_name()
                      << " derived=" << task_proxy.get_variables()[kv.first].is_derived()
                      << "): " << kv.second << "\n";
        }
    }
    // === END DEBUG ===

    while (!derived_queue.empty()) {
        int cur_derived = derived_queue.front();
        derived_queue.pop();
        for (OperatorProxy axiom : task_proxy.get_axioms()) {
            EffectProxy eff = axiom.get_effects()[0];
            if (eff.get_fact().get_variable().get_id() != cur_derived)
                continue;
            for (FactProxy pre : axiom.get_preconditions()) {
                VariableProxy pvar = pre.get_variable();
                if (pvar.is_derived()) {
                    if (!visited_derived.count(pvar.get_id())) {
                        visited_derived.insert(pvar.get_id());
                        derived_queue.push(pvar.get_id());
                    }
                } else {
                    primary_var_set.insert(pvar.get_id());
                }
            }
        }
    }

    vector<int> var_ids(primary_var_set.begin(), primary_var_set.end());
    sort(var_ids.begin(), var_ids.end());
    int n = var_ids.size();

    // Fast reverse lookup: variable ID -> position in var_ids.
    unordered_map<int, int> var_id_to_idx;
    for (int i = 0; i < n; ++i)
        var_id_to_idx[var_ids[i]] = i;

    // === DEBUG: BFS result ===
    std::cerr << "[BFS_RESULT] var=" << derived_var_id << " n=" << n << " primary_vars:";
    for (int v : var_ids)
        std::cerr << " " << v << "("
                  << task_proxy.get_variables()[v].get_name() << ")";
    std::cerr << "\n";
    // also report which derived vars were visited
    std::cerr << "[BFS_RESULT] visited_derived:";
    for (int d : visited_derived)
        std::cerr << " " << d << "("
                  << task_proxy.get_variables()[d].get_name() << ")";
    std::cerr << "\n";
    // === END DEBUG ===

    // -----------------------------------------------------------------------
    // Step 2: Domain sizes and mixed-radix multipliers
    //
    // Product state ID = sum_i( val_i * mult[i] ), where
    //   mult[0] = 1,  mult[i] = mult[i-1] * dom[i-1].
    // Decoding: val_i = (state_id / mult[i]) % dom[i].
    // -----------------------------------------------------------------------
    vector<int> dom(n);
    for (int i = 0; i < n; ++i)
        dom[i] = variables[var_ids[i]].get_domain_size();

    vector<int> mult(n, 1);
    int num_product_states = 1;
    for (int i = 0; i < n; ++i) {
        mult[i] = num_product_states;
        num_product_states *= dom[i];
    }

    // Per-variable domain sizes indexed by global variable ID, needed by
    // MergeAndShrinkRepresentationProduct.
    vector<int> all_dom(num_total_vars);
    for (int v = 0; v < num_total_vars; ++v)
        all_dom[v] = variables[v].get_domain_size();

    // Helper: decode the value of product variable at index i from a product state id.
    auto decode_val = [&](int state_id, int i) {
        return (state_id / mult[i]) % dom[i];
    };

    // -----------------------------------------------------------------------
    // Step 3: Initial state
    //
    // Encode the initial values of the product variables using the same
    // mixed-radix scheme as the lookup table in MergeAndShrinkRepresentationProduct.
    // -----------------------------------------------------------------------
    State init = task_proxy.get_initial_state();
    int init_state = 0;
    for (int i = 0; i < n; ++i)
        init_state += init[var_ids[i]].get_value() * mult[i];

    // Step 4: Goal states — product states from which derived_var_id can be
    // derived to its goal value. Uses recursive can_derive to follow transitive
    // chains through intermediate derived variables.
    //
    // can_derive(d, target, s): returns true iff axioms can set derived var d
    // to value target given product state s (primary variable assignments only).
    function<bool(int, int, int)> can_derive = [&](int d, int target, int s) -> bool {
        bool any_axiom_for_target = false;   // ADD THIS
        for (OperatorProxy axiom : task_proxy.get_axioms()) {
            EffectProxy eff = axiom.get_effects()[0];
            if (eff.get_fact().get_variable().get_id() != d) continue;
            if (eff.get_fact().get_value() != target) continue;
            any_axiom_for_target = true;     // ADD THIS
            bool body_satisfied = true;
            for (FactProxy pre : axiom.get_preconditions()) {
                VariableProxy pvar = pre.get_variable();
                if (pvar.is_derived()) {
                    if (!can_derive(pvar.get_id(), pre.get_value(), s)) {
                        body_satisfied = false;
                        break;
                    }
                } else {
                    auto it = var_id_to_idx.find(pvar.get_id());
                    if (it != var_id_to_idx.end()) {
                        if (decode_val(s, it->second) != pre.get_value()) {
                            body_satisfied = false;
                            break;
                        }
                    }
                }
            }
            if (body_satisfied) return true;
        }
        // No axiom derives d to target → target is d's default value, held
        // whenever no axiom fires. Over-approximate as always achievable.
        if (!any_axiom_for_target) return true;   // ADD THIS (replaces plain return false)
        return false;
    };

    int goal_derived_value = -1;
    for (FactProxy g : task_proxy.get_goals()) {
        if (g.get_variable().get_id() == derived_var_id) {
            goal_derived_value = g.get_value();
            break;
        }
    }
    assert(goal_derived_value != -1);

    vector<bool> goal_states(num_product_states, false);
    for (int s = 0; s < num_product_states; ++s) {
        if (can_derive(derived_var_id, goal_derived_value, s))
            goal_states[s] = true;
    }

    // -----------------------------------------------------------------------
    // Step 5: Transitions for each operator label
    //
    // An operator is relevant to the product factor if it has a precondition
    // or effect on at least one variable in var_ids. Irrelevant operators
    // are handled together as self-loops (Step 6).
    //
    // For conditional effects: if an effect on a product variable has a
    // condition that references a variable outside S_d, we cannot determine
    // from the product state alone whether the condition holds. We conservatively
    // add both the forward transition (effect fires) and a self-loop (effect
    // does not fire), which over-approximates but preserves admissibility.
    //
    // Multiple effects on the same product variable are applied sequentially
    // to the target state, which correctly models the case where all such
    // effects fire. The self-loop handles the case where none fire. The
    // intermediate case (some fire, some do not) is not modelled in full
    // generality; this is an accepted limitation for a first implementation.
    // -----------------------------------------------------------------------
    int num_labels = labels.get_num_total_labels();
    vector<bool> is_relevant(num_labels, false);
    vector<vector<Transition>> label_trans(num_labels);

    for (OperatorProxy op : task_proxy.get_operators()) {
        int label = op.get_id();

        // Operator-level preconditions on product variables.
        vector<int> op_pre(n, -1);
        for (FactProxy pre : op.get_preconditions()) {
            auto it = var_id_to_idx.find(pre.get_variable().get_id());
            if (it != var_id_to_idx.end())
                op_pre[it->second] = pre.get_value();
        }

        // Determine relevance: does the operator touch any product variable?
        bool relevant = false;
        for (int i = 0; i < n; ++i) {
            if (op_pre[i] != -1) { relevant = true; break; }
        }
        if (!relevant) {
            for (EffectProxy eff : op.get_effects()) {
                if (var_id_to_idx.count(
                        eff.get_fact().get_variable().get_id())) {
                    relevant = true;
                    break;
                }
            }
        }
        if (!relevant)
            continue;

        is_relevant[label] = true;
        auto &transitions = label_trans[label];

        for (int s = 0; s < num_product_states; ++s) {
            // Check operator preconditions on product variables.
            bool applicable = true;
            for (int i = 0; i < n; ++i) {
                if (op_pre[i] != -1 && decode_val(s, i) != op_pre[i]) {
                    applicable = false;
                    break;
                }
            }
            if (!applicable)
                continue;

            // Compute the target state by applying each effect on a product
            // variable. We update t incrementally: subtract the current value
            // of the target variable (from t, not s, to correctly handle
            // multiple effects on the same variable) and add the post-value.
            int t = s;
            bool need_self_loop = false;

            for (EffectProxy eff : op.get_effects()) {
                int eff_var_id = eff.get_fact().get_variable().get_id();
                auto it = var_id_to_idx.find(eff_var_id);
                if (it == var_id_to_idx.end())
                    continue;
                int idx = it->second;
                int post = eff.get_fact().get_value();

                // Inspect effect conditions.
                //   - Condition on the same variable: can be checked against s;
                //     if not satisfied, this effect definitely does not fire.
                //   - Condition on another variable: cannot be verified from the
                //     product state; we optimistically assume the effect fires
                //     (adds the forward transition) and set need_self_loop to
                //     also cover the case where it does not.
                bool fires = true;
                bool has_outside_cond = false;
                for (FactProxy cond : eff.get_conditions()) {
                    if (cond.get_variable().get_id() == eff_var_id) {
                        if (decode_val(s, idx) != cond.get_value()) {
                            fires = false;
                            break;
                        }
                    } else {
                        has_outside_cond = true;
                    }
                }
                if (!fires)
                    continue;

                if (has_outside_cond)
                    need_self_loop = true;

                // Apply the effect to t. Decode from t (not s) so that earlier
                // effects on the same variable are taken into account.
                t -= decode_val(t, idx) * mult[idx];
                t += post * mult[idx];
            }

            // t == s when the operator only has preconditions on product variables
            // (no effect changes them); emplace_back covers that self-loop naturally.
            transitions.emplace_back(s, t);
            // Add the self-loop for the case where an outside-conditioned effect
            // does not fire, but only when the forward transition actually moves.
            if (need_self_loop && t != s)
                transitions.emplace_back(s, s);
        }
    }

    // -----------------------------------------------------------------------
    // Step 6: Group labels with identical transitions into local labels
    //
    // Follows FTSFactory::build_transitions_for_operator: scan existing local
    // labels for a matching transition set; if found, merge the current label
    // into that group; otherwise create a new local label.
    // Irrelevant labels are all grouped into a single self-loop local label,
    // following FTSFactory::build_transitions_for_irrelevant_ops.
    // -----------------------------------------------------------------------
    // Size to max_num_labels (not num_total_labels) so that apply_label_reduction
    // can access indices beyond the current label count, matching the convention
    // used throughout FTSFactory.
    vector<int> label_to_local_label(labels.get_max_num_labels(), -1);
    vector<LocalLabelInfo> local_label_infos;

    for (OperatorProxy op : task_proxy.get_operators()) {
        int label = op.get_id();
        if (!is_relevant[label])
            continue;

        auto &transitions = label_trans[label];
        utils::sort_unique(transitions);

        bool found = false;
        for (size_t ll = 0; ll < local_label_infos.size(); ++ll) {
            if (local_label_infos[ll].get_transitions() == transitions) {
                label_to_local_label[label] = static_cast<int>(ll);
                local_label_infos[ll].add_label(label, op.get_cost());
                found = true;
                break;
            }
        }
        if (!found) {
            int new_ll = local_label_infos.size();
            LabelGroup lg = {label};
            local_label_infos.emplace_back(
                move(lg), move(transitions), op.get_cost());
            label_to_local_label[label] = new_ll;
        }
    }

    // Group all irrelevant labels as self-loops at every product state.
    LabelGroup irrelevant_lg;
    int irr_cost = INF;
    for (int label : labels) {
        if (!is_relevant[label]) {
            irrelevant_lg.push_back(label);
            irr_cost = min(irr_cost, labels.get_label_cost(label));
        }
    }
    if (!irrelevant_lg.empty()) {
        vector<Transition> self_loops;
        self_loops.reserve(num_product_states);
        for (int s = 0; s < num_product_states; ++s)
            self_loops.emplace_back(s, s);
        int new_ll = local_label_infos.size();
        for (int label : irrelevant_lg)
            label_to_local_label[label] = new_ll;
        local_label_infos.emplace_back(
            move(irrelevant_lg), move(self_loops), irr_cost);
    }

    // -----------------------------------------------------------------------
    // Step 7: Construct the TransitionSystem and the corresponding
    //         MergeAndShrinkRepresentationProduct, then inject the factor.
    // -----------------------------------------------------------------------
    auto ts = make_unique<TransitionSystem>(
        num_total_vars,
        vector<int>(var_ids),  // incorporated_variables = primary vars of S_d
        labels,
        move(label_to_local_label),
        move(local_label_infos),
        num_product_states,
        move(goal_states),
        init_state);

    auto mas_rep = make_unique<MergeAndShrinkRepresentationProduct>(
        var_ids, all_dom);
    // === DEBUG: axiom factor stats ===
    {
        int num_goal = 0;
        for (bool g : goal_states) if (g) ++num_goal;
        std::cerr << "[AXIOM_FACTOR] derived_var=" << derived_var_id
                  << " n=" << n << " num_product_states=" << num_product_states
                  << " num_goal_states=" << num_goal
                  << " init_state=" << init_state << "\n";
        std::cerr << "[AXIOM_FACTOR] var_ids:";
        for (int v : var_ids) std::cerr << " " << v;
        std::cerr << "\n";
        if (num_goal > 0) {
            std::cerr << "[AXIOM_FACTOR] first goal states:";
            int cnt = 0;
            for (int s = 0; s < num_product_states && cnt < 5; ++s)
                if (goal_states[s]) { std::cerr << " " << s; ++cnt; }
            std::cerr << "\n";
        }
    }
    // === END DEBUG ===
    return fts.add_factor(move(ts), move(mas_rep), log);
}
}
