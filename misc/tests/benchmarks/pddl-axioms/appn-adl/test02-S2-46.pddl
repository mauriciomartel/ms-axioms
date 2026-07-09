;; from 2011-07-02 21:00:00 to 2011-07-02 22:00:00: 7 observations (4 alarms), 5 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   obs628 - observation
   obs629 - observation
   obs630 - observation
   obs631 - observation
   obs632 - observation
   obs633 - observation
   obs634 - observation
   )

  (:init
   (static-true)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)

   ;; 1309640400 (2011-07-02 21:00:00):
   (matches-4 obs628 command Breaker_X9_X10 cb_state closed)
   (pending obs628)

   ;; 1309640402 (2011-07-02 21:00:02):
   (matches-4 obs629 command Breaker_X7_X8 cb_state closed)
   (future obs629)
   (precedes obs629 obs628)
   (delay-trip-wait obs629 obs628)

   ;; 1309640419 (2011-07-02 21:00:19):
   (matches-3 obs630 Breaker_X9_X10 cb_state closed)
   (future obs630)
   (precedes obs630 obs629)
   (delay-short-time obs630 obs628)
   (delay-short-time obs630 obs629)
   (delay-trip-wait obs630 obs629)

   ;; 1309640423 (2011-07-02 21:00:23):
   (matches-3 obs631 Breaker_X5_X6 cb_state closed)
   (future obs631)
   (precedes obs631 obs630)
   (delay-trip-wait obs631 obs630)

   ;; 1309640439 (2011-07-02 21:00:39):
   (matches-3 obs632 Breaker_X7_X8 cb_state closed)
   (future obs632)
   (precedes obs632 obs631)
   (delay-short-time obs632 obs631)
   (delay-trip-wait obs632 obs631)
   (delay-short-time obs632 obs630)

   ;; 1309640444 (2011-07-02 21:00:44):
   (matches-4 obs633 command Breaker_X3_X4 cb_state closed)
   (future obs633)
   (precedes obs633 obs632)
   (delay-trip-wait obs633 obs632)

   ;; 1309640444 (2011-07-02 21:00:44):
   (matches-3 obs634 Breaker_X1_X2 cb_state closed)
   (future obs634)
   (precedes obs634 obs632)
   (delay-trip-wait obs634 obs632)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs628)
              (observed obs629)
              (observed obs630)
              (observed obs631)
              (observed obs632)
              (observed obs633)
              (observed obs634)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.396 (cpu) 1.504 (real)
