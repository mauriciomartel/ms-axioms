;; from 2011-07-02 15:00:00 to 2011-07-02 16:00:00: 20 observations (14 alarms), 19 components
(define (problem network)
  (:domain APPN)

  (:objects
   Line_X1_X2 - Line
   Line_X3_X4 - Line
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Bus_X21 - bus
   Bus_X22 - bus
   Breaker_X23_X24 - Breaker
   Bus_X1 - bus
   Bus_X3 - bus
   Bus_X7 - bus
   Bus_X2 - bus
   Bus_X4 - bus
   Bus_X8 - bus
   obs548 - observation
   obs549 - observation
   obs550 - observation
   obs551 - observation
   obs552 - observation
   obs553 - observation
   obs554 - observation
   obs555 - observation
   obs556 - observation
   obs557 - observation
   obs558 - observation
   obs559 - observation
   obs560 - observation
   obs561 - observation
   obs562 - observation
   obs563 - observation
   obs564 - observation
   obs565 - observation
   obs566 - observation
   obs567 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X1_X2 Breaker_X23_X24 Breaker_X15_X16 Breaker_X9_X10)
   (line-isolator Breaker_X23_X24 Line_X1_X2)
   (line-isolator Breaker_X15_X16 Line_X1_X2)
   (line-isolator Breaker_X9_X10 Line_X1_X2)
   (line-isolators-3 Line_X3_X4 Breaker_X5_X6 Breaker_X17_X18 Breaker_X11_X12)
   (line-isolator Breaker_X5_X6 Line_X3_X4)
   (line-isolator Breaker_X17_X18 Line_X3_X4)
   (line-isolator Breaker_X11_X12 Line_X3_X4)
   (adjacent Line_X1_X2 Bus_X1)
   (adjacent Line_X1_X2 Bus_X2)
   (adjacent Line_X3_X4 Bus_X3)
   (adjacent Line_X3_X4 Bus_X4)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
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
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (line-voltage-unknown Line_X1_X2)
   (line-voltage-unknown Line_X3_X4)
   (line-voltage-unknown Line_X7_X8)
   (bus-voltage-unknown Bus_X1)
   (bus-voltage-unknown Bus_X3)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X4)

   ;; 1309618800 (2011-07-02 15:00:00):
   (matches-4 obs548 command Breaker_X19_X20 ar_supy_control_status NON_AUTO)
   (pending obs548)

   ;; 1309618802 (2011-07-02 15:00:02):
   (matches-3 obs549 Breaker_X19_X20 ar_supy_control_status NON_AUTO)
   (future obs549)
   (precedes obs549 obs548)
   (delay-trip-wait obs549 obs548)

   ;; 1309618803 (2011-07-02 15:00:03):
   (matches-4 obs550 command Breaker_X19_X20 cb_state open)
   (future obs550)
   (precedes obs550 obs549)

   ;; 1309618826 (2011-07-02 15:00:26):
   (matches-3 obs551 Breaker_X17_X18 ar_supy_control_status NON_AUTO)
   (future obs551)
   (precedes obs551 obs550)
   (delay-short-time obs551 obs548)
   (delay-short-time obs551 obs549)
   (delay-trip-wait obs551 obs549)
   (delay-short-time obs551 obs550)
   (delay-trip-wait obs551 obs550)

   ;; 1309618838 (2011-07-02 15:00:38):
   (matches-3 obs552 Breaker_X5_X6 ar_supy_control_status NON_AUTO)
   (future obs552)
   (precedes obs552 obs551)
   (delay-trip-wait obs552 obs551)

   ;; 1309618840 (2011-07-02 15:00:40):
   (matches-3 obs553 Line_X3_X4 entered_zero_zone KV)
   (future obs553)
   (precedes obs553 obs552)
   (delay-trip-wait obs553 obs552)

   ;; 1309618843 (2011-07-02 15:00:43):
   (matches-3 obs554 Breaker_X19_X20 cb_state open)
   (future obs554)
   (precedes obs554 obs553)
   (delay-trip-wait obs554 obs553)
   (delay-short-time obs554 obs551)

   ;; 1309618845 (2011-07-02 15:00:45):
   (matches-3 obs555 Breaker_X15_X16 cb_state open)
   (future obs555)
   (precedes obs555 obs554)
   (delay-trip-wait obs555 obs554)

   ;; 1309618848 (2011-07-02 15:00:48):
   (matches-3 obs556 Line_X1_X2 entered_zero_zone KV)
   (future obs556)
   (precedes obs556 obs555)
   (delay-rc-wait obs556 obs549)
   (delay-trip-wait obs556 obs555)

   ;; 1309618859 (2011-07-02 15:00:59):
   (matches-3 obs557 Breaker_X19_X20 cb_state closed)
   (future obs557)
   (precedes obs557 obs556)
   (delay-short-time obs557 obs553)
   (delay-short-time obs557 obs554)
   (delay-short-time obs557 obs552)
   (delay-trip-wait obs557 obs556)

   ;; 1309618860 (2011-07-02 15:01:00):
   (matches-3 obs558 Breaker_X9_X10 cb_state closed)
   (future obs558)
   (precedes obs558 obs557)

   ;; 1309618860 (2011-07-02 15:01:00):
   (matches-3 obs559 Breaker_X11_X12 ar_supy_control_status NON_AUTO)
   (future obs559)
   (precedes obs559 obs557)

   ;; 1309618867 (2011-07-02 15:01:07):
   (matches-4 obs560 command Breaker_X17_X18 cb_state open)
   (future obs560)
   (precedes obs560 obs558)
   (precedes obs560 obs559)
   (delay-trip-wait obs560 obs559)
   (delay-trip-wait obs560 obs558)
   (delay-short-time obs560 obs555)
   (delay-short-time obs560 obs556)
   (delay-trip-wait obs560 obs557)

   ;; 1309618869 (2011-07-02 15:01:09):
   (matches-3 obs561 Breaker_X13_X14 cb_state open)
   (future obs561)
   (precedes obs561 obs560)
   (delay-trip-wait obs561 obs560)

   ;; 1309618884 (2011-07-02 15:01:24):
   (matches-4 obs562 command Breaker_X5_X6 cb_state open)
   (future obs562)
   (precedes obs562 obs561)
   (delay-short-time obs562 obs559)
   (delay-trip-wait obs562 obs561)
   (delay-short-time obs562 obs558)
   (delay-rc-wait obs562 obs552)
   (delay-short-time obs562 obs560)
   (delay-rc-wait obs562 obs551)
   (delay-short-time obs562 obs557)

   ;; 1309618888 (2011-07-02 15:01:28):
   (matches-3 obs563 Breaker_X17_X18 cb_state open)
   (future obs563)
   (precedes obs563 obs562)
   (delay-rc-wait obs563 obs553)
   (delay-trip-wait obs563 obs562)
   (delay-short-time obs563 obs561)

   ;; 1309618888 (2011-07-02 15:01:28):
   (matches-3 obs564 Breaker_X5_X6 cb_state open)
   (future obs564)
   (precedes obs564 obs562)
   (delay-trip-wait obs564 obs562)
   (delay-short-time obs564 obs561)

   ;; 1309618892 (2011-07-02 15:01:32):
   (matches-4 obs565 Bus_X21 limit KV Normal)
   (future obs565)
   (precedes obs565 obs563)
   (precedes obs565 obs564)
   (delay-trip-wait obs565 obs564)
   (delay-trip-wait obs565 obs563)
   (delay-rc-wait obs565 obs555)

   ;; 1309618895 (2011-07-02 15:01:35):
   (matches-4 obs566 Bus_X22 limit KV Low)
   (future obs566)
   (precedes obs566 obs565)
   (delay-trip-wait obs566 obs565)
   (delay-rc-wait obs566 obs556)

   ;; 1309618895 (2011-07-02 15:01:35):
   (matches-4 obs567 Line_X7_X8 limit MW Normal)
   (future obs567)
   (precedes obs567 obs565)
   (delay-trip-wait obs567 obs565)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs548)
              (observed obs549)
              (observed obs550)
              (observed obs551)
              (observed obs552)
              (observed obs553)
              (observed obs554)
              (observed obs555)
              (observed obs556)
              (observed obs557)
              (observed obs558)
              (observed obs559)
              (observed obs560)
              (observed obs561)
              (observed obs562)
              (observed obs563)
              (observed obs564)
              (observed obs565)
              (observed obs566)
              (observed obs567)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.420 (cpu) 1.440 (real)
