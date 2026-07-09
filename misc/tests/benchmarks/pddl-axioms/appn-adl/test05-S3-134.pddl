;; from 2011-07-06 13:00:00 to 2011-07-06 14:00:00: 7 observations (4 alarms), 10 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Line_X11_X12 - Line
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Bus_X11 - bus
   Bus_X12 - bus
   obs2501 - observation
   obs2502 - observation
   obs2503 - observation
   obs2504 - observation
   obs2505 - observation
   obs2506 - observation
   obs2507 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X11_X12 Breaker_X1_X2 Breaker_X13_X14 Breaker_X15_X16 Breaker_X5_X6)
   (line-isolator Breaker_X1_X2 Line_X11_X12)
   (line-isolator Breaker_X13_X14 Line_X11_X12)
   (line-isolator Breaker_X15_X16 Line_X11_X12)
   (line-isolator Breaker_X5_X6 Line_X11_X12)
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
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (line-voltage-unknown Line_X11_X12)
   (bus-voltage-unknown Bus_X11)
   (bus-voltage-unknown Bus_X12)

   ;; 1309957200 (2011-07-06 13:00:00):
   (matches-3 obs2501 Breaker_X5_X6 cb_state closed)
   (pending obs2501)

   ;; 1309957205 (2011-07-06 13:00:05):
   (matches-3 obs2502 Breaker_X7_X8 cb_state closed)
   (future obs2502)
   (precedes obs2502 obs2501)
   (delay-trip-wait obs2502 obs2501)

   ;; 1309957208 (2011-07-06 13:00:08):
   (matches-4 obs2503 command Breaker_X3_X4 cb_state closed)
   (future obs2503)
   (precedes obs2503 obs2502)
   (delay-trip-wait obs2503 obs2502)

   ;; 1309957213 (2011-07-06 13:00:13):
   (matches-3 obs2504 Breaker_X3_X4 cb_state closed)
   (future obs2504)
   (precedes obs2504 obs2503)
   (delay-trip-wait obs2504 obs2503)

   ;; 1309957215 (2011-07-06 13:00:15):
   (matches-3 obs2505 Breaker_X9_X10 cb_state closed)
   (future obs2505)
   (precedes obs2505 obs2504)
   (delay-trip-wait obs2505 obs2504)

   ;; 1309957234 (2011-07-06 13:00:34):
   (matches-4 obs2506 command Breaker_X1_X2 cb_state closed)
   (future obs2506)
   (precedes obs2506 obs2505)
   (delay-short-time obs2506 obs2503)
   (delay-short-time obs2506 obs2504)
   (delay-short-time obs2506 obs2502)
   (delay-short-time obs2506 obs2501)
   (delay-short-time obs2506 obs2505)
   (delay-trip-wait obs2506 obs2505)

   ;; 1309957268 (2011-07-06 13:01:08):
   (matches-3 obs2507 Breaker_X1_X2 cb_state closed)
   (future obs2507)
   (precedes obs2507 obs2506)
   (delay-rc-wait obs2507 obs2503)
   (delay-short-time obs2507 obs2506)
   (delay-trip-wait obs2507 obs2506)
   (delay-rc-wait obs2507 obs2504)
   (delay-rc-wait obs2507 obs2502)
   (delay-rc-wait obs2507 obs2501)
   (delay-rc-wait obs2507 obs2505)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2501)
              (observed obs2502)
              (observed obs2503)
              (observed obs2504)
              (observed obs2505)
              (observed obs2506)
              (observed obs2507)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.456 (cpu) 1.483 (real)
