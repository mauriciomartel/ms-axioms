;; from 2011-07-08 09:00:00 to 2011-07-08 10:00:00: 20 observations (20 alarms), 31 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Line_X5_X6 - Line
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Bus_X3 - bus
   Bus_X17 - bus
   Bus_X12 - bus
   Generator_X8_1 - generator
   Generator_X10_1 - generator
   Generator_X12_1 - generator
   Generator_X18_1 - generator
   Generator_X14_1 - generator
   Line_X19_X20 - Line
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Bus_X5 - bus
   Bus_X19 - bus
   Bus_X6 - bus
   Bus_X20 - bus
   Breaker_X27_X18 - Breaker
   Bus_X8 - bus
   Bus_X10 - bus
   Bus_X18 - bus
   Bus_X14 - bus
   Bus_X16 - bus
   Generator_X16_1 - generator
   obs2544 - observation
   obs2545 - observation
   obs2546 - observation
   obs2547 - observation
   obs2548 - observation
   obs2549 - observation
   obs2550 - observation
   obs2551 - observation
   obs2552 - observation
   obs2553 - observation
   obs2554 - observation
   obs2555 - observation
   obs2556 - observation
   obs2557 - observation
   obs2558 - observation
   obs2559 - observation
   obs2560 - observation
   obs2561 - observation
   obs2562 - observation
   obs2563 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X19_X20 Breaker_X21_X22 Breaker_X23_X24 Breaker_X25_X26 Breaker_X1_X2)
   (line-isolator Breaker_X21_X22 Line_X19_X20)
   (line-isolator Breaker_X23_X24 Line_X19_X20)
   (line-isolator Breaker_X25_X26 Line_X19_X20)
   (line-isolator Breaker_X1_X2 Line_X19_X20)
   (adjacent Line_X5_X6 Bus_X5)
   (adjacent Line_X5_X6 Bus_X6)
   (adjacent Line_X19_X20 Bus_X19)
   (adjacent Line_X19_X20 Bus_X20)
   (generator-attached-to Generator_X8_1 Bus_X8)
   (generator-attached-to Generator_X10_1 Bus_X10)
   (generator-attached-to Generator_X12_1 Bus_X12)
   (generator-attached-to Generator_X18_1 Bus_X18)
   (generator-attached-to Generator_X14_1 Bus_X14)
   (generator-attached-to Generator_X16_1 Bus_X16)
   (generator-isolator Breaker_X7_X8 Bus_X8)
   (generator-isolator Breaker_X9_X10 Bus_X10)
   (generator-isolator Breaker_X11_X12 Bus_X12)
   (generator-isolator Breaker_X27_X18 Bus_X18)
   (generator-isolator Breaker_X13_X14 Bus_X14)
   (generator-isolator Breaker_X15_X16 Bus_X16)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X27_X18)
   (breaker-ar-status-is-unknown Breaker_X27_X18)
   (line-voltage-unknown Line_X5_X6)
   (line-voltage-unknown Line_X19_X20)
   (bus-voltage-unknown Bus_X19)
   (bus-voltage-unknown Bus_X20)
   (bus-voltage-unknown Bus_X3)
   (bus-voltage-unknown Bus_X17)
   (bus-voltage-unknown Bus_X6)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X10)
   (bus-voltage-unknown Bus_X12)
   (bus-voltage-unknown Bus_X18)
   (bus-voltage-unknown Bus_X14)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X5)
   (generator-status-is-unknown Generator_X8_1)
   (generator-status-is-unknown Generator_X10_1)
   (generator-status-is-unknown Generator_X12_1)
   (generator-status-is-unknown Generator_X18_1)
   (generator-status-is-unknown Generator_X14_1)
   (generator-status-is-unknown Generator_X16_1)

   ;; 1310115600 (2011-07-08 09:00:00):
   (matches-3 obs2544 Breaker_X11_X12 cb_state open)
   (pending obs2544)

   ;; 1310115601 (2011-07-08 09:00:01):
   (matches-3 obs2545 Bus_X12 entered_zero_zone MW)
   (future obs2545)
   (precedes obs2545 obs2544)

   ;; 1310115610 (2011-07-08 09:00:10):
   (matches-3 obs2546 Breaker_X3_X4 cb_state open)
   (future obs2546)
   (precedes obs2546 obs2545)
   (delay-trip-wait obs2546 obs2544)
   (delay-trip-wait obs2546 obs2545)

   ;; 1310115613 (2011-07-08 09:00:13):
   (matches-3 obs2547 Breaker_X3_X4 cb_state closed)
   (future obs2547)
   (precedes obs2547 obs2546)
   (delay-trip-wait obs2547 obs2546)

   ;; 1310115613 (2011-07-08 09:00:13):
   (matches-3 obs2548 Generator_X18_1 runback alarm)
   (future obs2548)
   (precedes obs2548 obs2546)
   (delay-trip-wait obs2548 obs2546)

   ;; 1310115613 (2011-07-08 09:00:13):
   (matches-4 obs2549 Bus_X3 limit KV High)
   (future obs2549)
   (precedes obs2549 obs2546)
   (delay-trip-wait obs2549 obs2546)

   ;; 1310115618 (2011-07-08 09:00:18):
   (matches-3 obs2550 Breaker_X7_X8 cb_state open)
   (future obs2550)
   (precedes obs2550 obs2547)
   (precedes obs2550 obs2548)
   (precedes obs2550 obs2549)
   (delay-short-time obs2550 obs2544)
   (delay-trip-wait obs2550 obs2548)
   (delay-short-time obs2550 obs2545)
   (delay-trip-wait obs2550 obs2549)
   (delay-trip-wait obs2550 obs2547)

   ;; 1310115620 (2011-07-08 09:00:20):
   (matches-4 obs2551 Bus_X17 limit KV Normal)
   (future obs2551)
   (precedes obs2551 obs2550)
   (delay-trip-wait obs2551 obs2550)

   ;; 1310115621 (2011-07-08 09:00:21):
   (matches-3 obs2552 Generator_X12_1 unit_status OFF)
   (future obs2552)
   (precedes obs2552 obs2551)

   ;; 1310115623 (2011-07-08 09:00:23):
   (matches-3 obs2553 Generator_X14_1 unit_status OFF)
   (future obs2553)
   (precedes obs2553 obs2552)
   (delay-trip-wait obs2553 obs2551)
   (delay-trip-wait obs2553 obs2552)

   ;; 1310115623 (2011-07-08 09:00:23):
   (matches-3 obs2554 Breaker_X9_X10 cb_state open)
   (future obs2554)
   (precedes obs2554 obs2552)
   (delay-trip-wait obs2554 obs2551)
   (delay-trip-wait obs2554 obs2552)

   ;; 1310115625 (2011-07-08 09:00:25):
   (matches-3 obs2555 Generator_X8_1 runback alarm)
   (future obs2555)
   (precedes obs2555 obs2553)
   (precedes obs2555 obs2554)
   (delay-trip-wait obs2555 obs2554)
   (delay-trip-wait obs2555 obs2553)

   ;; 1310115632 (2011-07-08 09:00:32):
   (matches-3 obs2556 Breaker_X15_X16 cb_state open)
   (future obs2556)
   (precedes obs2556 obs2555)
   (delay-short-time obs2556 obs2548)
   (delay-short-time obs2556 obs2547)
   (delay-short-time obs2556 obs2546)
   (delay-trip-wait obs2556 obs2555)
   (delay-short-time obs2556 obs2549)

   ;; 1310115632 (2011-07-08 09:00:32):
   (matches-3 obs2557 Generator_X10_1 unit_status OFF)
   (future obs2557)
   (precedes obs2557 obs2555)
   (delay-short-time obs2557 obs2548)
   (delay-short-time obs2557 obs2547)
   (delay-short-time obs2557 obs2546)
   (delay-trip-wait obs2557 obs2555)
   (delay-short-time obs2557 obs2549)

   ;; 1310115636 (2011-07-08 09:00:36):
   (matches-4 obs2558 Line_X5_X6 limit MW Normal)
   (future obs2558)
   (precedes obs2558 obs2556)
   (precedes obs2558 obs2557)
   (delay-short-time obs2558 obs2551)
   (delay-short-time obs2558 obs2550)
   (delay-trip-wait obs2558 obs2556)
   (delay-trip-wait obs2558 obs2557)

   ;; 1310115637 (2011-07-08 09:00:37):
   (matches-3 obs2559 Breaker_X1_X2 cb_state closed)
   (future obs2559)
   (precedes obs2559 obs2558)
   (delay-short-time obs2559 obs2552)

   ;; 1310115638 (2011-07-08 09:00:38):
   (matches-3 obs2560 Generator_X12_1 runback reset)
   (future obs2560)
   (precedes obs2560 obs2559)
   (delay-trip-wait obs2560 obs2558)

   ;; 1310115638 (2011-07-08 09:00:38):
   (matches-3 obs2561 Breaker_X13_X14 cb_state open)
   (future obs2561)
   (precedes obs2561 obs2559)
   (delay-trip-wait obs2561 obs2558)

   ;; 1310115639 (2011-07-08 09:00:39):
   (matches-3 obs2562 Generator_X8_1 unit_status OFF)
   (future obs2562)
   (precedes obs2562 obs2560)
   (precedes obs2562 obs2561)
   (delay-short-time obs2562 obs2553)
   (delay-short-time obs2562 obs2554)
   (delay-trip-wait obs2562 obs2559)

   ;; 1310115641 (2011-07-08 09:00:41):
   (matches-3 obs2563 Breaker_X1_X2 cb_state open)
   (future obs2563)
   (precedes obs2563 obs2562)
   (delay-trip-wait obs2563 obs2561)
   (delay-trip-wait obs2563 obs2562)
   (delay-trip-wait obs2563 obs2560)
   (delay-short-time obs2563 obs2555)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2544)
              (observed obs2545)
              (observed obs2546)
              (observed obs2547)
              (observed obs2548)
              (observed obs2549)
              (observed obs2550)
              (observed obs2551)
              (observed obs2552)
              (observed obs2553)
              (observed obs2554)
              (observed obs2555)
              (observed obs2556)
              (observed obs2557)
              (observed obs2558)
              (observed obs2559)
              (observed obs2560)
              (observed obs2561)
              (observed obs2562)
              (observed obs2563)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.384 (cpu) 1.467 (real)
