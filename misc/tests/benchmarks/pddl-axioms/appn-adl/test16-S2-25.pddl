;; from 2011-07-02 00:00:00 to 2011-07-02 01:00:00: 20 observations (19 alarms), 33 components
(define (problem network)
  (:domain APPN)

  (:objects
   Line_X1_X2 - Line
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Line_X9_X10 - Line
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Line_X17_X18 - Line
   Breaker_X19_X20 - Breaker
   Bus_X21 - bus
   Bus_X22 - bus
   Bus_X23 - bus
   Bus_X15 - bus
   Bus_X24 - bus
   Bus_X25 - bus
   Generator_X13_1 - generator
   Generator_X15_1 - generator
   Generator_X26_1 - generator
   Line_X27_X28 - Line
   Breaker_X29_X30 - Breaker
   Breaker_X31_X32 - Breaker
   Bus_X1 - bus
   Bus_X9 - bus
   Bus_X17 - bus
   Bus_X27 - bus
   Bus_X2 - bus
   Bus_X10 - bus
   Bus_X18 - bus
   Bus_X28 - bus
   Breaker_X33_X26 - Breaker
   Bus_X13 - bus
   Bus_X26 - bus
   obs351 - observation
   obs352 - observation
   obs353 - observation
   obs354 - observation
   obs355 - observation
   obs356 - observation
   obs357 - observation
   obs358 - observation
   obs359 - observation
   obs360 - observation
   obs361 - observation
   obs362 - observation
   obs363 - observation
   obs364 - observation
   obs365 - observation
   obs366 - observation
   obs367 - observation
   obs368 - observation
   obs369 - observation
   obs370 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X27_X28 Breaker_X5_X6 Breaker_X29_X30 Breaker_X31_X32)
   (line-isolator Breaker_X5_X6 Line_X27_X28)
   (line-isolator Breaker_X29_X30 Line_X27_X28)
   (line-isolator Breaker_X31_X32 Line_X27_X28)
   (adjacent Line_X1_X2 Bus_X1)
   (adjacent Line_X1_X2 Bus_X2)
   (adjacent Line_X9_X10 Bus_X9)
   (adjacent Line_X9_X10 Bus_X10)
   (adjacent Line_X17_X18 Bus_X17)
   (adjacent Line_X17_X18 Bus_X18)
   (adjacent Line_X27_X28 Bus_X27)
   (adjacent Line_X27_X28 Bus_X28)
   (generator-attached-to Generator_X13_1 Bus_X13)
   (generator-attached-to Generator_X15_1 Bus_X15)
   (generator-attached-to Generator_X26_1 Bus_X26)
   (generator-isolator Breaker_X13_X14 Bus_X13)
   (generator-isolator Breaker_X15_X16 Bus_X15)
   (generator-isolator Breaker_X33_X26 Bus_X26)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X29_X30)
   (breaker-ar-status-is-unknown Breaker_X29_X30)
   (breaker-state-is-unknown Breaker_X31_X32)
   (breaker-ar-status-is-unknown Breaker_X31_X32)
   (breaker-state-is-unknown Breaker_X33_X26)
   (breaker-ar-status-is-unknown Breaker_X33_X26)
   (line-voltage-unknown Line_X1_X2)
   (line-voltage-unknown Line_X9_X10)
   (line-voltage-unknown Line_X17_X18)
   (line-voltage-unknown Line_X27_X28)
   (bus-voltage-unknown Bus_X1)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X27)
   (bus-voltage-unknown Bus_X18)
   (bus-voltage-unknown Bus_X10)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X9)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X17)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X25)
   (generator-status-is-unknown Generator_X13_1)
   (generator-status-is-unknown Generator_X15_1)
   (generator-status-is-unknown Generator_X26_1)

   ;; 1309564800 (2011-07-02 00:00:00):
   (matches-4 obs351 command Breaker_X3_X4 cb_state closed)
   (pending obs351)

   ;; 1309564828 (2011-07-02 00:00:28):
   (matches-3 obs352 Breaker_X3_X4 cb_state closed)
   (future obs352)
   (precedes obs352 obs351)
   (delay-short-time obs352 obs351)
   (delay-trip-wait obs352 obs351)

   ;; 1309564845 (2011-07-02 00:00:45):
   (matches-4 obs353 Bus_X21 limit KV Low)
   (future obs353)
   (precedes obs353 obs352)
   (delay-short-time obs353 obs352)
   (delay-trip-wait obs353 obs352)

   ;; 1309564845 (2011-07-02 00:00:45):
   (matches-3 obs354 Line_X17_X18 entered_zero_zone KV)
   (future obs354)
   (precedes obs354 obs352)
   (delay-short-time obs354 obs352)
   (delay-trip-wait obs354 obs352)

   ;; 1309564846 (2011-07-02 00:00:46):
   (matches-3 obs355 Breaker_X19_X20 cb_state open)
   (future obs355)
   (precedes obs355 obs353)
   (precedes obs355 obs354)

   ;; 1309564846 (2011-07-02 00:00:46):
   (matches-3 obs356 Generator_X13_1 unit_status OFF)
   (future obs356)
   (precedes obs356 obs353)
   (precedes obs356 obs354)

   ;; 1309564847 (2011-07-02 00:00:47):
   (matches-3 obs357 Bus_X15 entered_zero_zone MW)
   (future obs357)
   (precedes obs357 obs355)
   (precedes obs357 obs356)
   (delay-trip-wait obs357 obs353)
   (delay-trip-wait obs357 obs354)

   ;; 1309564847 (2011-07-02 00:00:47):
   (matches-3 obs358 Breaker_X15_X16 cb_state open)
   (future obs358)
   (precedes obs358 obs355)
   (precedes obs358 obs356)
   (delay-trip-wait obs358 obs353)
   (delay-trip-wait obs358 obs354)

   ;; 1309564847 (2011-07-02 00:00:47):
   (matches-3 obs359 Breaker_X5_X6 cb_state open)
   (future obs359)
   (precedes obs359 obs355)
   (precedes obs359 obs356)
   (delay-trip-wait obs359 obs353)
   (delay-trip-wait obs359 obs354)

   ;; 1309564849 (2011-07-02 00:00:49):
   (matches-3 obs360 Breaker_X7_X8 cb_state open)
   (future obs360)
   (precedes obs360 obs357)
   (precedes obs360 obs358)
   (precedes obs360 obs359)
   (delay-trip-wait obs360 obs359)
   (delay-trip-wait obs360 obs358)
   (delay-trip-wait obs360 obs356)
   (delay-trip-wait obs360 obs357)
   (delay-trip-wait obs360 obs355)

   ;; 1309564850 (2011-07-02 00:00:50):
   (matches-4 obs361 Bus_X22 limit KV High)
   (future obs361)
   (precedes obs361 obs360)

   ;; 1309564853 (2011-07-02 00:00:53):
   (matches-3 obs362 Breaker_X13_X14 cb_state open)
   (future obs362)
   (precedes obs362 obs361)
   (delay-trip-wait obs362 obs361)
   (delay-trip-wait obs362 obs360)

   ;; 1309564856 (2011-07-02 00:00:56):
   (matches-4 obs363 Bus_X24 limit KV Normal)
   (future obs363)
   (precedes obs363 obs362)
   (delay-trip-wait obs363 obs362)

   ;; 1309564857 (2011-07-02 00:00:57):
   (matches-4 obs364 Bus_X25 limit KV Normal)
   (future obs364)
   (precedes obs364 obs363)

   ;; 1309564863 (2011-07-02 00:01:03):
   (matches-3 obs365 Breaker_X11_X12 cb_state closed)
   (future obs365)
   (precedes obs365 obs364)
   (delay-short-time obs365 obs359)
   (delay-short-time obs365 obs358)
   (delay-short-time obs365 obs356)
   (delay-trip-wait obs365 obs363)
   (delay-short-time obs365 obs353)
   (delay-short-time obs365 obs354)
   (delay-short-time obs365 obs357)
   (delay-trip-wait obs365 obs364)
   (delay-short-time obs365 obs355)

   ;; 1309564874 (2011-07-02 00:01:14):
   (matches-4 obs366 Line_X9_X10 limit MW Normal)
   (future obs366)
   (precedes obs366 obs365)
   (delay-trip-wait obs366 obs365)
   (delay-short-time obs366 obs361)
   (delay-short-time obs366 obs363)
   (delay-short-time obs366 obs362)
   (delay-short-time obs366 obs360)
   (delay-rc-wait obs366 obs352)
   (delay-short-time obs366 obs364)

   ;; 1309564874 (2011-07-02 00:01:14):
   (matches-4 obs367 Bus_X23 limit MW Normal)
   (future obs367)
   (precedes obs367 obs365)
   (delay-trip-wait obs367 obs365)
   (delay-short-time obs367 obs361)
   (delay-short-time obs367 obs363)
   (delay-short-time obs367 obs362)
   (delay-short-time obs367 obs360)
   (delay-short-time obs367 obs364)

   ;; 1309564883 (2011-07-02 00:01:23):
   (matches-3 obs368 Generator_X15_1 runback reset)
   (future obs368)
   (precedes obs368 obs366)
   (precedes obs368 obs367)
   (delay-short-time obs368 obs365)
   (delay-trip-wait obs368 obs367)
   (delay-trip-wait obs368 obs366)

   ;; 1309564884 (2011-07-02 00:01:24):
   (matches-3 obs369 Generator_X26_1 runback reset)
   (future obs369)
   (precedes obs369 obs368)

   ;; 1309564887 (2011-07-02 00:01:27):
   (matches-3 obs370 Line_X1_X2 entered_zero_zone KV)
   (future obs370)
   (precedes obs370 obs369)
   (delay-trip-wait obs370 obs369)
   (delay-trip-wait obs370 obs368)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs351)
              (observed obs352)
              (observed obs353)
              (observed obs354)
              (observed obs355)
              (observed obs356)
              (observed obs357)
              (observed obs358)
              (observed obs359)
              (observed obs360)
              (observed obs361)
              (observed obs362)
              (observed obs363)
              (observed obs364)
              (observed obs365)
              (observed obs366)
              (observed obs367)
              (observed obs368)
              (observed obs369)
              (observed obs370)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.396 (cpu) 1.523 (real)
