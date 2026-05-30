#include "primary_representation.h"

#include <unordered_map>

using namespace std;

namespace merge_and_shrink {

PrimaryRepresentation::PrimaryRepresentation(
    const TaskProxy &task_proxy, int derived_var_id) {
    VariablesProxy variables = task_proxy.get_variables();

    // Allocate a boolean array for each primary variable's domain.
    // Derived variables are skipped: they are not part of S_d.
    // All values start as false (incompatible) and are set to true below.
    compatible_values.resize(variables.size());
    for (VariableProxy var : variables) {
        if (!var.is_derived())
            compatible_values[var.get_id()].assign(var.get_domain_size(), false);
    }

    // The default axiom value is the negation-by-failure value: the value
    // that derived_var holds when no rule fires. We only care about rules
    // that derive d to its NON-default value (i.e., rules that make d true).
    int default_val = variables[derived_var_id].get_default_axiom_value();

    for (OperatorProxy axiom : task_proxy.get_axioms()) {
        // Each axiom has exactly one effect.
        EffectProxy effect = axiom.get_effects()[0];
        FactPair head = effect.get_fact().get_pair();

        // Skip rules that are not for our derived variable, or that
        // derive it to its default (false) value.
        if (head.var != derived_var_id || head.value == default_val)
            continue;

        // Collect only the conditions on PRIMARY variables.
        // Conditions on derived variables are ignored: we cannot easily
        // determine their satisfiability without running the full evaluator,
        // so we over-approximate by assuming they can always be satisfied.
        unordered_map<int, int> primary_conds;
        for (FactProxy cond : axiom.get_preconditions()) {
            VariableProxy cond_var = cond.get_variable();
            if (!cond_var.is_derived())
                primary_conds[cond_var.get_id()] = cond.get_value();
        }

        // Update compatible_values based on this rule's primary conditions.
        // For a primary variable v:
        //   - If the rule has NO condition on v, then any value of v is
        //     compatible (the rule can fire regardless of v's value), so
        //     we mark all values of v as compatible.
        //   - If the rule HAS a condition v=c, only value c is compatible
        //     via this rule (so we mark just that value as true).
        for (VariableProxy var : variables) {
            if (var.is_derived())
                continue;
            int var_id = var.get_id();
            auto it = primary_conds.find(var_id);
            if (it == primary_conds.end())
                fill(compatible_values[var_id].begin(),
                     compatible_values[var_id].end(), true);
            else
                compatible_values[var_id][it->second] = true;
        }
    }
}

bool PrimaryRepresentation::is_compatible(int var_id, int val) const {
    return compatible_values[var_id][val];
}

}