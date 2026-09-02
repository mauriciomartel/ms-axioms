;; from 2011-07-04 15:00:00 to 2011-07-04 16:00:00: 5 observations (3 alarms), 6 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Bus_X7 - bus
   Bus_X8 - bus
   obs1655 - observation
   obs1656 - observation
   obs1657 - observation
   obs1658 - observation
   obs1659 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X7_X8 Breaker_X1_X2 Breaker_X3_X4 Breaker_X5_X6)
   (line-isolator Breaker_X1_X2 Line_X7_X8)
   (line-isolator Breaker_X3_X4 Line_X7_X8)
   (line-isolator Breaker_X5_X6 Line_X7_X8)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (line-voltage-unknown Line_X7_X8)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X8)

   ;; 1309791600 (2011-07-04 15:00:00):
   (matches-3 obs1655 Breaker_X1_X2 cb_state closed)
   (pending obs1655)

   ;; 1309791603 (2011-07-04 15:00:03):
   (matches-4 obs1656 command Breaker_X5_X6 cb_state closed)
   (future obs1656)
   (precedes obs1656 obs1655)
   (delay-trip-wait obs1656 obs1655)

   ;; 1309791620 (2011-07-04 15:00:20):
   (matches-3 obs1657 Breaker_X5_X6 cb_state closed)
   (future obs1657)
   (precedes obs1657 obs1656)
   (delay-short-time obs1657 obs1655)
   (delay-short-time obs1657 obs1656)
   (delay-trip-wait obs1657 obs1656)

   ;; 1309791624 (2011-07-04 15:00:24):
   (matches-4 obs1658 command Breaker_X3_X4 cb_state closed)
   (future obs1658)
   (precedes obs1658 obs1657)
   (delay-trip-wait obs1658 obs1657)

   ;; 1309791642 (2011-07-04 15:00:42):
   (matches-3 obs1659 Breaker_X3_X4 cb_state closed)
   (future obs1659)
   (precedes obs1659 obs1658)
   (delay-short-time obs1659 obs1657)
   (delay-short-time obs1659 obs1658)
   (delay-trip-wait obs1659 obs1658)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1655)
              (observed obs1656)
              (observed obs1657)
              (observed obs1658)
              (observed obs1659)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.496 (cpu) 1.863 (real)
