;; from 2011-07-02 22:00:00 to 2011-07-02 23:00:00: 20 observations (13 alarms), 28 components
(define (problem network)
  (:domain APPN)

  (:objects
   Line_X1_X2 - Line
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Disconnector_X17_X18 - Disconnector
   Breaker_X19_X20 - Breaker
   Disconnector_X21_X22 - Disconnector
   Line_X23_X24 - Line
   Breaker_X25_X26 - Breaker
   Line_X27_X28 - Line
   Bus_X29 - bus
   Bus_X30 - bus
   Bus_X21 - bus
   Line_X31_X32 - Line
   Breaker_X33_X34 - Breaker
   Breaker_X35_X36 - Breaker
   Bus_X1 - bus
   Bus_X23 - bus
   Bus_X27 - bus
   Bus_X31 - bus
   Bus_X2 - bus
   Bus_X24 - bus
   Bus_X28 - bus
   Bus_X32 - bus
   obs635 - observation
   obs636 - observation
   obs637 - observation
   obs638 - observation
   obs639 - observation
   obs640 - observation
   obs641 - observation
   obs642 - observation
   obs643 - observation
   obs644 - observation
   obs645 - observation
   obs646 - observation
   obs647 - observation
   obs648 - observation
   obs649 - observation
   obs650 - observation
   obs651 - observation
   obs652 - observation
   obs653 - observation
   obs654 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X23_X24 Breaker_X25_X26 Breaker_X3_X4)
   (line-isolator Breaker_X25_X26 Line_X23_X24)
   (line-isolator Breaker_X3_X4 Line_X23_X24)
   (line-isolators-2 Line_X31_X32 Breaker_X33_X34 Breaker_X9_X10)
   (line-isolator Breaker_X33_X34 Line_X31_X32)
   (line-isolator Breaker_X9_X10 Line_X31_X32)
   (line-isolators-2 Line_X27_X28 Breaker_X35_X36 Breaker_X11_X12)
   (line-isolator Breaker_X35_X36 Line_X27_X28)
   (line-isolator Breaker_X11_X12 Line_X27_X28)
   (adjacent Line_X1_X2 Bus_X1)
   (adjacent Line_X1_X2 Bus_X2)
   (adjacent Line_X23_X24 Bus_X23)
   (adjacent Line_X23_X24 Bus_X24)
   (adjacent Line_X27_X28 Bus_X27)
   (adjacent Line_X27_X28 Bus_X28)
   (adjacent Line_X31_X32 Bus_X31)
   (adjacent Line_X31_X32 Bus_X32)
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
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X33_X34)
   (breaker-ar-status-is-unknown Breaker_X33_X34)
   (breaker-state-is-unknown Breaker_X35_X36)
   (breaker-ar-status-is-unknown Breaker_X35_X36)
   (disconnector-state-is-unknown Disconnector_X17_X18)
   (disconnector-state-is-unknown Disconnector_X21_X22)
   (line-voltage-unknown Line_X1_X2)
   (line-voltage-unknown Line_X23_X24)
   (line-voltage-unknown Line_X27_X28)
   (line-voltage-unknown Line_X31_X32)
   (bus-voltage-unknown Bus_X1)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X29)
   (bus-voltage-unknown Bus_X31)
   (bus-voltage-unknown Bus_X32)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X30)
   (bus-voltage-unknown Bus_X21)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X27)

   ;; 1309644000 (2011-07-02 22:00:00):
   (matches-4 obs635 command Breaker_X25_X26 cb_state open)
   (pending obs635)

   ;; 1309644008 (2011-07-02 22:00:08):
   (matches-3 obs636 Breaker_X25_X26 cb_state open)
   (future obs636)
   (precedes obs636 obs635)
   (delay-trip-wait obs636 obs635)

   ;; 1309644009 (2011-07-02 22:00:09):
   (matches-3 obs637 Line_X23_X24 entered_zero_zone KV)
   (future obs637)
   (precedes obs637 obs636)

   ;; 1309644012 (2011-07-02 22:00:12):
   (matches-4 obs638 command Breaker_X3_X4 ar_supy_control_status NON_AUTO)
   (future obs638)
   (precedes obs638 obs637)
   (delay-trip-wait obs638 obs636)
   (delay-trip-wait obs638 obs637)

   ;; 1309644040 (2011-07-02 22:00:40):
   (matches-3 obs639 Breaker_X3_X4 ar_supy_control_status NON_AUTO)
   (future obs639)
   (precedes obs639 obs638)
   (delay-short-time obs639 obs635)
   (delay-short-time obs639 obs636)
   (delay-short-time obs639 obs637)
   (delay-short-time obs639 obs638)
   (delay-trip-wait obs639 obs638)

   ;; 1309644045 (2011-07-02 22:00:45):
   (matches-3 obs640 Breaker_X9_X10 cb_state open)
   (future obs640)
   (precedes obs640 obs639)
   (delay-trip-wait obs640 obs639)

   ;; 1309644046 (2011-07-02 22:00:46):
   (matches-3 obs641 Breaker_X11_X12 cb_state open)
   (future obs641)
   (precedes obs641 obs640)

   ;; 1309644049 (2011-07-02 22:00:49):
   (matches-3 obs642 Line_X27_X28 entered_zero_zone KV)
   (future obs642)
   (precedes obs642 obs641)
   (delay-trip-wait obs642 obs640)
   (delay-trip-wait obs642 obs641)

   ;; 1309644052 (2011-07-02 22:00:52):
   (matches-4 obs643 Bus_X29 limit KV Low)
   (future obs643)
   (precedes obs643 obs642)
   (delay-trip-wait obs643 obs642)

   ;; 1309644052 (2011-07-02 22:00:52):
   (matches-3 obs644 Line_X1_X2 entered_zero_zone KV)
   (future obs644)
   (precedes obs644 obs642)
   (delay-trip-wait obs644 obs642)

   ;; 1309644053 (2011-07-02 22:00:53):
   (matches-3 obs645 Breaker_X13_X14 cb_state open)
   (future obs645)
   (precedes obs645 obs643)
   (precedes obs645 obs644)

   ;; 1309644077 (2011-07-02 22:01:17):
   (matches-3 obs646 Breaker_X7_X8 cb_state open)
   (future obs646)
   (precedes obs646 obs645)
   (delay-short-time obs646 obs643)
   (delay-trip-wait obs646 obs643)
   (delay-short-time obs646 obs640)
   (delay-short-time obs646 obs645)
   (delay-trip-wait obs646 obs645)
   (delay-rc-wait obs646 obs638)
   (delay-short-time obs646 obs644)
   (delay-trip-wait obs646 obs644)
   (delay-short-time obs646 obs639)
   (delay-short-time obs646 obs641)
   (delay-rc-wait obs646 obs637)
   (delay-short-time obs646 obs642)

   ;; 1309644084 (2011-07-02 22:01:24):
   (matches-4 obs647 command Breaker_X15_X16 cb_state closed)
   (future obs647)
   (precedes obs647 obs646)
   (delay-trip-wait obs647 obs646)

   ;; 1309644090 (2011-07-02 22:01:30):
   (matches-3 obs648 Breaker_X15_X16 cb_state closed)
   (future obs648)
   (precedes obs648 obs647)
   (delay-rc-wait obs648 obs639)
   (delay-trip-wait obs648 obs647)

   ;; 1309644092 (2011-07-02 22:01:32):
   (matches-3 obs649 Breaker_X5_X6 cb_state closed)
   (future obs649)
   (precedes obs649 obs648)
   (delay-rc-wait obs649 obs641)
   (delay-trip-wait obs649 obs648)

   ;; 1309644096 (2011-07-02 22:01:36):
   (matches-4 obs650 command Disconnector_X17_X18 sw_state closed)
   (future obs650)
   (precedes obs650 obs649)
   (delay-short-time obs650 obs646)
   (delay-trip-wait obs650 obs649)
   (delay-rc-wait obs650 obs642)

   ;; 1309644106 (2011-07-02 22:01:46):
   (matches-4 obs651 command Disconnector_X21_X22 sw_state closed)
   (future obs651)
   (precedes obs651 obs650)
   (delay-trip-wait obs651 obs650)
   (delay-rc-wait obs651 obs643)
   (delay-rc-wait obs651 obs645)
   (delay-rc-wait obs651 obs644)
   (delay-short-time obs651 obs648)
   (delay-short-time obs651 obs647)

   ;; 1309644133 (2011-07-02 22:02:13):
   (matches-4 obs652 Bus_X30 limit KV Low)
   (future obs652)
   (precedes obs652 obs651)
   (delay-short-time obs652 obs650)
   (delay-rc-wait obs652 obs646)
   (delay-short-time obs652 obs651)
   (delay-trip-wait obs652 obs651)
   (delay-short-time obs652 obs649)
   (delay-rc-wait obs652 obs647)

   ;; 1309644133 (2011-07-02 22:02:13):
   (matches-4 obs653 Bus_X21 limit KV Low)
   (future obs653)
   (precedes obs653 obs651)
   (delay-short-time obs653 obs650)
   (delay-short-time obs653 obs651)
   (delay-trip-wait obs653 obs651)
   (delay-short-time obs653 obs649)

   ;; 1309644134 (2011-07-02 22:02:14):
   (matches-3 obs654 Breaker_X19_X20 cb_state open)
   (future obs654)
   (precedes obs654 obs652)
   (precedes obs654 obs653)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs635)
              (observed obs636)
              (observed obs637)
              (observed obs638)
              (observed obs639)
              (observed obs640)
              (observed obs641)
              (observed obs642)
              (observed obs643)
              (observed obs644)
              (observed obs645)
              (observed obs646)
              (observed obs647)
              (observed obs648)
              (observed obs649)
              (observed obs650)
              (observed obs651)
              (observed obs652)
              (observed obs653)
              (observed obs654)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.412 (cpu) 1.513 (real)
