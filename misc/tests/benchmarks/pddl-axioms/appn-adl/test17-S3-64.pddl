;; from 2011-07-03 15:00:00 to 2011-07-03 16:00:00: 20 observations (14 alarms), 35 components
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
   Line_X15_X16 - Line
   Breaker_X17_X18 - Breaker
   Line_X19_X20 - Line
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Bus_X27 - bus
   Line_X28_X29 - Line
   Line_X30_X31 - Line
   Line_X32_X33 - Line
   Breaker_X34_X35 - Breaker
   Breaker_X36_X37 - Breaker
   Breaker_X38_X39 - Breaker
   Breaker_X40_X41 - Breaker
   Breaker_X42_X43 - Breaker
   Breaker_X44_X45 - Breaker
   Breaker_X46_X47 - Breaker
   Breaker_X48_X49 - Breaker
   Bus_X15 - bus
   Bus_X19 - bus
   Bus_X28 - bus
   Bus_X30 - bus
   Bus_X32 - bus
   Bus_X16 - bus
   Bus_X20 - bus
   Bus_X29 - bus
   Bus_X31 - bus
   Bus_X33 - bus
   obs1190 - observation
   obs1191 - observation
   obs1192 - observation
   obs1193 - observation
   obs1194 - observation
   obs1195 - observation
   obs1196 - observation
   obs1197 - observation
   obs1198 - observation
   obs1199 - observation
   obs1200 - observation
   obs1201 - observation
   obs1202 - observation
   obs1203 - observation
   obs1204 - observation
   obs1205 - observation
   obs1206 - observation
   obs1207 - observation
   obs1208 - observation
   obs1209 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X19_X20 Breaker_X23_X24 Breaker_X21_X22 Breaker_X9_X10)
   (line-isolator Breaker_X23_X24 Line_X19_X20)
   (line-isolator Breaker_X21_X22 Line_X19_X20)
   (line-isolator Breaker_X9_X10 Line_X19_X20)
   (line-isolators-4 Line_X28_X29 Breaker_X34_X35 Breaker_X38_X39 Breaker_X44_X45 Breaker_X3_X4)
   (line-isolator Breaker_X34_X35 Line_X28_X29)
   (line-isolator Breaker_X38_X39 Line_X28_X29)
   (line-isolator Breaker_X44_X45 Line_X28_X29)
   (line-isolator Breaker_X3_X4 Line_X28_X29)
   (line-isolators-4 Line_X30_X31 Breaker_X36_X37 Breaker_X40_X41 Breaker_X46_X47 Breaker_X1_X2)
   (line-isolator Breaker_X36_X37 Line_X30_X31)
   (line-isolator Breaker_X40_X41 Line_X30_X31)
   (line-isolator Breaker_X46_X47 Line_X30_X31)
   (line-isolator Breaker_X1_X2 Line_X30_X31)
   (line-isolators-4 Line_X32_X33 Breaker_X17_X18 Breaker_X42_X43 Breaker_X48_X49 Breaker_X5_X6)
   (line-isolator Breaker_X17_X18 Line_X32_X33)
   (line-isolator Breaker_X42_X43 Line_X32_X33)
   (line-isolator Breaker_X48_X49 Line_X32_X33)
   (line-isolator Breaker_X5_X6 Line_X32_X33)
   (adjacent Line_X15_X16 Bus_X15)
   (adjacent Line_X15_X16 Bus_X16)
   (adjacent Line_X19_X20 Bus_X19)
   (adjacent Line_X19_X20 Bus_X20)
   (adjacent Line_X28_X29 Bus_X28)
   (adjacent Line_X28_X29 Bus_X29)
   (adjacent Line_X30_X31 Bus_X30)
   (adjacent Line_X30_X31 Bus_X31)
   (adjacent Line_X32_X33 Bus_X32)
   (adjacent Line_X32_X33 Bus_X33)
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
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
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
   (line-voltage-unknown Line_X15_X16)
   (line-voltage-unknown Line_X19_X20)
   (line-voltage-unknown Line_X28_X29)
   (line-voltage-unknown Line_X30_X31)
   (line-voltage-unknown Line_X32_X33)
   (bus-voltage-unknown Bus_X30)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X31)
   (bus-voltage-unknown Bus_X29)
   (bus-voltage-unknown Bus_X33)
   (bus-voltage-unknown Bus_X20)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X32)
   (bus-voltage-unknown Bus_X27)
   (bus-voltage-unknown Bus_X19)

   ;; 1309705200 (2011-07-03 15:00:00):
   (matches-4 obs1190 command Breaker_X23_X24 cb_state closed)
   (pending obs1190)

   ;; 1309705203 (2011-07-03 15:00:03):
   (matches-3 obs1191 Breaker_X23_X24 cb_state closed)
   (future obs1191)
   (precedes obs1191 obs1190)
   (delay-trip-wait obs1191 obs1190)

   ;; 1309705204 (2011-07-03 15:00:04):
   (matches-4 obs1192 command Breaker_X25_X26 cb_state closed)
   (future obs1192)
   (precedes obs1192 obs1191)

   ;; 1309705209 (2011-07-03 15:00:09):
   (matches-4 obs1193 command Breaker_X9_X10 cb_state closed)
   (future obs1193)
   (precedes obs1193 obs1192)
   (delay-trip-wait obs1193 obs1192)
   (delay-trip-wait obs1193 obs1191)

   ;; 1309705213 (2011-07-03 15:00:13):
   (matches-4 obs1194 command Breaker_X11_X12 cb_state closed)
   (future obs1194)
   (precedes obs1194 obs1193)
   (delay-trip-wait obs1194 obs1193)

   ;; 1309705216 (2011-07-03 15:00:16):
   (matches-3 obs1195 Breaker_X25_X26 cb_state closed)
   (future obs1195)
   (precedes obs1195 obs1194)
   (delay-trip-wait obs1195 obs1194)
   (delay-short-time obs1195 obs1190)

   ;; 1309705222 (2011-07-03 15:00:22):
   (matches-3 obs1196 Breaker_X21_X22 cb_state closed)
   (future obs1196)
   (precedes obs1196 obs1195)
   (delay-short-time obs1196 obs1192)
   (delay-short-time obs1196 obs1191)
   (delay-trip-wait obs1196 obs1195)

   ;; 1309705231 (2011-07-03 15:00:31):
   (matches-3 obs1197 Breaker_X11_X12 cb_state closed)
   (future obs1197)
   (precedes obs1197 obs1196)
   (delay-short-time obs1197 obs1194)
   (delay-short-time obs1197 obs1193)
   (delay-trip-wait obs1197 obs1196)

   ;; 1309705240 (2011-07-03 15:00:40):
   (matches-3 obs1198 Breaker_X13_X14 cb_state closed)
   (future obs1198)
   (precedes obs1198 obs1197)
   (delay-short-time obs1198 obs1195)
   (delay-trip-wait obs1198 obs1197)
   (delay-short-time obs1198 obs1196)

   ;; 1309705248 (2011-07-03 15:00:48):
   (matches-3 obs1199 Breaker_X7_X8 cb_state closed)
   (future obs1199)
   (precedes obs1199 obs1198)
   (delay-rc-wait obs1199 obs1190)
   (delay-trip-wait obs1199 obs1198)
   (delay-short-time obs1199 obs1197)

   ;; 1309705266 (2011-07-03 15:01:06):
   (matches-3 obs1200 Breaker_X9_X10 cb_state closed)
   (future obs1200)
   (precedes obs1200 obs1199)
   (delay-rc-wait obs1200 obs1194)
   (delay-short-time obs1200 obs1198)
   (delay-rc-wait obs1200 obs1195)
   (delay-rc-wait obs1200 obs1192)
   (delay-short-time obs1200 obs1199)
   (delay-trip-wait obs1200 obs1199)
   (delay-rc-wait obs1200 obs1193)

   ;; 1309705271 (2011-07-03 15:01:11):
   (matches-4 obs1201 Bus_X27 limit KV Normal)
   (future obs1201)
   (precedes obs1201 obs1200)
   (delay-trip-wait obs1201 obs1200)
   (delay-rc-wait obs1201 obs1196)

   ;; 1309705299 (2011-07-03 15:01:39):
   (matches-4 obs1202 Line_X15_X16 limit MW Normal)
   (future obs1202)
   (precedes obs1202 obs1201)
   (delay-short-time obs1202 obs1200)
   (delay-rc-wait obs1202 obs1198)
   (delay-short-time obs1202 obs1201)
   (delay-trip-wait obs1202 obs1201)
   (delay-rc-wait obs1202 obs1197)
   (delay-rc-wait obs1202 obs1199)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1203 Breaker_X23_X24 cb_state open)
   (future obs1203)
   (precedes obs1203 obs1202)
   (delay-trip-wait obs1203 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1204 Breaker_X9_X10 cb_state open)
   (future obs1204)
   (precedes obs1204 obs1202)
   (delay-trip-wait obs1204 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1205 Breaker_X17_X18 cb_state open)
   (future obs1205)
   (precedes obs1205 obs1202)
   (delay-trip-wait obs1205 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1206 Breaker_X1_X2 cb_state open)
   (future obs1206)
   (precedes obs1206 obs1202)
   (delay-trip-wait obs1206 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-4 obs1207 Line_X19_X20 limit KV Low)
   (future obs1207)
   (precedes obs1207 obs1202)
   (delay-trip-wait obs1207 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1208 Breaker_X5_X6 cb_state open)
   (future obs1208)
   (precedes obs1208 obs1202)
   (delay-trip-wait obs1208 obs1202)

   ;; 1309705310 (2011-07-03 15:01:50):
   (matches-3 obs1209 Breaker_X3_X4 cb_state open)
   (future obs1209)
   (precedes obs1209 obs1202)
   (delay-trip-wait obs1209 obs1202)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1190)
              (observed obs1191)
              (observed obs1192)
              (observed obs1193)
              (observed obs1194)
              (observed obs1195)
              (observed obs1196)
              (observed obs1197)
              (observed obs1198)
              (observed obs1199)
              (observed obs1200)
              (observed obs1201)
              (observed obs1202)
              (observed obs1203)
              (observed obs1204)
              (observed obs1205)
              (observed obs1206)
              (observed obs1207)
              (observed obs1208)
              (observed obs1209)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.440 (cpu) 1.525 (real)
