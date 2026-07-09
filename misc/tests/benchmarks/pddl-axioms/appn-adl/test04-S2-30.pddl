;; from 2011-07-02 05:00:00 to 2011-07-02 06:00:00: 5 observations (5 alarms), 8 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Bus_X2 - bus
   Bus_X7 - bus
   Bus_X8 - bus
   Generator_X2_1 - generator
   obs413 - observation
   obs414 - observation
   obs415 - observation
   obs416 - observation
   obs417 - observation
   )

  (:init
   (static-true)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (generator-attached-to Generator_X2_1 Bus_X2)
   (generator-isolator Breaker_X1_X2 Bus_X2)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (line-voltage-unknown Line_X7_X8)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X8)
   (generator-status-is-unknown Generator_X2_1)

   ;; 1309582800 (2011-07-02 05:00:00):
   (matches-3 obs413 Breaker_X3_X4 cb_state open)
   (pending obs413)

   ;; 1309582800 (2011-07-02 05:00:00):
   (matches-3 obs414 Breaker_X1_X2 cb_state open)
   (pending obs414)

   ;; 1309582801 (2011-07-02 05:00:01):
   (matches-3 obs415 Line_X7_X8 entered_zero_zone KV)
   (future obs415)
   (precedes obs415 obs413)
   (precedes obs415 obs414)

   ;; 1309582809 (2011-07-02 05:00:09):
   (matches-3 obs416 Bus_X2 entered_zero_zone MW)
   (future obs416)
   (precedes obs416 obs415)
   (delay-trip-wait obs416 obs413)
   (delay-trip-wait obs416 obs414)
   (delay-trip-wait obs416 obs415)

   ;; 1309582815 (2011-07-02 05:00:15):
   (matches-3 obs417 Breaker_X5_X6 cb_state closed)
   (future obs417)
   (precedes obs417 obs416)
   (delay-trip-wait obs417 obs416)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs413)
              (observed obs414)
              (observed obs415)
              (observed obs416)
              (observed obs417)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.372 (cpu) 1.483 (real)
