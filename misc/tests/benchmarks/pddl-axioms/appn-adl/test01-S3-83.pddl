;; from 2011-07-04 10:00:00 to 2011-07-04 11:00:00: 5 observations (3 alarms), 1 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   obs1570 - observation
   obs1571 - observation
   obs1572 - observation
   obs1573 - observation
   obs1574 - observation
   )

  (:init
   (static-true)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)

   ;; 1309773600 (2011-07-04 10:00:00):
   (matches-4 obs1570 command Breaker_X1_X2 cb_state closed)
   (pending obs1570)

   ;; 1309773601 (2011-07-04 10:00:01):
   (matches-3 obs1571 Breaker_X1_X2 cb_state closed)
   (future obs1571)
   (precedes obs1571 obs1570)

   ;; 1309773604 (2011-07-04 10:00:04):
   (matches-3 obs1572 Breaker_X1_X2 cb_state abnormal)
   (future obs1572)
   (precedes obs1572 obs1571)
   (delay-trip-wait obs1572 obs1571)
   (delay-trip-wait obs1572 obs1570)

   ;; 1309773618 (2011-07-04 10:00:18):
   (matches-3 obs1573 Breaker_X1_X2 cb_state closed)
   (future obs1573)
   (precedes obs1573 obs1572)
   (delay-trip-wait obs1573 obs1572)
   (delay-short-time obs1573 obs1571)
   (delay-short-time obs1573 obs1570)

   ;; 1309773626 (2011-07-04 10:00:26):
   (matches-3 obs1574 Breaker_X1_X2 cb_state abnormal)
   (future obs1574)
   (precedes obs1574 obs1573)
   (delay-short-time obs1574 obs1572)
   (delay-trip-wait obs1574 obs1573)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1570)
              (observed obs1571)
              (observed obs1572)
              (observed obs1573)
              (observed obs1574)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.388 (cpu) 1.518 (real)
