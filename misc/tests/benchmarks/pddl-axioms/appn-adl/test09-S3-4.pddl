;; from 2011-07-01 03:00:00 to 2011-07-01 04:00:00: 6 observations (4 alarms), 20 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Line_X9_X10 - Line
   Breaker_X11_X12 - Breaker
   Line_X13_X14 - Line
   Line_X15_X16 - Line
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Breaker_X27_X28 - Breaker
   Bus_X9 - bus
   Bus_X13 - bus
   Bus_X15 - bus
   Bus_X10 - bus
   Bus_X14 - bus
   Bus_X16 - bus
   obs60 - observation
   obs61 - observation
   obs62 - observation
   obs63 - observation
   obs64 - observation
   obs65 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X9_X10 Breaker_X11_X12 Breaker_X5_X6 Breaker_X1_X2)
   (line-isolator Breaker_X11_X12 Line_X9_X10)
   (line-isolator Breaker_X5_X6 Line_X9_X10)
   (line-isolator Breaker_X1_X2 Line_X9_X10)
   (line-isolators-4 Line_X13_X14 Breaker_X5_X6 Breaker_X19_X20 Breaker_X21_X22 Breaker_X25_X26)
   (line-isolator Breaker_X5_X6 Line_X13_X14)
   (line-isolator Breaker_X19_X20 Line_X13_X14)
   (line-isolator Breaker_X21_X22 Line_X13_X14)
   (line-isolator Breaker_X25_X26 Line_X13_X14)
   (line-isolators-4 Line_X15_X16 Breaker_X17_X18 Breaker_X3_X4 Breaker_X23_X24 Breaker_X27_X28)
   (line-isolator Breaker_X17_X18 Line_X15_X16)
   (line-isolator Breaker_X3_X4 Line_X15_X16)
   (line-isolator Breaker_X23_X24 Line_X15_X16)
   (line-isolator Breaker_X27_X28 Line_X15_X16)
   (adjacent Line_X9_X10 Bus_X9)
   (adjacent Line_X9_X10 Bus_X10)
   (adjacent Line_X13_X14 Bus_X13)
   (adjacent Line_X13_X14 Bus_X14)
   (adjacent Line_X15_X16 Bus_X15)
   (adjacent Line_X15_X16 Bus_X16)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X27_X28)
   (breaker-ar-status-is-unknown Breaker_X27_X28)
   (line-voltage-unknown Line_X9_X10)
   (line-voltage-unknown Line_X13_X14)
   (line-voltage-unknown Line_X15_X16)
   (bus-voltage-unknown Bus_X9)
   (bus-voltage-unknown Bus_X10)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X14)
   (bus-voltage-unknown Bus_X16)

   ;; 1309489200 (2011-07-01 03:00:00):
   (matches-4 obs60 command Breaker_X1_X2 cb_state closed)
   (pending obs60)

   ;; 1309489203 (2011-07-01 03:00:03):
   (matches-3 obs61 Breaker_X5_X6 cb_state closed)
   (future obs61)
   (precedes obs61 obs60)
   (delay-trip-wait obs61 obs60)

   ;; 1309489204 (2011-07-01 03:00:04):
   (matches-3 obs62 Breaker_X7_X8 cb_state closed)
   (future obs62)
   (precedes obs62 obs61)

   ;; 1309489205 (2011-07-01 03:00:05):
   (matches-4 obs63 command Breaker_X3_X4 cb_state closed)
   (future obs63)
   (precedes obs63 obs62)
   (delay-trip-wait obs63 obs61)

   ;; 1309489227 (2011-07-01 03:00:27):
   (matches-3 obs64 Breaker_X1_X2 cb_state closed)
   (future obs64)
   (precedes obs64 obs63)
   (delay-short-time obs64 obs60)
   (delay-short-time obs64 obs63)
   (delay-trip-wait obs64 obs63)
   (delay-short-time obs64 obs61)
   (delay-short-time obs64 obs62)
   (delay-trip-wait obs64 obs62)

   ;; 1309489239 (2011-07-01 03:00:39):
   (matches-3 obs65 Breaker_X3_X4 cb_state closed)
   (future obs65)
   (precedes obs65 obs64)
   (delay-trip-wait obs65 obs64)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs60)
              (observed obs61)
              (observed obs62)
              (observed obs63)
              (observed obs64)
              (observed obs65)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.428 (cpu) 1.462 (real)
