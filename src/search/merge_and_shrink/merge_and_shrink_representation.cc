#include "merge_and_shrink_representation.h"

#include "distances.h"
#include "types.h"

#include "../task_proxy.h"

#include "../utils/logging.h"

#include <algorithm>
#include <cassert>
#include <iostream>
#include <numeric>

using namespace std;

namespace merge_and_shrink {
MergeAndShrinkRepresentation::MergeAndShrinkRepresentation(int domain_size)
    : domain_size(domain_size) {
}

MergeAndShrinkRepresentation::~MergeAndShrinkRepresentation() {
}

int MergeAndShrinkRepresentation::get_domain_size() const {
    return domain_size;
}

MergeAndShrinkRepresentationLeaf::MergeAndShrinkRepresentationLeaf(
    int var_id, int domain_size)
    : MergeAndShrinkRepresentation(domain_size),
      var_id(var_id),
      lookup_table(domain_size) {              // <-- allocate domain_size elements
    iota(lookup_table.begin(), lookup_table.end(), 0);
}

void MergeAndShrinkRepresentationLeaf::set_distances(
    const Distances &distances) {
    assert(distances.are_goal_distances_computed());
    for (int &entry : lookup_table) {
        if (entry != PRUNED_STATE) {
            entry = distances.get_goal_distance(entry);
        }
    }
}

void MergeAndShrinkRepresentationLeaf::apply_abstraction_to_lookup_table(
    const vector<int> &abstraction_mapping) {
    int new_domain_size = 0;
    for (int &entry : lookup_table) {
        if (entry != PRUNED_STATE) {
            entry = abstraction_mapping[entry];
            new_domain_size = max(new_domain_size, entry + 1);
        }
    }
    domain_size = new_domain_size;
}

int MergeAndShrinkRepresentationLeaf::get_value(const State &state) const {
    int value = state[var_id].get_value();
    return lookup_table[value];
}

bool MergeAndShrinkRepresentationLeaf::is_total() const {
    for (int entry : lookup_table) {
        if (entry == PRUNED_STATE) {
            return false;
        }
    }
    return true;
}

void MergeAndShrinkRepresentationLeaf::dump(utils::LogProxy &log) const {
    if (log.is_at_least_debug()) {
        log << "lookup table (leaf): ";
        for (const auto &value : lookup_table) {
            log << value << ", ";
        }
        log << endl;
    }
}

MergeAndShrinkRepresentationMerge::MergeAndShrinkRepresentationMerge(
    unique_ptr<MergeAndShrinkRepresentation> left_child_,
    unique_ptr<MergeAndShrinkRepresentation> right_child_)
    : MergeAndShrinkRepresentation(
          left_child_->get_domain_size() * right_child_->get_domain_size()),
      left_child(move(left_child_)),
      right_child(move(right_child_)),
      lookup_table(
          left_child->get_domain_size(),
          vector<int>(right_child->get_domain_size())) {
    int counter = 0;
    for (vector<int> &row : lookup_table) {
        for (int &entry : row) {
            entry = counter;
            ++counter;
        }
    }
}

void MergeAndShrinkRepresentationMerge::set_distances(
    const Distances &distances) {
    assert(distances.are_goal_distances_computed());
    for (vector<int> &row : lookup_table) {
        for (int &entry : row) {
            if (entry != PRUNED_STATE) {
                entry = distances.get_goal_distance(entry);
            }
        }
    }
}

void MergeAndShrinkRepresentationMerge::apply_abstraction_to_lookup_table(
    const vector<int> &abstraction_mapping) {
    int new_domain_size = 0;
    for (vector<int> &row : lookup_table) {
        for (int &entry : row) {
            if (entry != PRUNED_STATE) {
                entry = abstraction_mapping[entry];
                new_domain_size = max(new_domain_size, entry + 1);
            }
        }
    }
    domain_size = new_domain_size;
}

int MergeAndShrinkRepresentationMerge::get_value(const State &state) const {
    int state1 = left_child->get_value(state);
    int state2 = right_child->get_value(state);
    if (state1 == PRUNED_STATE || state2 == PRUNED_STATE)
        return PRUNED_STATE;
    return lookup_table[state1][state2];
}

bool MergeAndShrinkRepresentationMerge::is_total() const {
    for (const vector<int> &row : lookup_table) {
        for (int entry : row) {
            if (entry == PRUNED_STATE) {
                return false;
            }
        }
    }
    return left_child->is_total() && right_child->is_total();
}

void MergeAndShrinkRepresentationMerge::dump(utils::LogProxy &log) const {
    if (log.is_at_least_debug()) {
        log << "lookup table (merge): " << endl;
        for (const auto &row : lookup_table) {
            for (const auto &value : row) {
                log << value << ", ";
            }
            log << endl;
        }
        log << "left child:" << endl;
        left_child->dump(log);
        log << "right child:" << endl;
        right_child->dump(log);
    }
}

// ---------------------------------------------------------------------------
// Helpers for MergeAndShrinkRepresentationProduct (file-scope, not exported)
// ---------------------------------------------------------------------------

/*
  Returns the total number of product states: the product of domain_sizes[v]
  for every v in var_ids. This value becomes the domain_size of the factor.
*/
static int compute_product_size(const vector<int> &var_ids,
                                const vector<int> &domain_sizes) {
    int total = 1;
    for (int v : var_ids)
        total *= domain_sizes[v];
    return total;
}

/*
  Returns the mixed-radix multipliers so that
    product_state_id = sum_i( val_i * multipliers[i] ).
  multipliers[0] = 1; multipliers[i] = multipliers[i-1] * domain_size(var_ids[i-1]).
*/
static vector<long long> compute_product_multipliers(const vector<int> &var_ids,
                                                     const vector<int> &domain_sizes) {
    vector<long long> mults(var_ids.size());
    long long acc = 1;
    for (size_t i = 0; i < var_ids.size(); ++i) {
        mults[i] = acc;
        acc *= domain_sizes[var_ids[i]];
    }
    return mults;
}

// ---------------------------------------------------------------------------
// MergeAndShrinkRepresentationProduct
// ---------------------------------------------------------------------------

MergeAndShrinkRepresentationProduct::MergeAndShrinkRepresentationProduct(
    const vector<int> &var_ids, const vector<int> &domain_sizes)
    : MergeAndShrinkRepresentation(compute_product_size(var_ids, domain_sizes)),
      /*
        The base class is initialized first (C++ rule: base before members).
        compute_product_size computes the product of all domain sizes and
        passes it to the base constructor, which stores it as `domain_size`.
        This must happen before lookup_table is sized, because lookup_table
        uses `domain_size` as its length (see below).
      */
      var_ids(var_ids),
      /*
        Both var_ids and domain_sizes here refer to the constructor parameters,
        not to `this->var_ids` — member initialization reads from the incoming
        arguments, which are fully available throughout the initializer list.
      */
      multipliers(compute_product_multipliers(var_ids, domain_sizes)),
      /*
        By the time lookup_table is initialized, the base-class constructor has
        already run and `this->domain_size` holds the correct product size, so
        it is safe to use it here as the vector length.
      */
      lookup_table(),
      fallback_abstract_id(-1) {
    for (int i = 0; i < domain_size; ++i)
        lookup_table[i] = i;
}

MergeAndShrinkRepresentationProduct::MergeAndShrinkRepresentationProduct(
    const vector<int> &var_ids, const vector<int> &domain_sizes,
    unordered_map<long long, int> &&initial_lookup_table, int num_reachable_states,
    int fallback_id)
    : MergeAndShrinkRepresentation(num_reachable_states),
      var_ids(var_ids),
      multipliers(compute_product_multipliers(var_ids, domain_sizes)),
      lookup_table(move(initial_lookup_table)),
      fallback_abstract_id(fallback_id) {
}

void MergeAndShrinkRepresentationProduct::set_distances(
    const Distances &distances) {
    // Replace each abstract state ID with its precomputed goal distance.
    // Follows the same pattern as MergeAndShrinkRepresentationLeaf::set_distances.
    assert(distances.are_goal_distances_computed());
    for (auto &[key, val] : lookup_table) {
        if (val != PRUNED_STATE)
            val = distances.get_goal_distance(val);
    }
    if (fallback_abstract_id >= 0)
        fallback_abstract_id = distances.get_goal_distance(fallback_abstract_id);
}

void MergeAndShrinkRepresentationProduct::apply_abstraction_to_lookup_table(
    const vector<int> &abstraction_mapping) {
    // Remap every live entry through the abstraction mapping and track the
    // new domain size. Follows the same pattern as the Leaf version.
    int new_domain_size = 0;
    for (auto &[key, val] : lookup_table) {
        if (val != PRUNED_STATE) {
            val = abstraction_mapping[val];
            new_domain_size = max(new_domain_size, val + 1);
        }
    }
    domain_size = new_domain_size;
    if (fallback_abstract_id >= 0)
        fallback_abstract_id = abstraction_mapping[fallback_abstract_id];
}

int MergeAndShrinkRepresentationProduct::get_value(const State &state) const {
    // Encode the combined assignment of all product variables as one integer
    // and look up the corresponding abstract state (or distance after
    // set_distances is called). The mixed-radix encoding guarantees a unique
    // ID for every tuple of variable values without collisions.
    long long product_state_id = 0;
    for (size_t i = 0; i < var_ids.size(); ++i)
        product_state_id += static_cast<long long>(state[var_ids[i]].get_value()) * multipliers[i];
    auto it = lookup_table.find(product_state_id);
    return it != lookup_table.end() ? it->second
       : (fallback_abstract_id >= 0 ? fallback_abstract_id : PRUNED_STATE);
}

bool MergeAndShrinkRepresentationProduct::is_total() const {
    // The represented function is total iff every product state is mapped to a
    // live abstract state (none pruned). A PRUNED_STATE entry means that
    // combination of variable values was eliminated during shrinking, making
    // the function partial — the heuristic cannot give a finite value for
    // concrete states that map to such a product state.
    for (const auto &[key, val] : lookup_table) {
        if (val == PRUNED_STATE)
            return false;
    }
    return true;
}

void MergeAndShrinkRepresentationProduct::dump(utils::LogProxy &log) const {
    // Print the full lookup table together with the variable IDs that define
    // the product, so the output is self-contained and can be cross-referenced
    // against the transition system dump for the same factor.
    if (log.is_at_least_debug()) {
        log << "lookup table (product of vars {";
        for (size_t i = 0; i < var_ids.size(); ++i) {
            if (i > 0) log << ", ";
            log << var_ids[i];
        }
        log << "}): ";
        for (const auto &[key, val] : lookup_table) {
            log << key << "->" << val << ", ";
        }
        log << endl;
    }
}
}
