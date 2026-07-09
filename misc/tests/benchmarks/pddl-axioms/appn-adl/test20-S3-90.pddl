;; from 2011-07-04 17:00:00 to 2011-07-04 18:00:00: 20 observations (17 alarms), 44 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Line_X13_X14 - Line
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Line_X27_X28 - Line
   Breaker_X29_X30 - Breaker
   Breaker_X31_X32 - Breaker
   Bus_X33 - bus
   Bus_X34 - bus
   Line_X35_X36 - Line
   Breaker_X37_X38 - Breaker
   Breaker_X39_X40 - Breaker
   Breaker_X41_X42 - Breaker
   Line_X43_X44 - Line
   Line_X45_X46 - Line
   Line_X47_X48 - Line
   Breaker_X49_X50 - Breaker
   Breaker_X51_X52 - Breaker
   Breaker_X53_X54 - Breaker
   Breaker_X55_X56 - Breaker
   Breaker_X57_X58 - Breaker
   Breaker_X59_X60 - Breaker
   Breaker_X61_X62 - Breaker
   Bus_X13 - bus
   Bus_X27 - bus
   Bus_X35 - bus
   Bus_X43 - bus
   Bus_X45 - bus
   Bus_X47 - bus
   Bus_X14 - bus
   Bus_X28 - bus
   Bus_X36 - bus
   Bus_X44 - bus
   Bus_X46 - bus
   Bus_X48 - bus
   obs1680 - observation
   obs1681 - observation
   obs1682 - observation
   obs1683 - observation
   obs1684 - observation
   obs1685 - observation
   obs1686 - observation
   obs1687 - observation
   obs1688 - observation
   obs1689 - observation
   obs1690 - observation
   obs1691 - observation
   obs1692 - observation
   obs1693 - observation
   obs1694 - observation
   obs1695 - observation
   obs1696 - observation
   obs1697 - observation
   obs1698 - observation
   obs1699 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X27_X28 Breaker_X29_X30 Breaker_X37_X38 Breaker_X39_X40)
   (line-isolator Breaker_X29_X30 Line_X27_X28)
   (line-isolator Breaker_X37_X38 Line_X27_X28)
   (line-isolator Breaker_X39_X40 Line_X27_X28)
   (line-isolators-3 Line_X35_X36 Breaker_X31_X32 Breaker_X9_X10 Breaker_X41_X42)
   (line-isolator Breaker_X31_X32 Line_X35_X36)
   (line-isolator Breaker_X9_X10 Line_X35_X36)
   (line-isolator Breaker_X41_X42 Line_X35_X36)
   (line-isolators-4 Line_X43_X44 Breaker_X49_X50 Breaker_X7_X8 Breaker_X57_X58 Breaker_X61_X62)
   (line-isolator Breaker_X49_X50 Line_X43_X44)
   (line-isolator Breaker_X7_X8 Line_X43_X44)
   (line-isolator Breaker_X57_X58 Line_X43_X44)
   (line-isolator Breaker_X61_X62 Line_X43_X44)
   (line-isolators-4 Line_X45_X46 Breaker_X51_X52 Breaker_X17_X18 Breaker_X59_X60 Breaker_X19_X20)
   (line-isolator Breaker_X51_X52 Line_X45_X46)
   (line-isolator Breaker_X17_X18 Line_X45_X46)
   (line-isolator Breaker_X59_X60 Line_X45_X46)
   (line-isolator Breaker_X19_X20 Line_X45_X46)
   (line-isolators-4 Line_X13_X14 Breaker_X53_X54 Breaker_X15_X16 Breaker_X59_X60 Breaker_X19_X20)
   (line-isolator Breaker_X53_X54 Line_X13_X14)
   (line-isolator Breaker_X15_X16 Line_X13_X14)
   (line-isolator Breaker_X59_X60 Line_X13_X14)
   (line-isolator Breaker_X19_X20 Line_X13_X14)
   (line-isolators-4 Line_X47_X48 Breaker_X11_X12 Breaker_X55_X56 Breaker_X21_X22 Breaker_X23_X24)
   (line-isolator Breaker_X11_X12 Line_X47_X48)
   (line-isolator Breaker_X55_X56 Line_X47_X48)
   (line-isolator Breaker_X21_X22 Line_X47_X48)
   (line-isolator Breaker_X23_X24 Line_X47_X48)
   (adjacent Line_X13_X14 Bus_X13)
   (adjacent Line_X13_X14 Bus_X14)
   (adjacent Line_X27_X28 Bus_X27)
   (adjacent Line_X27_X28 Bus_X28)
   (adjacent Line_X35_X36 Bus_X35)
   (adjacent Line_X35_X36 Bus_X36)
   (adjacent Line_X43_X44 Bus_X43)
   (adjacent Line_X43_X44 Bus_X44)
   (adjacent Line_X45_X46 Bus_X45)
   (adjacent Line_X45_X46 Bus_X46)
   (adjacent Line_X47_X48 Bus_X47)
   (adjacent Line_X47_X48 Bus_X48)
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
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X29_X30)
   (breaker-ar-status-is-unknown Breaker_X29_X30)
   (breaker-state-is-unknown Breaker_X31_X32)
   (breaker-ar-status-is-unknown Breaker_X31_X32)
   (breaker-state-is-unknown Breaker_X37_X38)
   (breaker-ar-status-is-unknown Breaker_X37_X38)
   (breaker-state-is-unknown Breaker_X39_X40)
   (breaker-ar-status-is-unknown Breaker_X39_X40)
   (breaker-state-is-unknown Breaker_X41_X42)
   (breaker-ar-status-is-unknown Breaker_X41_X42)
   (breaker-state-is-unknown Breaker_X49_X50)
   (breaker-ar-status-is-unknown Breaker_X49_X50)
   (breaker-state-is-unknown Breaker_X51_X52)
   (breaker-ar-status-is-unknown Breaker_X51_X52)
   (breaker-state-is-unknown Breaker_X53_X54)
   (breaker-ar-status-is-unknown Breaker_X53_X54)
   (breaker-state-is-unknown Breaker_X55_X56)
   (breaker-ar-status-is-unknown Breaker_X55_X56)
   (breaker-state-is-unknown Breaker_X57_X58)
   (breaker-ar-status-is-unknown Breaker_X57_X58)
   (breaker-state-is-unknown Breaker_X59_X60)
   (breaker-ar-status-is-unknown Breaker_X59_X60)
   (breaker-state-is-unknown Breaker_X61_X62)
   (breaker-ar-status-is-unknown Breaker_X61_X62)
   (line-voltage-unknown Line_X13_X14)
   (line-voltage-unknown Line_X27_X28)
   (line-voltage-unknown Line_X35_X36)
   (line-voltage-unknown Line_X43_X44)
   (line-voltage-unknown Line_X45_X46)
   (line-voltage-unknown Line_X47_X48)
   (bus-voltage-unknown Bus_X33)
   (bus-voltage-unknown Bus_X34)
   (bus-voltage-unknown Bus_X43)
   (bus-voltage-unknown Bus_X36)
   (bus-voltage-unknown Bus_X47)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X45)
   (bus-voltage-unknown Bus_X14)
   (bus-voltage-unknown Bus_X46)
   (bus-voltage-unknown Bus_X48)
   (bus-voltage-unknown Bus_X27)
   (bus-voltage-unknown Bus_X35)
   (bus-voltage-unknown Bus_X28)
   (bus-voltage-unknown Bus_X44)

   ;; 1309798800 (2011-07-04 17:00:00):
   (matches-4 obs1680 command Breaker_X15_X16 cb_state open)
   (pending obs1680)

   ;; 1309798802 (2011-07-04 17:00:02):
   (matches-3 obs1681 Breaker_X15_X16 cb_state open)
   (future obs1681)
   (precedes obs1681 obs1680)
   (delay-trip-wait obs1681 obs1680)

   ;; 1309798811 (2011-07-04 17:00:11):
   (matches-4 obs1682 Bus_X33 limit KV Normal)
   (future obs1682)
   (precedes obs1682 obs1681)
   (delay-trip-wait obs1682 obs1681)

   ;; 1309798815 (2011-07-04 17:00:15):
   (matches-3 obs1683 Breaker_X19_X20 cb_state closed)
   (future obs1683)
   (precedes obs1683 obs1682)
   (delay-trip-wait obs1683 obs1682)

   ;; 1309798834 (2011-07-04 17:00:34):
   (matches-4 obs1684 Bus_X34 limit KV Normal)
   (future obs1684)
   (precedes obs1684 obs1683)
   (delay-short-time obs1684 obs1682)
   (delay-short-time obs1684 obs1681)
   (delay-short-time obs1684 obs1683)
   (delay-trip-wait obs1684 obs1683)
   (delay-short-time obs1684 obs1680)

   ;; 1309798834 (2011-07-04 17:00:34):
   (matches-3 obs1685 Breaker_X3_X4 cb_state open)
   (future obs1685)
   (precedes obs1685 obs1683)
   (delay-short-time obs1685 obs1682)
   (delay-short-time obs1685 obs1681)
   (delay-short-time obs1685 obs1683)
   (delay-trip-wait obs1685 obs1683)
   (delay-short-time obs1685 obs1680)

   ;; 1309798837 (2011-07-04 17:00:37):
   (matches-4 obs1686 Line_X13_X14 limit MW Normal)
   (future obs1686)
   (precedes obs1686 obs1684)
   (precedes obs1686 obs1685)
   (delay-trip-wait obs1686 obs1684)
   (delay-trip-wait obs1686 obs1685)

   ;; 1309798837 (2011-07-04 17:00:37):
   (matches-4 obs1687 command Breaker_X3_X4 cb_state closed)
   (future obs1687)
   (precedes obs1687 obs1684)
   (precedes obs1687 obs1685)
   (delay-trip-wait obs1687 obs1684)
   (delay-trip-wait obs1687 obs1685)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1688 Breaker_X31_X32 cb_state open)
   (future obs1688)
   (precedes obs1688 obs1686)
   (precedes obs1688 obs1687)
   (delay-trip-wait obs1688 obs1686)
   (delay-trip-wait obs1688 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1689 Breaker_X9_X10 cb_state open)
   (future obs1689)
   (precedes obs1689 obs1686)
   (precedes obs1689 obs1687)
   (delay-trip-wait obs1689 obs1686)
   (delay-trip-wait obs1689 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1690 Breaker_X23_X24 cb_state open)
   (future obs1690)
   (precedes obs1690 obs1686)
   (precedes obs1690 obs1687)
   (delay-trip-wait obs1690 obs1686)
   (delay-trip-wait obs1690 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1691 Breaker_X7_X8 cb_state open)
   (future obs1691)
   (precedes obs1691 obs1686)
   (precedes obs1691 obs1687)
   (delay-trip-wait obs1691 obs1686)
   (delay-trip-wait obs1691 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1692 Breaker_X25_X26 cb_state open)
   (future obs1692)
   (precedes obs1692 obs1686)
   (precedes obs1692 obs1687)
   (delay-trip-wait obs1692 obs1686)
   (delay-trip-wait obs1692 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1693 Breaker_X21_X22 cb_state open)
   (future obs1693)
   (precedes obs1693 obs1686)
   (precedes obs1693 obs1687)
   (delay-trip-wait obs1693 obs1686)
   (delay-trip-wait obs1693 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1694 Breaker_X29_X30 cb_state open)
   (future obs1694)
   (precedes obs1694 obs1686)
   (precedes obs1694 obs1687)
   (delay-trip-wait obs1694 obs1686)
   (delay-trip-wait obs1694 obs1687)

   ;; 1309798845 (2011-07-04 17:00:45):
   (matches-3 obs1695 Breaker_X11_X12 cb_state open)
   (future obs1695)
   (precedes obs1695 obs1686)
   (precedes obs1695 obs1687)
   (delay-trip-wait obs1695 obs1686)
   (delay-trip-wait obs1695 obs1687)

   ;; 1309798846 (2011-07-04 17:00:46):
   (matches-3 obs1696 Breaker_X17_X18 cb_state closed)
   (future obs1696)
   (precedes obs1696 obs1688)
   (precedes obs1696 obs1689)
   (precedes obs1696 obs1690)
   (precedes obs1696 obs1691)
   (precedes obs1696 obs1692)
   (precedes obs1696 obs1693)
   (precedes obs1696 obs1694)
   (precedes obs1696 obs1695)

   ;; 1309798846 (2011-07-04 17:00:46):
   (matches-3 obs1697 Breaker_X5_X6 cb_state open)
   (future obs1697)
   (precedes obs1697 obs1688)
   (precedes obs1697 obs1689)
   (precedes obs1697 obs1690)
   (precedes obs1697 obs1691)
   (precedes obs1697 obs1692)
   (precedes obs1697 obs1693)
   (precedes obs1697 obs1694)
   (precedes obs1697 obs1695)

   ;; 1309798846 (2011-07-04 17:00:46):
   (matches-4 obs1698 Line_X27_X28 limit KV Low)
   (future obs1698)
   (precedes obs1698 obs1688)
   (precedes obs1698 obs1689)
   (precedes obs1698 obs1690)
   (precedes obs1698 obs1691)
   (precedes obs1698 obs1692)
   (precedes obs1698 obs1693)
   (precedes obs1698 obs1694)
   (precedes obs1698 obs1695)

   ;; 1309798846 (2011-07-04 17:00:46):
   (matches-3 obs1699 Breaker_X1_X2 cb_state open)
   (future obs1699)
   (precedes obs1699 obs1688)
   (precedes obs1699 obs1689)
   (precedes obs1699 obs1690)
   (precedes obs1699 obs1691)
   (precedes obs1699 obs1692)
   (precedes obs1699 obs1693)
   (precedes obs1699 obs1694)
   (precedes obs1699 obs1695)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1680)
              (observed obs1681)
              (observed obs1682)
              (observed obs1683)
              (observed obs1684)
              (observed obs1685)
              (observed obs1686)
              (observed obs1687)
              (observed obs1688)
              (observed obs1689)
              (observed obs1690)
              (observed obs1691)
              (observed obs1692)
              (observed obs1693)
              (observed obs1694)
              (observed obs1695)
              (observed obs1696)
              (observed obs1697)
              (observed obs1698)
              (observed obs1699)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.428 (cpu) 1.471 (real)
