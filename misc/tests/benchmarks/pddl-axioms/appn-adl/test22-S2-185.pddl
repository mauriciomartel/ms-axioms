;; from 2011-07-08 16:00:00 to 2011-07-08 17:00:00: 20 observations (15 alarms), 47 components
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
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Line_X21_X22 - Line
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Bus_X27 - bus
   Bus_X28 - bus
   Bus_X29 - bus
   Generator_X30_1 - generator
   Generator_X31_1 - generator
   Line_X32_X33 - Line
   Breaker_X34_X35 - Breaker
   Line_X36_X37 - Line
   Breaker_X38_X39 - Breaker
   Breaker_X40_X41 - Breaker
   Line_X42_X43 - Line
   Line_X44_X45 - Line
   Breaker_X46_X47 - Breaker
   Breaker_X48_X49 - Breaker
   Breaker_X50_X51 - Breaker
   Breaker_X52_X53 - Breaker
   Breaker_X54_X55 - Breaker
   Breaker_X56_X57 - Breaker
   Bus_X11 - bus
   Bus_X21 - bus
   Bus_X32 - bus
   Bus_X36 - bus
   Bus_X42 - bus
   Bus_X44 - bus
   Bus_X12 - bus
   Bus_X22 - bus
   Bus_X33 - bus
   Bus_X37 - bus
   Bus_X43 - bus
   Bus_X45 - bus
   Breaker_X58_X30 - Breaker
   Breaker_X59_X31 - Breaker
   Bus_X30 - bus
   Bus_X31 - bus
   obs2654 - observation
   obs2655 - observation
   obs2656 - observation
   obs2657 - observation
   obs2658 - observation
   obs2659 - observation
   obs2660 - observation
   obs2661 - observation
   obs2662 - observation
   obs2663 - observation
   obs2664 - observation
   obs2665 - observation
   obs2666 - observation
   obs2667 - observation
   obs2668 - observation
   obs2669 - observation
   obs2670 - observation
   obs2671 - observation
   obs2672 - observation
   obs2673 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X32_X33 Breaker_X34_X35 Breaker_X19_X20)
   (line-isolator Breaker_X34_X35 Line_X32_X33)
   (line-isolator Breaker_X19_X20 Line_X32_X33)
   (line-isolators-3 Line_X36_X37 Breaker_X38_X39 Breaker_X3_X4 Breaker_X40_X41)
   (line-isolator Breaker_X38_X39 Line_X36_X37)
   (line-isolator Breaker_X3_X4 Line_X36_X37)
   (line-isolator Breaker_X40_X41 Line_X36_X37)
   (line-isolators-4 Line_X42_X43 Breaker_X9_X10 Breaker_X7_X8 Breaker_X1_X2 Breaker_X54_X55)
   (line-isolator Breaker_X9_X10 Line_X42_X43)
   (line-isolator Breaker_X7_X8 Line_X42_X43)
   (line-isolator Breaker_X1_X2 Line_X42_X43)
   (line-isolator Breaker_X54_X55 Line_X42_X43)
   (line-isolators-4 Line_X11_X12 Breaker_X13_X14 Breaker_X48_X49 Breaker_X50_X51 Breaker_X56_X57)
   (line-isolator Breaker_X13_X14 Line_X11_X12)
   (line-isolator Breaker_X48_X49 Line_X11_X12)
   (line-isolator Breaker_X50_X51 Line_X11_X12)
   (line-isolator Breaker_X56_X57 Line_X11_X12)
   (line-isolators-4 Line_X44_X45 Breaker_X46_X47 Breaker_X23_X24 Breaker_X52_X53 Breaker_X17_X18)
   (line-isolator Breaker_X46_X47 Line_X44_X45)
   (line-isolator Breaker_X23_X24 Line_X44_X45)
   (line-isolator Breaker_X52_X53 Line_X44_X45)
   (line-isolator Breaker_X17_X18 Line_X44_X45)
   (adjacent Line_X11_X12 Bus_X11)
   (adjacent Line_X11_X12 Bus_X12)
   (adjacent Line_X21_X22 Bus_X21)
   (adjacent Line_X21_X22 Bus_X22)
   (adjacent Line_X32_X33 Bus_X32)
   (adjacent Line_X32_X33 Bus_X33)
   (adjacent Line_X36_X37 Bus_X36)
   (adjacent Line_X36_X37 Bus_X37)
   (adjacent Line_X42_X43 Bus_X42)
   (adjacent Line_X42_X43 Bus_X43)
   (adjacent Line_X44_X45 Bus_X44)
   (adjacent Line_X44_X45 Bus_X45)
   (generator-attached-to Generator_X30_1 Bus_X30)
   (generator-attached-to Generator_X31_1 Bus_X31)
   (generator-isolator Breaker_X58_X30 Bus_X30)
   (generator-isolator Breaker_X59_X31 Bus_X31)
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
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X34_X35)
   (breaker-ar-status-is-unknown Breaker_X34_X35)
   (breaker-state-is-unknown Breaker_X38_X39)
   (breaker-ar-status-is-unknown Breaker_X38_X39)
   (breaker-state-is-unknown Breaker_X40_X41)
   (breaker-ar-status-is-unknown Breaker_X40_X41)
   (breaker-state-is-unknown Breaker_X46_X47)
   (breaker-ar-status-is-unknown Breaker_X46_X47)
   (breaker-state-is-unknown Breaker_X48_X49)
   (breaker-ar-status-is-unknown Breaker_X48_X49)
   (breaker-state-is-unknown Breaker_X50_X51)
   (breaker-ar-status-is-unknown Breaker_X50_X51)
   (breaker-state-is-unknown Breaker_X52_X53)
   (breaker-ar-status-is-unknown Breaker_X52_X53)
   (breaker-state-is-unknown Breaker_X54_X55)
   (breaker-ar-status-is-unknown Breaker_X54_X55)
   (breaker-state-is-unknown Breaker_X56_X57)
   (breaker-ar-status-is-unknown Breaker_X56_X57)
   (breaker-state-is-unknown Breaker_X58_X30)
   (breaker-ar-status-is-unknown Breaker_X58_X30)
   (breaker-state-is-unknown Breaker_X59_X31)
   (breaker-ar-status-is-unknown Breaker_X59_X31)
   (line-voltage-unknown Line_X11_X12)
   (line-voltage-unknown Line_X21_X22)
   (line-voltage-unknown Line_X32_X33)
   (line-voltage-unknown Line_X36_X37)
   (line-voltage-unknown Line_X42_X43)
   (line-voltage-unknown Line_X44_X45)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X43)
   (bus-voltage-unknown Bus_X12)
   (bus-voltage-unknown Bus_X36)
   (bus-voltage-unknown Bus_X42)
   (bus-voltage-unknown Bus_X11)
   (bus-voltage-unknown Bus_X27)
   (bus-voltage-unknown Bus_X37)
   (bus-voltage-unknown Bus_X32)
   (bus-voltage-unknown Bus_X45)
   (bus-voltage-unknown Bus_X33)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X44)
   (bus-voltage-unknown Bus_X29)
   (bus-voltage-unknown Bus_X30)
   (bus-voltage-unknown Bus_X31)
   (generator-status-is-unknown Generator_X30_1)
   (generator-status-is-unknown Generator_X31_1)

   ;; 1310140800 (2011-07-08 16:00:00):
   (matches-4 obs2654 command Breaker_X13_X14 cb_state open)
   (pending obs2654)

   ;; 1310140816 (2011-07-08 16:00:16):
   (matches-3 obs2655 Breaker_X13_X14 cb_state open)
   (future obs2655)
   (precedes obs2655 obs2654)
   (delay-short-time obs2655 obs2654)
   (delay-trip-wait obs2655 obs2654)

   ;; 1310140817 (2011-07-08 16:00:17):
   (matches-3 obs2656 Line_X11_X12 entered_zero_zone KV)
   (future obs2656)
   (precedes obs2656 obs2655)

   ;; 1310140821 (2011-07-08 16:00:21):
   (matches-4 obs2657 Bus_X28 limit KV Normal)
   (future obs2657)
   (precedes obs2657 obs2656)
   (delay-trip-wait obs2657 obs2656)
   (delay-trip-wait obs2657 obs2655)

   ;; 1310140822 (2011-07-08 16:00:22):
   (matches-3 obs2658 Breaker_X7_X8 ar_supy_control_status NON_AUTO)
   (future obs2658)
   (precedes obs2658 obs2657)

   ;; 1310140843 (2011-07-08 16:00:43):
   (matches-4 obs2659 command Breaker_X1_X2 ar_supy_control_status NON_AUTO)
   (future obs2659)
   (precedes obs2659 obs2658)
   (delay-short-time obs2659 obs2658)
   (delay-trip-wait obs2659 obs2658)
   (delay-short-time obs2659 obs2656)
   (delay-short-time obs2659 obs2657)
   (delay-trip-wait obs2659 obs2657)
   (delay-short-time obs2659 obs2655)

   ;; 1310140850 (2011-07-08 16:00:50):
   (matches-3 obs2660 Breaker_X17_X18 cb_state open)
   (future obs2660)
   (precedes obs2660 obs2659)
   (delay-rc-wait obs2660 obs2654)
   (delay-trip-wait obs2660 obs2659)

   ;; 1310140850 (2011-07-08 16:00:50):
   (matches-4 obs2661 command Breaker_X9_X10 ar_supy_control_status NON_AUTO)
   (future obs2661)
   (precedes obs2661 obs2659)
   (delay-trip-wait obs2661 obs2659)

   ;; 1310140850 (2011-07-08 16:00:50):
   (matches-3 obs2662 Breaker_X23_X24 cb_state open)
   (future obs2662)
   (precedes obs2662 obs2659)
   (delay-trip-wait obs2662 obs2659)

   ;; 1310140853 (2011-07-08 16:00:53):
   (matches-3 obs2663 Line_X21_X22 entered_zero_zone KV)
   (future obs2663)
   (precedes obs2663 obs2660)
   (precedes obs2663 obs2661)
   (precedes obs2663 obs2662)
   (delay-trip-wait obs2663 obs2662)
   (delay-trip-wait obs2663 obs2660)
   (delay-trip-wait obs2663 obs2661)

   ;; 1310140855 (2011-07-08 16:00:55):
   (matches-3 obs2664 Breaker_X9_X10 ar_supy_control_status NON_AUTO)
   (future obs2664)
   (precedes obs2664 obs2663)
   (delay-trip-wait obs2664 obs2663)

   ;; 1310140867 (2011-07-08 16:01:07):
   (matches-3 obs2665 Breaker_X25_X26 cb_state open)
   (future obs2665)
   (precedes obs2665 obs2664)
   (delay-rc-wait obs2665 obs2656)
   (delay-short-time obs2665 obs2662)
   (delay-short-time obs2665 obs2660)
   (delay-rc-wait obs2665 obs2657)
   (delay-rc-wait obs2665 obs2655)
   (delay-short-time obs2665 obs2659)
   (delay-trip-wait obs2665 obs2664)
   (delay-short-time obs2665 obs2661)

   ;; 1310140868 (2011-07-08 16:01:08):
   (matches-3 obs2666 Breaker_X19_X20 cb_state open)
   (future obs2666)
   (precedes obs2666 obs2665)

   ;; 1310140868 (2011-07-08 16:01:08):
   (matches-3 obs2667 Generator_X31_1 runback alarm)
   (future obs2667)
   (precedes obs2667 obs2665)

   ;; 1310140869 (2011-07-08 16:01:09):
   (matches-3 obs2668 Breaker_X15_X16 cb_state open)
   (future obs2668)
   (precedes obs2668 obs2666)
   (precedes obs2668 obs2667)
   (delay-trip-wait obs2668 obs2665)
   (delay-short-time obs2668 obs2663)

   ;; 1310140872 (2011-07-08 16:01:12):
   (matches-3 obs2669 Generator_X30_1 unit_status OFF)
   (future obs2669)
   (precedes obs2669 obs2668)
   (delay-trip-wait obs2669 obs2666)
   (delay-trip-wait obs2669 obs2668)
   (delay-trip-wait obs2669 obs2667)
   (delay-short-time obs2669 obs2664)

   ;; 1310140873 (2011-07-08 16:01:13):
   (matches-4 obs2670 Bus_X29 limit KV High)
   (future obs2670)
   (precedes obs2670 obs2669)

   ;; 1310140874 (2011-07-08 16:01:14):
   (matches-4 obs2671 Bus_X27 limit KV Normal)
   (future obs2671)
   (precedes obs2671 obs2670)
   (delay-trip-wait obs2671 obs2669)

   ;; 1310140878 (2011-07-08 16:01:18):
   (matches-4 obs2672 command Breaker_X5_X6 ar_supy_control_status NON_AUTO)
   (future obs2672)
   (precedes obs2672 obs2671)
   (delay-trip-wait obs2672 obs2670)
   (delay-trip-wait obs2672 obs2671)

   ;; 1310140878 (2011-07-08 16:01:18):
   (matches-3 obs2673 Breaker_X3_X4 cb_state closed)
   (future obs2673)
   (precedes obs2673 obs2671)
   (delay-trip-wait obs2673 obs2670)
   (delay-trip-wait obs2673 obs2671)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2654)
              (observed obs2655)
              (observed obs2656)
              (observed obs2657)
              (observed obs2658)
              (observed obs2659)
              (observed obs2660)
              (observed obs2661)
              (observed obs2662)
              (observed obs2663)
              (observed obs2664)
              (observed obs2665)
              (observed obs2666)
              (observed obs2667)
              (observed obs2668)
              (observed obs2669)
              (observed obs2670)
              (observed obs2671)
              (observed obs2672)
              (observed obs2673)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.408 (cpu) 1.461 (real)
