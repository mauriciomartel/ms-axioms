;; from 2011-07-08 08:00:00 to 2011-07-08 09:00:00: 20 observations (18 alarms), 41 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Line_X3_X4 - Line
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Line_X19_X20 - Line
   Breaker_X21_X22 - Breaker
   Bus_X23 - bus
   Bus_X2 - bus
   Generator_X23_1 - generator
   Generator_X2_1 - generator
   Line_X24_X25 - Line
   Line_X26_X27 - Line
   Breaker_X28_X29 - Breaker
   Breaker_X30_X31 - Breaker
   Breaker_X32_X33 - Breaker
   Breaker_X34_X35 - Breaker
   Breaker_X36_X37 - Breaker
   Breaker_X38_X39 - Breaker
   Breaker_X40_X41 - Breaker
   Breaker_X42_X43 - Breaker
   Breaker_X44_X45 - Breaker
   Breaker_X46_X47 - Breaker
   Breaker_X48_X49 - Breaker
   Breaker_X50_X51 - Breaker
   Breaker_X52_X53 - Breaker
   Bus_X3 - bus
   Bus_X7 - bus
   Bus_X19 - bus
   Bus_X24 - bus
   Bus_X26 - bus
   Bus_X4 - bus
   Bus_X8 - bus
   Bus_X20 - bus
   Bus_X25 - bus
   Bus_X27 - bus
   Breaker_X54_X23 - Breaker
   obs2524 - observation
   obs2525 - observation
   obs2526 - observation
   obs2527 - observation
   obs2528 - observation
   obs2529 - observation
   obs2530 - observation
   obs2531 - observation
   obs2532 - observation
   obs2533 - observation
   obs2534 - observation
   obs2535 - observation
   obs2536 - observation
   obs2537 - observation
   obs2538 - observation
   obs2539 - observation
   obs2540 - observation
   obs2541 - observation
   obs2542 - observation
   obs2543 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X7_X8 Breaker_X28_X29 Breaker_X36_X37 Breaker_X9_X10 Breaker_X46_X47)
   (line-isolator Breaker_X28_X29 Line_X7_X8)
   (line-isolator Breaker_X36_X37 Line_X7_X8)
   (line-isolator Breaker_X9_X10 Line_X7_X8)
   (line-isolator Breaker_X46_X47 Line_X7_X8)
   (line-isolators-4 Line_X3_X4 Breaker_X30_X31 Breaker_X5_X6 Breaker_X9_X10 Breaker_X46_X47)
   (line-isolator Breaker_X30_X31 Line_X3_X4)
   (line-isolator Breaker_X5_X6 Line_X3_X4)
   (line-isolator Breaker_X9_X10 Line_X3_X4)
   (line-isolator Breaker_X46_X47 Line_X3_X4)
   (line-isolators-4 Line_X24_X25 Breaker_X32_X33 Breaker_X13_X14 Breaker_X42_X43 Breaker_X48_X49)
   (line-isolator Breaker_X32_X33 Line_X24_X25)
   (line-isolator Breaker_X13_X14 Line_X24_X25)
   (line-isolator Breaker_X42_X43 Line_X24_X25)
   (line-isolator Breaker_X48_X49 Line_X24_X25)
   (line-isolators-4 Line_X19_X20 Breaker_X34_X35 Breaker_X38_X39 Breaker_X17_X18 Breaker_X50_X51)
   (line-isolator Breaker_X34_X35 Line_X19_X20)
   (line-isolator Breaker_X38_X39 Line_X19_X20)
   (line-isolator Breaker_X17_X18 Line_X19_X20)
   (line-isolator Breaker_X50_X51 Line_X19_X20)
   (line-isolators-4 Line_X26_X27 Breaker_X15_X16 Breaker_X40_X41 Breaker_X44_X45 Breaker_X52_X53)
   (line-isolator Breaker_X15_X16 Line_X26_X27)
   (line-isolator Breaker_X40_X41 Line_X26_X27)
   (line-isolator Breaker_X44_X45 Line_X26_X27)
   (line-isolator Breaker_X52_X53 Line_X26_X27)
   (adjacent Line_X3_X4 Bus_X3)
   (adjacent Line_X3_X4 Bus_X4)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (adjacent Line_X19_X20 Bus_X19)
   (adjacent Line_X19_X20 Bus_X20)
   (adjacent Line_X24_X25 Bus_X24)
   (adjacent Line_X24_X25 Bus_X25)
   (adjacent Line_X26_X27 Bus_X26)
   (adjacent Line_X26_X27 Bus_X27)
   (generator-attached-to Generator_X23_1 Bus_X23)
   (generator-attached-to Generator_X2_1 Bus_X2)
   (generator-isolator Breaker_X54_X23 Bus_X23)
   (generator-isolator Breaker_X1_X2 Bus_X2)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X28_X29)
   (breaker-ar-status-is-unknown Breaker_X28_X29)
   (breaker-state-is-unknown Breaker_X30_X31)
   (breaker-ar-status-is-unknown Breaker_X30_X31)
   (breaker-state-is-unknown Breaker_X32_X33)
   (breaker-ar-status-is-unknown Breaker_X32_X33)
   (breaker-state-is-unknown Breaker_X34_X35)
   (breaker-ar-status-is-unknown Breaker_X34_X35)
   (breaker-state-is-unknown Breaker_X36_X37)
   (breaker-ar-status-is-unknown Breaker_X36_X37)
   (breaker-state-is-unknown Breaker_X38_X39)
   (breaker-ar-status-is-unknown Breaker_X38_X39)
   (breaker-state-is-unknown Breaker_X40_X41)
   (breaker-ar-status-is-unknown Breaker_X40_X41)
   (breaker-state-is-unknown Breaker_X42_X43)
   (breaker-ar-status-is-unknown Breaker_X42_X43)
   (breaker-state-is-unknown Breaker_X44_X45)
   (breaker-ar-status-is-unknown Breaker_X44_X45)
   (breaker-state-is-unknown Breaker_X46_X47)
   (breaker-ar-status-is-unknown Breaker_X46_X47)
   (breaker-state-is-unknown Breaker_X48_X49)
   (breaker-ar-status-is-unknown Breaker_X48_X49)
   (breaker-state-is-unknown Breaker_X50_X51)
   (breaker-ar-status-is-unknown Breaker_X50_X51)
   (breaker-state-is-unknown Breaker_X52_X53)
   (breaker-ar-status-is-unknown Breaker_X52_X53)
   (breaker-state-is-unknown Breaker_X54_X23)
   (breaker-ar-status-is-unknown Breaker_X54_X23)
   (line-voltage-unknown Line_X3_X4)
   (line-voltage-unknown Line_X7_X8)
   (line-voltage-unknown Line_X19_X20)
   (line-voltage-unknown Line_X24_X25)
   (line-voltage-unknown Line_X26_X27)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X3)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X4)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X20)
   (bus-voltage-unknown Bus_X19)
   (bus-voltage-unknown Bus_X27)
   (generator-status-is-unknown Generator_X23_1)
   (generator-status-is-unknown Generator_X2_1)

   ;; 1310112000 (2011-07-08 08:00:00):
   (matches-4 obs2524 command Breaker_X9_X10 cb_state open)
   (pending obs2524)

   ;; 1310112020 (2011-07-08 08:00:20):
   (matches-3 obs2525 Breaker_X9_X10 cb_state open)
   (future obs2525)
   (precedes obs2525 obs2524)
   (delay-short-time obs2525 obs2524)
   (delay-trip-wait obs2525 obs2524)

   ;; 1310112022 (2011-07-08 08:00:22):
   (matches-3 obs2526 Breaker_X17_X18 cb_state open)
   (future obs2526)
   (precedes obs2526 obs2525)
   (delay-trip-wait obs2526 obs2525)

   ;; 1310112023 (2011-07-08 08:00:23):
   (matches-3 obs2527 Line_X7_X8 entered_zero_zone KV)
   (future obs2527)
   (precedes obs2527 obs2526)

   ;; 1310112024 (2011-07-08 08:00:24):
   (matches-3 obs2528 Line_X19_X20 entered_zero_zone KV)
   (future obs2528)
   (precedes obs2528 obs2527)
   (delay-trip-wait obs2528 obs2526)

   ;; 1310112027 (2011-07-08 08:00:27):
   (matches-3 obs2529 Breaker_X5_X6 ar_supy_control_status NON_AUTO)
   (future obs2529)
   (precedes obs2529 obs2528)
   (delay-trip-wait obs2529 obs2528)
   (delay-trip-wait obs2529 obs2527)

   ;; 1310112030 (2011-07-08 08:00:30):
   (matches-3 obs2530 Bus_X23 entered_zero_zone MW)
   (future obs2530)
   (precedes obs2530 obs2529)
   (delay-trip-wait obs2530 obs2529)

   ;; 1310112030 (2011-07-08 08:00:30):
   (matches-3 obs2531 Line_X3_X4 entered_zero_zone KV)
   (future obs2531)
   (precedes obs2531 obs2529)
   (delay-trip-wait obs2531 obs2529)

   ;; 1310112032 (2011-07-08 08:00:32):
   (matches-3 obs2532 Generator_X23_1 runback reset)
   (future obs2532)
   (precedes obs2532 obs2530)
   (precedes obs2532 obs2531)
   (delay-trip-wait obs2532 obs2531)
   (delay-trip-wait obs2532 obs2530)

   ;; 1310112032 (2011-07-08 08:00:32):
   (matches-3 obs2533 Generator_X2_1 runback alarm)
   (future obs2533)
   (precedes obs2533 obs2530)
   (precedes obs2533 obs2531)
   (delay-trip-wait obs2533 obs2531)
   (delay-trip-wait obs2533 obs2530)

   ;; 1310112033 (2011-07-08 08:00:33):
   (matches-3 obs2534 Breaker_X11_X12 cb_state open)
   (future obs2534)
   (precedes obs2534 obs2532)
   (precedes obs2534 obs2533)

   ;; 1310112036 (2011-07-08 08:00:36):
   (matches-3 obs2535 Breaker_X13_X14 cb_state open)
   (future obs2535)
   (precedes obs2535 obs2534)
   (delay-trip-wait obs2535 obs2534)
   (delay-short-time obs2535 obs2525)
   (delay-trip-wait obs2535 obs2532)
   (delay-trip-wait obs2535 obs2533)

   ;; 1310112038 (2011-07-08 08:00:38):
   (matches-4 obs2536 command Breaker_X5_X6 cb_state open)
   (future obs2536)
   (precedes obs2536 obs2535)
   (delay-trip-wait obs2536 obs2535)
   (delay-short-time obs2536 obs2526)

   ;; 1310112038 (2011-07-08 08:00:38):
   (matches-3 obs2537 Breaker_X15_X16 cb_state closed)
   (future obs2537)
   (precedes obs2537 obs2535)
   (delay-trip-wait obs2537 obs2535)
   (delay-short-time obs2537 obs2526)

   ;; 1310112039 (2011-07-08 08:00:39):
   (matches-3 obs2538 Breaker_X1_X2 cb_state open)
   (future obs2538)
   (precedes obs2538 obs2536)
   (precedes obs2538 obs2537)
   (delay-short-time obs2538 obs2527)

   ;; 1310112039 (2011-07-08 08:00:39):
   (matches-3 obs2539 Breaker_X21_X22 cb_state closed)
   (future obs2539)
   (precedes obs2539 obs2536)
   (precedes obs2539 obs2537)
   (delay-short-time obs2539 obs2527)

   ;; 1310112040 (2011-07-08 08:00:40):
   (matches-3 obs2540 Bus_X2 entered_zero_zone MW)
   (future obs2540)
   (precedes obs2540 obs2538)
   (precedes obs2540 obs2539)
   (delay-short-time obs2540 obs2528)
   (delay-trip-wait obs2540 obs2536)
   (delay-trip-wait obs2540 obs2537)

   ;; 1310112040 (2011-07-08 08:00:40):
   (matches-3 obs2541 Generator_X2_1 unit_status OFF)
   (future obs2541)
   (precedes obs2541 obs2538)
   (precedes obs2541 obs2539)
   (delay-short-time obs2541 obs2528)
   (delay-trip-wait obs2541 obs2536)
   (delay-trip-wait obs2541 obs2537)

   ;; 1310112040 (2011-07-08 08:00:40):
   (matches-3 obs2542 Generator_X23_1 unit_status OFF)
   (future obs2542)
   (precedes obs2542 obs2538)
   (precedes obs2542 obs2539)
   (delay-short-time obs2542 obs2528)
   (delay-trip-wait obs2542 obs2536)
   (delay-trip-wait obs2542 obs2537)

   ;; 1310112040 (2011-07-08 08:00:40):
   (matches-3 obs2543 Generator_X2_1 runback alarm)
   (future obs2543)
   (precedes obs2543 obs2538)
   (precedes obs2543 obs2539)
   (delay-short-time obs2543 obs2528)
   (delay-trip-wait obs2543 obs2536)
   (delay-trip-wait obs2543 obs2537)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2524)
              (observed obs2525)
              (observed obs2526)
              (observed obs2527)
              (observed obs2528)
              (observed obs2529)
              (observed obs2530)
              (observed obs2531)
              (observed obs2532)
              (observed obs2533)
              (observed obs2534)
              (observed obs2535)
              (observed obs2536)
              (observed obs2537)
              (observed obs2538)
              (observed obs2539)
              (observed obs2540)
              (observed obs2541)
              (observed obs2542)
              (observed obs2543)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.360 (cpu) 1.475 (real)
