; Minimal domain to exercise Phase 2 Step 3 of the axiom-in-MS heuristic.
;
; Derived variable d depends on three primary variables a, b, c:
;   d = (a /\ b /\ c)
; Goal states of the axiom factor = {(a=T, b=T, c=T)}.
;
; Operator 'shortcut' has:
;   - a precondition on 'b'  (primary variable in S_d)  -> product-var connection
;   - a precondition on 'd'  (the derived variable)     -> derived precondition
;   This makes it a Step 3 (has_derived_pre_mixed) operator.
;
; Initial state: b=T, a=F, c=F  -> s = (0,1,0), d=F.
; Optimal plan: get-a ; get-c   (cost 2).
;
; In the axiom factor, 'shortcut' would produce the transition
;   (0,1,0) -> (1,1,1)   [sets a and c simultaneously]
; if its source state is not filtered.  With Step 3 that transition is removed
; (source is not a goal state), giving h_init=2=h*.
; Without Step 3 the abstract path length from (0,1,0) is 1, giving h_init=1<h*.

(define (domain step3-axioms)
  (:requirements :strips :derived-predicates)
  (:predicates (a) (b) (c) (d))

  (:derived (d) (and (a) (b) (c)))

  (:action get-a
    :parameters ()
    :precondition ()
    :effect (a))

  (:action get-b
    :parameters ()
    :precondition ()
    :effect (b))

  (:action get-c
    :parameters ()
    :precondition ()
    :effect (c))

  ; Step 3 operator: primary-var precondition on 'b' (in S_d)
  ;                  AND derived-var precondition on 'd'.
  ; Should only produce transitions from goal states (where d is true).
  (:action shortcut
    :parameters ()
    :precondition (and (b) (d))
    :effect (and (a) (c))))
