;; from 2011-07-08 00:00:00 to 2011-07-08 01:00:00: 6 observations (3 alarms), 14 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Line_X9_X10 - Line
   Line_X11_X12 - Line
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Bus_X9 - bus
   Bus_X11 - bus
   Bus_X10 - bus
   Bus_X12 - bus
   obs2417 - observation
   obs2418 - observation
   obs2419 - observation
   obs2420 - observation
   obs2421 - observation
   obs2422 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X9_X10 Breaker_X3_X4 Breaker_X13_X14 Breaker_X15_X16 Breaker_X17_X18)
   (line-isolator Breaker_X3_X4 Line_X9_X10)
   (line-isolator Breaker_X13_X14 Line_X9_X10)
   (line-isolator Breaker_X15_X16 Line_X9_X10)
   (line-isolator Breaker_X17_X18 Line_X9_X10)
   (line-isolators-4 Line_X11_X12 Breaker_X1_X2 Breaker_X5_X6 Breaker_X7_X8 Breaker_X19_X20)
   (line-isolator Breaker_X1_X2 Line_X11_X12)
   (line-isolator Breaker_X5_X6 Line_X11_X12)
   (line-isolator Breaker_X7_X8 Line_X11_X12)
   (line-isolator Breaker_X19_X20 Line_X11_X12)
   (adjacent Line_X9_X10 Bus_X9)
   (adjacent Line_X9_X10 Bus_X10)
   (adjacent Line_X11_X12 Bus_X11)
   (adjacent Line_X11_X12 Bus_X12)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (line-voltage-unknown Line_X9_X10)
   (line-voltage-unknown Line_X11_X12)
   (bus-voltage-unknown Bus_X11)
   (bus-voltage-unknown Bus_X9)
   (bus-voltage-unknown Bus_X12)
   (bus-voltage-unknown Bus_X10)

   ;; 1310083200 (2011-07-08 00:00:00):
   (matches-4 obs2417 command Breaker_X7_X8 cb_state closed)
   (pending obs2417)

   ;; 1310083218 (2011-07-08 00:00:18):
   (matches-3 obs2418 Breaker_X7_X8 cb_state closed)
   (future obs2418)
   (precedes obs2418 obs2417)
   (delay-short-time obs2418 obs2417)
   (delay-trip-wait obs2418 obs2417)

   ;; 1310083232 (2011-07-08 00:00:32):
   (matches-3 obs2419 Breaker_X1_X2 cb_state closed)
   (future obs2419)
   (precedes obs2419 obs2418)
   (delay-trip-wait obs2419 obs2418)

   ;; 1310083235 (2011-07-08 00:00:35):
   (matches-3 obs2420 Breaker_X5_X6 cb_state closed)
   (future obs2420)
   (precedes obs2420 obs2419)
   (delay-short-time obs2420 obs2418)
   (delay-trip-wait obs2420 obs2419)

   ;; 1310083251 (2011-07-08 00:00:51):
   (matches-4 obs2421 command Breaker_X3_X4 cb_state closed)
   (future obs2421)
   (precedes obs2421 obs2420)
   (delay-short-time obs2421 obs2420)
   (delay-trip-wait obs2421 obs2420)
   (delay-rc-wait obs2421 obs2417)
   (delay-short-time obs2421 obs2419)

   ;; 1310083256 (2011-07-08 00:00:56):
   (matches-3 obs2422 Breaker_X3_X4 cb_state closed)
   (future obs2422)
   (precedes obs2422 obs2421)
   (delay-trip-wait obs2422 obs2421)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2417)
              (observed obs2418)
              (observed obs2419)
              (observed obs2420)
              (observed obs2421)
              (observed obs2422)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.380 (cpu) 1.412 (real)
