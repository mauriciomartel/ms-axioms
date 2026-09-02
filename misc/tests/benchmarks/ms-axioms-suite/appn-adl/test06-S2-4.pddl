;; from 2011-07-01 03:00:00 to 2011-07-01 04:00:00: 5 observations (2 alarms), 11 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Line_X9_X10 - Line
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Bus_X7 - bus
   Bus_X9 - bus
   Bus_X8 - bus
   Bus_X10 - bus
   obs60 - observation
   obs61 - observation
   obs62 - observation
   obs63 - observation
   obs64 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X7_X8 Breaker_X5_X6 Breaker_X3_X4)
   (line-isolator Breaker_X5_X6 Line_X7_X8)
   (line-isolator Breaker_X3_X4 Line_X7_X8)
   (line-isolators-3 Line_X9_X10 Breaker_X1_X2 Breaker_X11_X12 Breaker_X13_X14)
   (line-isolator Breaker_X1_X2 Line_X9_X10)
   (line-isolator Breaker_X11_X12 Line_X9_X10)
   (line-isolator Breaker_X13_X14 Line_X9_X10)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (adjacent Line_X9_X10 Bus_X9)
   (adjacent Line_X9_X10 Bus_X10)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (line-voltage-unknown Line_X7_X8)
   (line-voltage-unknown Line_X9_X10)
   (bus-voltage-unknown Bus_X9)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X10)

   ;; 1309489200 (2011-07-01 03:00:00):
   (matches-4 obs60 command Breaker_X1_X2 cb_state closed)
   (pending obs60)

   ;; 1309489222 (2011-07-01 03:00:22):
   (matches-3 obs61 Breaker_X1_X2 cb_state closed)
   (future obs61)
   (precedes obs61 obs60)
   (delay-short-time obs61 obs60)
   (delay-trip-wait obs61 obs60)

   ;; 1309489247 (2011-07-01 03:00:47):
   (matches-4 obs62 command Breaker_X3_X4 cb_state closed)
   (future obs62)
   (precedes obs62 obs61)
   (delay-rc-wait obs62 obs60)
   (delay-short-time obs62 obs61)
   (delay-trip-wait obs62 obs61)

   ;; 1309489256 (2011-07-01 03:00:56):
   (matches-4 obs63 command Breaker_X5_X6 cb_state closed)
   (future obs63)
   (precedes obs63 obs62)
   (delay-trip-wait obs63 obs62)

   ;; 1309489273 (2011-07-01 03:01:13):
   (matches-3 obs64 Breaker_X3_X4 cb_state closed)
   (future obs64)
   (precedes obs64 obs63)
   (delay-short-time obs64 obs63)
   (delay-trip-wait obs64 obs63)
   (delay-rc-wait obs64 obs61)
   (delay-short-time obs64 obs62)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs60)
              (observed obs61)
              (observed obs62)
              (observed obs63)
              (observed obs64)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.572 (cpu) 2.548 (real)
