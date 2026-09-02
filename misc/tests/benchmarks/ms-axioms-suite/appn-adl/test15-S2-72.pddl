;; from 2011-07-03 23:00:00 to 2011-07-04 00:00:00: 20 observations (20 alarms), 31 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Bus_X17 - bus
   Bus_X2 - bus
   Bus_X18 - bus
   Generator_X19_1 - generator
   Generator_X17_1 - generator
   Generator_X20_1 - generator
   Generator_X2_1 - generator
   Generator_X4_1 - generator
   Generator_X21_1 - generator
   Line_X22_X23 - Line
   Breaker_X24_X25 - Breaker
   Breaker_X26_X27 - Breaker
   Breaker_X28_X29 - Breaker
   Bus_X22 - bus
   Bus_X23 - bus
   Breaker_X30_X19 - Breaker
   Breaker_X31_X17 - Breaker
   Breaker_X32_X20 - Breaker
   Breaker_X33_X21 - Breaker
   Bus_X19 - bus
   Bus_X20 - bus
   Bus_X4 - bus
   Bus_X21 - bus
   obs1018 - observation
   obs1019 - observation
   obs1020 - observation
   obs1021 - observation
   obs1022 - observation
   obs1023 - observation
   obs1024 - observation
   obs1025 - observation
   obs1026 - observation
   obs1027 - observation
   obs1028 - observation
   obs1029 - observation
   obs1030 - observation
   obs1031 - observation
   obs1032 - observation
   obs1033 - observation
   obs1034 - observation
   obs1035 - observation
   obs1036 - observation
   obs1037 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X22_X23 Breaker_X24_X25 Breaker_X26_X27 Breaker_X28_X29 Breaker_X9_X10)
   (line-isolator Breaker_X24_X25 Line_X22_X23)
   (line-isolator Breaker_X26_X27 Line_X22_X23)
   (line-isolator Breaker_X28_X29 Line_X22_X23)
   (line-isolator Breaker_X9_X10 Line_X22_X23)
   (adjacent Line_X22_X23 Bus_X22)
   (adjacent Line_X22_X23 Bus_X23)
   (generator-attached-to Generator_X19_1 Bus_X19)
   (generator-attached-to Generator_X17_1 Bus_X17)
   (generator-attached-to Generator_X20_1 Bus_X20)
   (generator-attached-to Generator_X2_1 Bus_X2)
   (generator-attached-to Generator_X4_1 Bus_X4)
   (generator-attached-to Generator_X21_1 Bus_X21)
   (generator-isolator Breaker_X30_X19 Bus_X19)
   (generator-isolator Breaker_X31_X17 Bus_X17)
   (generator-isolator Breaker_X32_X20 Bus_X20)
   (generator-isolator Breaker_X1_X2 Bus_X2)
   (generator-isolator Breaker_X3_X4 Bus_X4)
   (generator-isolator Breaker_X33_X21 Bus_X21)
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
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X24_X25)
   (breaker-ar-status-is-unknown Breaker_X24_X25)
   (breaker-state-is-unknown Breaker_X26_X27)
   (breaker-ar-status-is-unknown Breaker_X26_X27)
   (breaker-state-is-unknown Breaker_X28_X29)
   (breaker-ar-status-is-unknown Breaker_X28_X29)
   (breaker-state-is-unknown Breaker_X30_X19)
   (breaker-ar-status-is-unknown Breaker_X30_X19)
   (breaker-state-is-unknown Breaker_X31_X17)
   (breaker-ar-status-is-unknown Breaker_X31_X17)
   (breaker-state-is-unknown Breaker_X32_X20)
   (breaker-ar-status-is-unknown Breaker_X32_X20)
   (breaker-state-is-unknown Breaker_X33_X21)
   (breaker-ar-status-is-unknown Breaker_X33_X21)
   (line-voltage-unknown Line_X22_X23)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X19)
   (bus-voltage-unknown Bus_X17)
   (bus-voltage-unknown Bus_X20)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X4)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X18)
   (generator-status-is-unknown Generator_X19_1)
   (generator-status-is-unknown Generator_X17_1)
   (generator-status-is-unknown Generator_X20_1)
   (generator-status-is-unknown Generator_X2_1)
   (generator-status-is-unknown Generator_X4_1)
   (generator-status-is-unknown Generator_X21_1)

   ;; 1309734000 (2011-07-03 23:00:00):
   (matches-3 obs1018 Generator_X2_1 unit_status OFF)
   (pending obs1018)

   ;; 1309734001 (2011-07-03 23:00:01):
   (matches-3 obs1019 Generator_X21_1 runback alarm)
   (future obs1019)
   (precedes obs1019 obs1018)

   ;; 1309734001 (2011-07-03 23:00:01):
   (matches-4 obs1020 Bus_X18 limit KV High)
   (future obs1020)
   (precedes obs1020 obs1018)

   ;; 1309734002 (2011-07-03 23:00:02):
   (matches-3 obs1021 Generator_X4_1 runback alarm)
   (future obs1021)
   (precedes obs1021 obs1019)
   (precedes obs1021 obs1020)
   (delay-trip-wait obs1021 obs1018)

   ;; 1309734002 (2011-07-03 23:00:02):
   (matches-3 obs1022 Breaker_X1_X2 cb_state open)
   (future obs1022)
   (precedes obs1022 obs1019)
   (precedes obs1022 obs1020)
   (delay-trip-wait obs1022 obs1018)

   ;; 1309734002 (2011-07-03 23:00:02):
   (matches-3 obs1023 Breaker_X9_X10 cb_state open)
   (future obs1023)
   (precedes obs1023 obs1019)
   (precedes obs1023 obs1020)
   (delay-trip-wait obs1023 obs1018)

   ;; 1309734002 (2011-07-03 23:00:02):
   (matches-3 obs1024 Generator_X19_1 runback alarm)
   (future obs1024)
   (precedes obs1024 obs1019)
   (precedes obs1024 obs1020)
   (delay-trip-wait obs1024 obs1018)

   ;; 1309734003 (2011-07-03 23:00:03):
   (matches-3 obs1025 Breaker_X5_X6 cb_state open)
   (future obs1025)
   (precedes obs1025 obs1021)
   (precedes obs1025 obs1022)
   (precedes obs1025 obs1023)
   (precedes obs1025 obs1024)
   (delay-trip-wait obs1025 obs1020)
   (delay-trip-wait obs1025 obs1019)

   ;; 1309734004 (2011-07-03 23:00:04):
   (matches-3 obs1026 Generator_X20_1 runback reset)
   (future obs1026)
   (precedes obs1026 obs1025)
   (delay-trip-wait obs1026 obs1024)
   (delay-trip-wait obs1026 obs1023)
   (delay-trip-wait obs1026 obs1022)
   (delay-trip-wait obs1026 obs1021)

   ;; 1309734004 (2011-07-03 23:00:04):
   (matches-3 obs1027 Generator_X17_1 runback alarm)
   (future obs1027)
   (precedes obs1027 obs1025)
   (delay-trip-wait obs1027 obs1024)
   (delay-trip-wait obs1027 obs1023)
   (delay-trip-wait obs1027 obs1022)
   (delay-trip-wait obs1027 obs1021)

   ;; 1309734005 (2011-07-03 23:00:05):
   (matches-3 obs1028 Generator_X17_1 unit_status OFF)
   (future obs1028)
   (precedes obs1028 obs1026)
   (precedes obs1028 obs1027)
   (delay-trip-wait obs1028 obs1025)

   ;; 1309734005 (2011-07-03 23:00:05):
   (matches-3 obs1029 Breaker_X7_X8 cb_state open)
   (future obs1029)
   (precedes obs1029 obs1026)
   (precedes obs1029 obs1027)
   (delay-trip-wait obs1029 obs1025)

   ;; 1309734005 (2011-07-03 23:00:05):
   (matches-3 obs1030 Bus_X17 entered_zero_zone MW)
   (future obs1030)
   (precedes obs1030 obs1026)
   (precedes obs1030 obs1027)
   (delay-trip-wait obs1030 obs1025)

   ;; 1309734006 (2011-07-03 23:00:06):
   (matches-3 obs1031 Breaker_X11_X12 cb_state open)
   (future obs1031)
   (precedes obs1031 obs1028)
   (precedes obs1031 obs1029)
   (precedes obs1031 obs1030)
   (delay-trip-wait obs1031 obs1027)
   (delay-trip-wait obs1031 obs1026)

   ;; 1309734007 (2011-07-03 23:00:07):
   (matches-3 obs1032 Breaker_X13_X14 cb_state closed)
   (future obs1032)
   (precedes obs1032 obs1031)
   (delay-trip-wait obs1032 obs1030)
   (delay-trip-wait obs1032 obs1028)
   (delay-trip-wait obs1032 obs1029)

   ;; 1309734007 (2011-07-03 23:00:07):
   (matches-3 obs1033 Breaker_X3_X4 cb_state open)
   (future obs1033)
   (precedes obs1033 obs1031)
   (delay-trip-wait obs1033 obs1030)
   (delay-trip-wait obs1033 obs1028)
   (delay-trip-wait obs1033 obs1029)

   ;; 1309734008 (2011-07-03 23:00:08):
   (matches-3 obs1034 Generator_X21_1 unit_status OFF)
   (future obs1034)
   (precedes obs1034 obs1032)
   (precedes obs1034 obs1033)
   (delay-trip-wait obs1034 obs1031)

   ;; 1309734008 (2011-07-03 23:00:08):
   (matches-3 obs1035 Generator_X4_1 unit_status OFF)
   (future obs1035)
   (precedes obs1035 obs1032)
   (precedes obs1035 obs1033)
   (delay-trip-wait obs1035 obs1031)

   ;; 1309734008 (2011-07-03 23:00:08):
   (matches-3 obs1036 Bus_X2 entered_zero_zone MW)
   (future obs1036)
   (precedes obs1036 obs1032)
   (precedes obs1036 obs1033)
   (delay-trip-wait obs1036 obs1031)

   ;; 1309734009 (2011-07-03 23:00:09):
   (matches-3 obs1037 Breaker_X15_X16 cb_state open)
   (future obs1037)
   (precedes obs1037 obs1034)
   (precedes obs1037 obs1035)
   (precedes obs1037 obs1036)
   (delay-trip-wait obs1037 obs1032)
   (delay-trip-wait obs1037 obs1033)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1018)
              (observed obs1019)
              (observed obs1020)
              (observed obs1021)
              (observed obs1022)
              (observed obs1023)
              (observed obs1024)
              (observed obs1025)
              (observed obs1026)
              (observed obs1027)
              (observed obs1028)
              (observed obs1029)
              (observed obs1030)
              (observed obs1031)
              (observed obs1032)
              (observed obs1033)
              (observed obs1034)
              (observed obs1035)
              (observed obs1036)
              (observed obs1037)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.440 (cpu) 1.488 (real)
