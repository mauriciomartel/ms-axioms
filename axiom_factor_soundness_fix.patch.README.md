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

## Second bug: suboptimal plans (muddy-child)

After the fixpoint fix above, all three benchmark domains became solvable,
but `muddy-child/3-muddy_1.sas` still produced a **suboptimal** plan (cost
5) under `astar(merge_and_shrink(...))` with exact bisimulation, while
`astar(blind())` found the true optimum (cost 4). Since exact bisimulation
is supposed to make merge_and_shrink's heuristic admissible (in fact
perfect, absent state-limit truncation), this was a second, independent
soundness bug: the heuristic was overestimating somewhere, causing A* to
miss the optimal path.

Root cause, in `build_axiom_factor`'s reachability exploration (Step 5 of
`fts_factory.cc`): when an operator has two or more effects that each
touch a product (primary) variable in S_d and are each conditioned on a
*different* variable outside S_d, the old code could only generate two
outcomes per operator application: "all such effects fire" or "none of
them fire" (the latter modeled as a self-loop). It never generated the
"exactly one of them fires, not the other(s)" combinations, even though
these are real, independently reachable transitions — the two outside
conditions are unrelated, so any subset of them can hold in a real state.

Concretely, in `muddy-child`, for the axiom factor built for derived
variable 40 (closure S_40 = primary variables {7, 31, 19, 15}), operator
`a_asks_b` has two relevant effects: `var31` conditioned on `var26==0`,
and `var19` conditioned on `var10==0` — both `var26` and `var10` are
derived variables outside S_40, and the two conditions are independent.
The old code only added a transition where both fire and one where
neither fires, silently dropping the two partial-firing transitions. This
under-approximated the transition relation, which can only ever make the
abstract distances *larger* than the true distances (never smaller),
breaking admissibility and causing A* to return a non-optimal plan.

Fixed by enumerating every subset of the "active" (self-conditions
satisfied) outside-conditioned effects on a given operator application,
instead of just the two extremes, and adding the corresponding transition
for each subset.

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

All three benchmark domains with `when`-clauses now solve correctly *and
optimally* under `astar(merge_and_shrink(...))` with `shrink_bisimulation`
(exact), built in both debug (asserts on, run under gdb — no crashes) and
release, matching `astar(blind())` exactly:

- `sum/sum_3.sas`: plan cost 3 (matches `astar(blind())`).
- `muddy-children/3-muddy.sas`: plan cost 6 (matches `astar(blind())`).
- `muddy-child/3-muddy_1.sas`: plan cost 4 (matches `astar(blind())`).
