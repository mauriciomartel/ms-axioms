#ifndef MERGE_AND_SHRINK_PRIMARY_REPRESENTATION_H
#define MERGE_AND_SHRINK_PRIMARY_REPRESENTATION_H

#include "../task_proxy.h"

#include <vector>

namespace merge_and_shrink {

/*
  For a derived variable d, S_d is the set of complete assignments to ALL
  primary variables under which d evaluates to true according to the
  stratified fixed-point semantics of the axioms. Here S denotes the set
  of primary variables under consideration (in this class, the full set V
  of all primary variables in the task), and the subscript d identifies
  which derived variable we are characterising. For example, if a task has
  primary variables {x, y, z} and derived variable d is true whenever x=1
  OR y=2, then S_d = {all assignments with x=1} union {all assignments
  with y=2}.

  Since S_d lives over all primary variables jointly, we cannot store it
  explicitly (it could be exponentially large). Instead, this class stores
  its projection onto each individual variable: for primary variable v,
  compatible_values[v][c] is true if there EXISTS some assignment to the
  remaining primary variables such that the full assignment (with v=c) lies
  in S_d.

  Derived conditions inside axiom rules are ignored, giving a conservative
  over-approximation. This is safe: marking more values as compatible can
  only cause the heuristic to underestimate, preserving admissibility.
*/
class PrimaryRepresentation {
    // compatible_values[var_id][val] is true if value val of primary
    // variable var_id is compatible with the derived variable being true.
    std::vector<std::vector<bool>> compatible_values;
public:
    // Scans all axiom rules for derived_var_id and fills compatible_values.
    PrimaryRepresentation(const TaskProxy &task_proxy, int derived_var_id);

    // Returns true if value val of primary variable var_id is in the
    // projection of S_d onto that variable's domain.
    bool is_compatible(int var_id, int val) const;
};

}

#endif