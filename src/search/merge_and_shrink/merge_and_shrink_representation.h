#ifndef MERGE_AND_SHRINK_MERGE_AND_SHRINK_REPRESENTATION_H
#define MERGE_AND_SHRINK_MERGE_AND_SHRINK_REPRESENTATION_H

#include <memory>
#include <vector>

class State;

namespace utils {
class LogProxy;
}

namespace merge_and_shrink {
class Distances;
class MergeAndShrinkRepresentation {
protected:
    int domain_size;

public:
    explicit MergeAndShrinkRepresentation(int domain_size);
    virtual ~MergeAndShrinkRepresentation() = 0;

    int get_domain_size() const;

    // Store distances instead of abstract state numbers.
    virtual void set_distances(const Distances &) = 0;
    virtual void apply_abstraction_to_lookup_table(
        const std::vector<int> &abstraction_mapping) = 0;
    /*
      Return the value that state is mapped to. This is either an abstract
      state (if set_distances has not been called) or a distance (if it has).
      If the represented function is not total, the returned value is DEAD_END
      if the abstract state is PRUNED_STATE or if the (distance) value is INF.
    */
    virtual int get_value(const State &state) const = 0;
    /* Return true iff the represented function is total, i.e., does not map
       to PRUNED_STATE. */
    virtual bool is_total() const = 0;
    virtual void dump(utils::LogProxy &log) const = 0;
};

class MergeAndShrinkRepresentationLeaf : public MergeAndShrinkRepresentation {
    const int var_id;

    std::vector<int> lookup_table;
public:
    MergeAndShrinkRepresentationLeaf(int var_id, int domain_size);
    virtual ~MergeAndShrinkRepresentationLeaf() = default;

    virtual void set_distances(const Distances &) override;
    virtual void apply_abstraction_to_lookup_table(
        const std::vector<int> &abstraction_mapping) override;
    virtual int get_value(const State &state) const override;
    virtual bool is_total() const override;
    virtual void dump(utils::LogProxy &log) const override;
};

class MergeAndShrinkRepresentationMerge : public MergeAndShrinkRepresentation {
    std::unique_ptr<MergeAndShrinkRepresentation> left_child;
    std::unique_ptr<MergeAndShrinkRepresentation> right_child;
    std::vector<std::vector<int>> lookup_table;
public:
    MergeAndShrinkRepresentationMerge(
        std::unique_ptr<MergeAndShrinkRepresentation> left_child,
        std::unique_ptr<MergeAndShrinkRepresentation> right_child);
    virtual ~MergeAndShrinkRepresentationMerge() = default;

    virtual void set_distances(const Distances &distances) override;
    virtual void apply_abstraction_to_lookup_table(
        const std::vector<int> &abstraction_mapping) override;
    virtual int get_value(const State &state) const override;
    virtual bool is_total() const override;
    virtual void dump(utils::LogProxy &log) const override;
};

/*
  Represents the abstract factor Θ_{S,d} induced by a derived variable d,
  whose primary representation S is a conjunction of primary-variable assignments.

  Unlike MergeAndShrinkRepresentationLeaf (one variable) and
  MergeAndShrinkRepresentationMerge (recursive binary merge), this class handles
  an arbitrary fixed set of primary variables simultaneously. It encodes their
  combined assignment as a single integer using mixed-radix arithmetic, then looks
  up the resulting abstract state (or, after set_distances, goal distance) in a
  flat table.

  The encoding is:
    product_state_id = sum_i( state[var_ids[i]].get_value() * multipliers[i] )
  where multipliers[0] = 1 and multipliers[i] = multipliers[i-1] * domain_size(var_ids[i-1]).
*/
class MergeAndShrinkRepresentationProduct : public MergeAndShrinkRepresentation {
    // The planning variable IDs that form the product; fixed at construction.
    const std::vector<int> var_ids;
    /*
      Mixed-radix multipliers so that each tuple of variable values maps to a
      unique integer in [0, domain_size). Multipliers are computed once at
      construction from the per-variable domain sizes.
    */
    const std::vector<int> multipliers;
    /*
      Flat lookup table of size = product of all domain sizes of var_ids.
      Lifecycle:
        - After construction:                 lookup_table[i] = i  (identity)
        - After apply_abstraction_to_lookup_table: entries are abstract state IDs
        - After set_distances:                entries are goal distances
    */
    std::vector<int> lookup_table;
public:
    /*
      var_ids: variable IDs forming the product (order determines multiplier layout).
      domain_sizes: flat vector where domain_sizes[v] is the domain size of variable v.
    */
    MergeAndShrinkRepresentationProduct(
        const std::vector<int> &var_ids,
        const std::vector<int> &domain_sizes);
    /*
      Reachability-restricted variant: used when the abstract factor was built
      by exploring only the product states reachable from the initial state
      (see build_axiom_factor in fts_factory.cc), instead of enumerating the
      full Cartesian product of all variable domains.

      initial_lookup_table must have size equal to the full product of
      domain_sizes[v] for v in var_ids (one entry per possible tuple of
      variable values, exactly as compute_product_size would compute). Each
      entry is either the dense ID of the corresponding reachable abstract
      state (in [0, num_reachable_states)) or PRUNED_STATE if that tuple of
      values is unreachable from the initial state. num_reachable_states
      becomes the representation's initial domain_size, instead of the full
      product size.
    */
    MergeAndShrinkRepresentationProduct(
        const std::vector<int> &var_ids,
        const std::vector<int> &domain_sizes,
        std::vector<int> &&initial_lookup_table,
        int num_reachable_states);
    virtual ~MergeAndShrinkRepresentationProduct() = default;

    /*
      Replaces every abstract state ID in the lookup table with the
      corresponding precomputed goal distance from `distances`. Called once
      after the factor has been fully shrunk so that get_value() returns a
      heuristic distance directly instead of an abstract state number.
      Entries that are PRUNED_STATE are left untouched; callers treat them
      as DEAD_END.
    */
    virtual void set_distances(const Distances &distances) override;

    /*
      Remaps every live entry in the lookup table through `abstraction_mapping`,
      which encodes the result of a shrinking step: abstraction_mapping[s] is
      the new abstract state that old abstract state s belongs to after the
      equivalence classes have been merged. PRUNED_STATE entries are left
      untouched (a pruned state stays pruned). Also updates domain_size to
      reflect the reduced number of abstract states.
    */
    virtual void apply_abstraction_to_lookup_table(
        const std::vector<int> &abstraction_mapping) override;

    /*
      Maps a concrete planning state to an abstract state (or, after
      set_distances is called, to a goal distance). The concrete state is
      encoded as a single integer via the mixed-radix scheme stored in
      `multipliers`, which is then used as the index into `lookup_table`.
    */
    virtual int get_value(const State &state) const override;

    /*
      Returns true iff every product state is mapped to a live abstract state,
      i.e., no entry in the lookup table is PRUNED_STATE. A partial function
      (is_total() == false) means some combinations of variable values were
      pruned during shrinking, so the heuristic cannot assign a finite value
      to concrete states that map to those combinations.
    */
    virtual bool is_total() const override;

    /*
      Prints the variable IDs that define the product and the full contents of
      the lookup table. The variable IDs are included so the output is
      self-contained and can be matched against the transition system dump for
      the same factor.
    */
    virtual void dump(utils::LogProxy &log) const override;
};
}

#endif
