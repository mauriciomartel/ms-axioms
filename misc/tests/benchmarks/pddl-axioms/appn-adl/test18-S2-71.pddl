;; from 2011-07-03 22:00:00 to 2011-07-03 23:00:00: 20 observations (20 alarms), 38 components
(define (problem network)
  (:domain APPN)

  (:objects
   Line_X1_X2 - Line
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Line_X13_X14 - Line
   Line_X15_X16 - Line
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Bus_X10 - bus
   Bus_X25 - bus
   Bus_X26 - bus
   Bus_X27 - bus
   Bus_X28 - bus
   Generator_X11_1 - generator
   Line_X29_X30 - Line
   Breaker_X31_X32 - Breaker
   Breaker_X33_X34 - Breaker
   Breaker_X35_X36 - Breaker
   Breaker_X37_X38 - Breaker
   Breaker_X39_X40 - Breaker
   Breaker_X41_X42 - Breaker
   Bus_X1 - bus
   Bus_X7 - bus
   Bus_X13 - bus
   Bus_X15 - bus
   Bus_X29 - bus
   Bus_X2 - bus
   Bus_X8 - bus
   Bus_X14 - bus
   Bus_X16 - bus
   Bus_X30 - bus
   Breaker_X26_X43 - Breaker
   Bus_X11 - bus
   Generator_X26_1 - generator
   obs998 - observation
   obs999 - observation
   obs1000 - observation
   obs1001 - observation
   obs1002 - observation
   obs1003 - observation
   obs1004 - observation
   obs1005 - observation
   obs1006 - observation
   obs1007 - observation
   obs1008 - observation
   obs1009 - observation
   obs1010 - observation
   obs1011 - observation
   obs1012 - observation
   obs1013 - observation
   obs1014 - observation
   obs1015 - observation
   obs1016 - observation
   obs1017 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X29_X30 Breaker_X5_X6 Breaker_X31_X32 Breaker_X35_X36)
   (line-isolator Breaker_X5_X6 Line_X29_X30)
   (line-isolator Breaker_X31_X32 Line_X29_X30)
   (line-isolator Breaker_X35_X36 Line_X29_X30)
   (line-isolators-3 Line_X7_X8 Breaker_X9_X10 Breaker_X33_X34 Breaker_X23_X24)
   (line-isolator Breaker_X9_X10 Line_X7_X8)
   (line-isolator Breaker_X33_X34 Line_X7_X8)
   (line-isolator Breaker_X23_X24 Line_X7_X8)
   (line-isolators-4 Line_X15_X16 Breaker_X37_X38 Breaker_X17_X18 Breaker_X39_X40 Breaker_X41_X42)
   (line-isolator Breaker_X37_X38 Line_X15_X16)
   (line-isolator Breaker_X17_X18 Line_X15_X16)
   (line-isolator Breaker_X39_X40 Line_X15_X16)
   (line-isolator Breaker_X41_X42 Line_X15_X16)
   (adjacent Line_X1_X2 Bus_X1)
   (adjacent Line_X1_X2 Bus_X2)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (adjacent Line_X13_X14 Bus_X13)
   (adjacent Line_X13_X14 Bus_X14)
   (adjacent Line_X15_X16 Bus_X15)
   (adjacent Line_X15_X16 Bus_X16)
   (adjacent Line_X29_X30 Bus_X29)
   (adjacent Line_X29_X30 Bus_X30)
   (generator-attached-to Generator_X26_1 Bus_X26)
   (generator-attached-to Generator_X11_1 Bus_X11)
   (generator-isolator Breaker_X26_X43 Bus_X26)
   (generator-isolator Breaker_X11_X12 Bus_X11)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
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
   (breaker-state-is-unknown Breaker_X31_X32)
   (breaker-ar-status-is-unknown Breaker_X31_X32)
   (breaker-state-is-unknown Breaker_X33_X34)
   (breaker-ar-status-is-unknown Breaker_X33_X34)
   (breaker-state-is-unknown Breaker_X35_X36)
   (breaker-ar-status-is-unknown Breaker_X35_X36)
   (breaker-state-is-unknown Breaker_X37_X38)
   (breaker-ar-status-is-unknown Breaker_X37_X38)
   (breaker-state-is-unknown Breaker_X39_X40)
   (breaker-ar-status-is-unknown Breaker_X39_X40)
   (breaker-state-is-unknown Breaker_X41_X42)
   (breaker-ar-status-is-unknown Breaker_X41_X42)
   (breaker-state-is-unknown Breaker_X26_X43)
   (breaker-ar-status-is-unknown Breaker_X26_X43)
   (line-voltage-unknown Line_X1_X2)
   (line-voltage-unknown Line_X7_X8)
   (line-voltage-unknown Line_X13_X14)
   (line-voltage-unknown Line_X15_X16)
   (line-voltage-unknown Line_X29_X30)
   (bus-voltage-unknown Bus_X1)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X29)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X10)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X11)
   (bus-voltage-unknown Bus_X27)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X30)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X14)
   (generator-status-is-unknown Generator_X26_1)
   (generator-status-is-unknown Generator_X11_1)

   ;; 1309730400 (2011-07-03 22:00:00):
   (matches-3 obs998 Breaker_X3_X4 cb_state open)
   (pending obs998)

   ;; 1309730403 (2011-07-03 22:00:03):
   (matches-3 obs999 Breaker_X11_X12 cb_state open)
   (future obs999)
   (precedes obs999 obs998)
   (delay-trip-wait obs999 obs998)

   ;; 1309730409 (2011-07-03 22:00:09):
   (matches-3 obs1000 Breaker_X9_X10 cb_state open)
   (future obs1000)
   (precedes obs1000 obs999)
   (delay-trip-wait obs1000 obs999)

   ;; 1309730409 (2011-07-03 22:00:09):
   (matches-3 obs1001 Breaker_X23_X24 cb_state open)
   (future obs1001)
   (precedes obs1001 obs999)
   (delay-trip-wait obs1001 obs999)

   ;; 1309730410 (2011-07-03 22:00:10):
   (matches-3 obs1002 Generator_X11_1 unit_status OFF)
   (future obs1002)
   (precedes obs1002 obs1000)
   (precedes obs1002 obs1001)

   ;; 1309730410 (2011-07-03 22:00:10):
   (matches-4 obs1003 Bus_X28 limit KV Low)
   (future obs1003)
   (precedes obs1003 obs1000)
   (precedes obs1003 obs1001)

   ;; 1309730410 (2011-07-03 22:00:10):
   (matches-3 obs1004 Breaker_X5_X6 cb_state open)
   (future obs1004)
   (precedes obs1004 obs1000)
   (precedes obs1004 obs1001)

   ;; 1309730410 (2011-07-03 22:00:10):
   (matches-4 obs1005 Line_X7_X8 limit KV Low)
   (future obs1005)
   (precedes obs1005 obs1000)
   (precedes obs1005 obs1001)

   ;; 1309730410 (2011-07-03 22:00:10):
   (matches-3 obs1006 Breaker_X17_X18 cb_state open)
   (future obs1006)
   (precedes obs1006 obs1000)
   (precedes obs1006 obs1001)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-3 obs1007 Breaker_X21_X22 cb_state open)
   (future obs1007)
   (precedes obs1007 obs1002)
   (precedes obs1007 obs1003)
   (precedes obs1007 obs1004)
   (precedes obs1007 obs1005)
   (precedes obs1007 obs1006)
   (delay-trip-wait obs1007 obs1001)
   (delay-trip-wait obs1007 obs1000)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-4 obs1008 Bus_X10 limit KV Low)
   (future obs1008)
   (precedes obs1008 obs1002)
   (precedes obs1008 obs1003)
   (precedes obs1008 obs1004)
   (precedes obs1008 obs1005)
   (precedes obs1008 obs1006)
   (delay-trip-wait obs1008 obs1001)
   (delay-trip-wait obs1008 obs1000)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-3 obs1009 Bus_X26 entered_zero_zone MW)
   (future obs1009)
   (precedes obs1009 obs1002)
   (precedes obs1009 obs1003)
   (precedes obs1009 obs1004)
   (precedes obs1009 obs1005)
   (precedes obs1009 obs1006)
   (delay-trip-wait obs1009 obs1001)
   (delay-trip-wait obs1009 obs1000)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-4 obs1010 Bus_X27 limit KV Low)
   (future obs1010)
   (precedes obs1010 obs1002)
   (precedes obs1010 obs1003)
   (precedes obs1010 obs1004)
   (precedes obs1010 obs1005)
   (precedes obs1010 obs1006)
   (delay-trip-wait obs1010 obs1001)
   (delay-trip-wait obs1010 obs1000)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-3 obs1011 Generator_X11_1 runback alarm)
   (future obs1011)
   (precedes obs1011 obs1002)
   (precedes obs1011 obs1003)
   (precedes obs1011 obs1004)
   (precedes obs1011 obs1005)
   (precedes obs1011 obs1006)
   (delay-trip-wait obs1011 obs1001)
   (delay-trip-wait obs1011 obs1000)

   ;; 1309730411 (2011-07-03 22:00:11):
   (matches-3 obs1012 Generator_X11_1 unit_status OFF)
   (future obs1012)
   (precedes obs1012 obs1002)
   (precedes obs1012 obs1003)
   (precedes obs1012 obs1004)
   (precedes obs1012 obs1005)
   (precedes obs1012 obs1006)
   (delay-trip-wait obs1012 obs1001)
   (delay-trip-wait obs1012 obs1000)

   ;; 1309730412 (2011-07-03 22:00:12):
   (matches-3 obs1013 Line_X15_X16 entered_zero_zone KV)
   (future obs1013)
   (precedes obs1013 obs1007)
   (precedes obs1013 obs1008)
   (precedes obs1013 obs1009)
   (precedes obs1013 obs1010)
   (precedes obs1013 obs1011)
   (precedes obs1013 obs1012)
   (delay-trip-wait obs1013 obs1002)
   (delay-trip-wait obs1013 obs1004)
   (delay-trip-wait obs1013 obs1006)
   (delay-trip-wait obs1013 obs1005)
   (delay-trip-wait obs1013 obs1003)

   ;; 1309730412 (2011-07-03 22:00:12):
   (matches-3 obs1014 Line_X13_X14 entered_zero_zone KV)
   (future obs1014)
   (precedes obs1014 obs1007)
   (precedes obs1014 obs1008)
   (precedes obs1014 obs1009)
   (precedes obs1014 obs1010)
   (precedes obs1014 obs1011)
   (precedes obs1014 obs1012)
   (delay-trip-wait obs1014 obs1002)
   (delay-trip-wait obs1014 obs1004)
   (delay-trip-wait obs1014 obs1006)
   (delay-trip-wait obs1014 obs1005)
   (delay-trip-wait obs1014 obs1003)

   ;; 1309730412 (2011-07-03 22:00:12):
   (matches-4 obs1015 Bus_X25 limit KV Normal)
   (future obs1015)
   (precedes obs1015 obs1007)
   (precedes obs1015 obs1008)
   (precedes obs1015 obs1009)
   (precedes obs1015 obs1010)
   (precedes obs1015 obs1011)
   (precedes obs1015 obs1012)
   (delay-trip-wait obs1015 obs1002)
   (delay-trip-wait obs1015 obs1004)
   (delay-trip-wait obs1015 obs1006)
   (delay-trip-wait obs1015 obs1005)
   (delay-trip-wait obs1015 obs1003)

   ;; 1309730412 (2011-07-03 22:00:12):
   (matches-3 obs1016 Line_X1_X2 entered_zero_zone KV)
   (future obs1016)
   (precedes obs1016 obs1007)
   (precedes obs1016 obs1008)
   (precedes obs1016 obs1009)
   (precedes obs1016 obs1010)
   (precedes obs1016 obs1011)
   (precedes obs1016 obs1012)
   (delay-trip-wait obs1016 obs1002)
   (delay-trip-wait obs1016 obs1004)
   (delay-trip-wait obs1016 obs1006)
   (delay-trip-wait obs1016 obs1005)
   (delay-trip-wait obs1016 obs1003)

   ;; 1309730412 (2011-07-03 22:00:12):
   (matches-3 obs1017 Breaker_X19_X20 cb_state open)
   (future obs1017)
   (precedes obs1017 obs1007)
   (precedes obs1017 obs1008)
   (precedes obs1017 obs1009)
   (precedes obs1017 obs1010)
   (precedes obs1017 obs1011)
   (precedes obs1017 obs1012)
   (delay-trip-wait obs1017 obs1002)
   (delay-trip-wait obs1017 obs1004)
   (delay-trip-wait obs1017 obs1006)
   (delay-trip-wait obs1017 obs1005)
   (delay-trip-wait obs1017 obs1003)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs998)
              (observed obs999)
              (observed obs1000)
              (observed obs1001)
              (observed obs1002)
              (observed obs1003)
              (observed obs1004)
              (observed obs1005)
              (observed obs1006)
              (observed obs1007)
              (observed obs1008)
              (observed obs1009)
              (observed obs1010)
              (observed obs1011)
              (observed obs1012)
              (observed obs1013)
              (observed obs1014)
              (observed obs1015)
              (observed obs1016)
              (observed obs1017)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.412 (cpu) 1.498 (real)
