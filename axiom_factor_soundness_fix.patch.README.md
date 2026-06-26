# Axiom factor soundness fix

Apply `axiom_factor_soundness_fix.patch` on top of `feature/axioms-in-ms`
commit `52e34aedbe70dde51ef6f9b412190ef46baba49e` (the current tip at the
time this was written):

```
git checkout feature/axioms-in-ms
git apply axiom_factor_soundness_fix.patch
```

## What was wrong

`merge_and_shrink` with exact bisimulation was reporting solvable tasks
(e.g. `misc/tests/benchmarks/sum/sum_3.sas`) as "provably unsolvable",
while `astar(blind())` found a valid plan. This was a real soundness bug,
not a performance issue: exact bisimulation is supposed to be lossless.

Root cause, found by instrumenting `build_axiom_factor` and inspecting the
actual reachable states it computed: the axiom-evaluation forward-chaining
pass in `fts_factory.cc` assumed a single pass over `relevant_axioms`,
sorted only by axiom layer, was enough to resolve a derived variable's
value. That's wrong whenever two derived variables in the same dependency
closure share the *same* axiom layer and one's rule conditions on the
other's value (legal under Fast Downward's stratification rules — only
same-layer *negative* dependencies are forbidden, not positive ones). In
that case the single pass could evaluate the dependent rule before its
same-layer dependency had fired, silently leaving the dependent variable
stuck at its default value forever, even on reachable states where it
should have become true. This made every goal derived variable's axiom
factor in `sum_3` report **zero reachable goal states**, which is what
produced the false "provably unsolvable" verdict.

Fixed by iterating the axiom rules to a fixpoint (bounded by the number of
relevant axioms, since each variable fires at most once) instead of doing
a single linear pass.

## Other fixes bundled in the same patch

While diagnosing this, two related pre-existing gaps were also fixed
(needed for axiom factors to be built correctly for derived variables that
are *not* themselves goals, e.g. ones only read via an operator
precondition or a conditional-effect `when`-clause):

- `merge_and_shrink_algorithm.cc`: previously only derived variables that
  are direct goals got a real axiom-induced factor. Any derived variable
  read by an operator precondition or effect condition but not itself a
  goal never got one, leaving its atomic factor (which axioms never
  update) stuck and gating operators incorrectly. Added
  `collect_relevant_derived_variables` to build factors for the full
  relevant set, excluding rule-less (translator constant) derived
  variables that don't need one.
- `fts_factory.cc`'s `build_axiom_factor`: assumed (via an `assert`) that
  its target derived variable was always a goal; fixed to allow non-goal
  derived variables (the factor then places no goal restriction of its
  own).
- `merge_scoring_function_total_order.cc`: `initialize()` independently
  counted axiom factors using the same goal-only assumption, used to size
  `transition_system_order`/`merge_candidate_order`. Desynced from the
  actual (now wider) set of factors built, this caused an assertion
  failure (`scores.size() == candidate_index + 1`) in `compute_scores`.
  Fixed to count the same broadened set.

## Verification

All three benchmark domains with `when`-clauses now solve correctly under
`astar(merge_and_shrink(...))` with `shrink_bisimulation` (exact), built
in both debug (asserts on, run under gdb — no crashes) and release:

- `sum/sum_3.sas`: plan cost 3 (matches `astar(blind())`).
- `muddy-children/3-muddy.sas`: plan cost 6 (matches `astar(blind())`).
- `muddy-child/3-muddy_1.sas`: plan cost 5, but `astar(blind())` finds
  cost 4. Since exact bisimulation should make merge_and_shrink's
  heuristic perfect, A* finding a worse-than-optimal plan here means the
  heuristic is not admissible somewhere along this run — this is not
  explained by the bug fixed above (the within-layer fixpoint fix is
  general and this domain's axioms are also single-layer with chained
  dependencies, same shape as `sum_3` and `muddy-children`, both of which
  now reproduce the optimal cost). **This looks like a second, separate
  bug** that hasn't been root-caused yet and needs further investigation
  before this fix can be considered complete.
