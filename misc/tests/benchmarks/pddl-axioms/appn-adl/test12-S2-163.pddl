;; from 2011-07-07 18:00:00 to 2011-07-07 19:00:00: 14 observations (6 alarms), 28 components
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
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Line_X21_X22 - Line
   Line_X23_X24 - Line
   Line_X25_X26 - Line
   Line_X27_X28 - Line
   Breaker_X29_X30 - Breaker
   Breaker_X31_X32 - Breaker
   Breaker_X33_X34 - Breaker
   Breaker_X35_X36 - Breaker
   Breaker_X37_X38 - Breaker
   Breaker_X39_X40 - Breaker
   Bus_X21 - bus
   Bus_X23 - bus
   Bus_X25 - bus
   Bus_X27 - bus
   Bus_X22 - bus
   Bus_X24 - bus
   Bus_X26 - bus
   Bus_X28 - bus
   obs2310 - observation
   obs2311 - observation
   obs2312 - observation
   obs2313 - observation
   obs2314 - observation
   obs2315 - observation
   obs2316 - observation
   obs2317 - observation
   obs2318 - observation
   obs2319 - observation
   obs2320 - observation
   obs2321 - observation
   obs2322 - observation
   obs2323 - observation
   )

  (:init
   (static-true)
   (line-isolators-4 Line_X21_X22 Breaker_X29_X30 Breaker_X3_X4 Breaker_X13_X14 Breaker_X7_X8)
   (line-isolator Breaker_X29_X30 Line_X21_X22)
   (line-isolator Breaker_X3_X4 Line_X21_X22)
   (line-isolator Breaker_X13_X14 Line_X21_X22)
   (line-isolator Breaker_X7_X8 Line_X21_X22)
   (line-isolators-4 Line_X23_X24 Breaker_X1_X2 Breaker_X31_X32 Breaker_X35_X36 Breaker_X5_X6)
   (line-isolator Breaker_X1_X2 Line_X23_X24)
   (line-isolator Breaker_X31_X32 Line_X23_X24)
   (line-isolator Breaker_X35_X36 Line_X23_X24)
   (line-isolator Breaker_X5_X6 Line_X23_X24)
   (line-isolators-4 Line_X25_X26 Breaker_X11_X12 Breaker_X15_X16 Breaker_X37_X38 Breaker_X39_X40)
   (line-isolator Breaker_X11_X12 Line_X25_X26)
   (line-isolator Breaker_X15_X16 Line_X25_X26)
   (line-isolator Breaker_X37_X38 Line_X25_X26)
   (line-isolator Breaker_X39_X40 Line_X25_X26)
   (line-isolators-4 Line_X27_X28 Breaker_X19_X20 Breaker_X33_X34 Breaker_X9_X10 Breaker_X17_X18)
   (line-isolator Breaker_X19_X20 Line_X27_X28)
   (line-isolator Breaker_X33_X34 Line_X27_X28)
   (line-isolator Breaker_X9_X10 Line_X27_X28)
   (line-isolator Breaker_X17_X18 Line_X27_X28)
   (adjacent Line_X21_X22 Bus_X21)
   (adjacent Line_X21_X22 Bus_X22)
   (adjacent Line_X23_X24 Bus_X23)
   (adjacent Line_X23_X24 Bus_X24)
   (adjacent Line_X25_X26 Bus_X25)
   (adjacent Line_X25_X26 Bus_X26)
   (adjacent Line_X27_X28 Bus_X27)
   (adjacent Line_X27_X28 Bus_X28)
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
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X29_X30)
   (breaker-ar-status-is-unknown Breaker_X29_X30)
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
   (line-voltage-unknown Line_X21_X22)
   (line-voltage-unknown Line_X23_X24)
   (line-voltage-unknown Line_X25_X26)
   (line-voltage-unknown Line_X27_X28)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X27)

   ;; 1310061600 (2011-07-07 18:00:00):
   (matches-4 obs2310 command Breaker_X11_X12 cb_state closed)
   (pending obs2310)

   ;; 1310061606 (2011-07-07 18:00:06):
   (matches-4 obs2311 command Breaker_X15_X16 cb_state closed)
   (future obs2311)
   (precedes obs2311 obs2310)
   (delay-trip-wait obs2311 obs2310)

   ;; 1310061615 (2011-07-07 18:00:15):
   (matches-4 obs2312 command Breaker_X5_X6 cb_state closed)
   (future obs2312)
   (precedes obs2312 obs2311)
   (delay-trip-wait obs2312 obs2311)

   ;; 1310061615 (2011-07-07 18:00:15):
   (matches-4 obs2313 command Breaker_X7_X8 cb_state closed)
   (future obs2313)
   (precedes obs2313 obs2311)
   (delay-trip-wait obs2313 obs2311)

   ;; 1310061615 (2011-07-07 18:00:15):
   (matches-4 obs2314 command Breaker_X3_X4 cb_state closed)
   (future obs2314)
   (precedes obs2314 obs2311)
   (delay-trip-wait obs2314 obs2311)

   ;; 1310061617 (2011-07-07 18:00:17):
   (matches-3 obs2315 Breaker_X7_X8 cb_state closed)
   (future obs2315)
   (precedes obs2315 obs2312)
   (precedes obs2315 obs2313)
   (precedes obs2315 obs2314)
   (delay-trip-wait obs2315 obs2314)
   (delay-trip-wait obs2315 obs2313)
   (delay-trip-wait obs2315 obs2312)
   (delay-short-time obs2315 obs2310)

   ;; 1310061621 (2011-07-07 18:00:21):
   (matches-3 obs2316 Breaker_X15_X16 cb_state closed)
   (future obs2316)
   (precedes obs2316 obs2315)
   (delay-trip-wait obs2316 obs2315)

   ;; 1310061628 (2011-07-07 18:00:28):
   (matches-3 obs2317 Breaker_X11_X12 cb_state closed)
   (future obs2317)
   (precedes obs2317 obs2316)
   (delay-trip-wait obs2317 obs2316)
   (delay-short-time obs2317 obs2311)

   ;; 1310061645 (2011-07-07 18:00:45):
   (matches-4 obs2318 command Breaker_X13_X14 cb_state closed)
   (future obs2318)
   (precedes obs2318 obs2317)
   (delay-short-time obs2318 obs2314)
   (delay-short-time obs2318 obs2313)
   (delay-short-time obs2318 obs2316)
   (delay-short-time obs2318 obs2315)
   (delay-short-time obs2318 obs2312)
   (delay-short-time obs2318 obs2317)
   (delay-trip-wait obs2318 obs2317)

   ;; 1310061652 (2011-07-07 18:00:52):
   (matches-3 obs2319 Breaker_X17_X18 cb_state closed)
   (future obs2319)
   (precedes obs2319 obs2318)
   (delay-trip-wait obs2319 obs2318)
   (delay-rc-wait obs2319 obs2311)

   ;; 1310061671 (2011-07-07 18:01:11):
   (matches-3 obs2320 Breaker_X9_X10 cb_state closed)
   (future obs2320)
   (precedes obs2320 obs2319)
   (delay-short-time obs2320 obs2318)
   (delay-rc-wait obs2320 obs2314)
   (delay-rc-wait obs2320 obs2315)
   (delay-rc-wait obs2320 obs2313)
   (delay-rc-wait obs2320 obs2316)
   (delay-rc-wait obs2320 obs2312)
   (delay-short-time obs2320 obs2319)
   (delay-trip-wait obs2320 obs2319)

   ;; 1310061674 (2011-07-07 18:01:14):
   (matches-3 obs2321 Breaker_X3_X4 cb_state closed)
   (future obs2321)
   (precedes obs2321 obs2320)
   (delay-trip-wait obs2321 obs2320)
   (delay-rc-wait obs2321 obs2317)

   ;; 1310061677 (2011-07-07 18:01:17):
   (matches-4 obs2322 command Breaker_X19_X20 cb_state closed)
   (future obs2322)
   (precedes obs2322 obs2321)
   (delay-trip-wait obs2322 obs2321)

   ;; 1310061680 (2011-07-07 18:01:20):
   (matches-3 obs2323 Breaker_X1_X2 cb_state closed)
   (future obs2323)
   (precedes obs2323 obs2322)
   (delay-trip-wait obs2323 obs2322)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs2310)
              (observed obs2311)
              (observed obs2312)
              (observed obs2313)
              (observed obs2314)
              (observed obs2315)
              (observed obs2316)
              (observed obs2317)
              (observed obs2318)
              (observed obs2319)
              (observed obs2320)
              (observed obs2321)
              (observed obs2322)
              (observed obs2323)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.376 (cpu) 1.427 (real)
