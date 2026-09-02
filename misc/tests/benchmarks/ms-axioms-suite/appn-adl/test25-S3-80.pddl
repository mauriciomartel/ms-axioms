;; from 2011-07-04 07:00:00 to 2011-07-04 08:00:00: 20 observations (20 alarms), 54 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Line_X5_X6 - Line
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Line_X15_X16 - Line
   Line_X17_X18 - Line
   Breaker_X19_X20 - Breaker
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Line_X25_X26 - Line
   Breaker_X27_X28 - Breaker
   Breaker_X29_X30 - Breaker
   Breaker_X31_X32 - Breaker
   Breaker_X33_X34 - Breaker
   Bus_X35 - bus
   Generator_X36_1 - generator
   Breaker_X37_X38 - Breaker
   Line_X39_X40 - Line
   Line_X41_X42 - Line
   Breaker_X43_X44 - Breaker
   Breaker_X45_X46 - Breaker
   Breaker_X47_X48 - Breaker
   Breaker_X49_X50 - Breaker
   Line_X51_X52 - Line
   Line_X53_X54 - Line
   Breaker_X55_X56 - Breaker
   Breaker_X57_X58 - Breaker
   Breaker_X59_X60 - Breaker
   Breaker_X61_X62 - Breaker
   Breaker_X63_X64 - Breaker
   Breaker_X65_X66 - Breaker
   Bus_X5 - bus
   Bus_X15 - bus
   Bus_X17 - bus
   Bus_X25 - bus
   Bus_X39 - bus
   Bus_X41 - bus
   Bus_X51 - bus
   Bus_X53 - bus
   Bus_X6 - bus
   Bus_X16 - bus
   Bus_X18 - bus
   Bus_X26 - bus
   Bus_X40 - bus
   Bus_X42 - bus
   Bus_X52 - bus
   Bus_X54 - bus
   Breaker_X67_X36 - Breaker
   Bus_X2 - bus
   Bus_X36 - bus
   Generator_X2_1 - generator
   obs1510 - observation
   obs1511 - observation
   obs1512 - observation
   obs1513 - observation
   obs1514 - observation
   obs1515 - observation
   obs1516 - observation
   obs1517 - observation
   obs1518 - observation
   obs1519 - observation
   obs1520 - observation
   obs1521 - observation
   obs1522 - observation
   obs1523 - observation
   obs1524 - observation
   obs1525 - observation
   obs1526 - observation
   obs1527 - observation
   obs1528 - observation
   obs1529 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X15_X16 Breaker_X37_X38 Breaker_X23_X24)
   (line-isolator Breaker_X37_X38 Line_X15_X16)
   (line-isolator Breaker_X23_X24 Line_X15_X16)
   (line-isolators-3 Line_X5_X6 Breaker_X7_X8 Breaker_X9_X10 Breaker_X49_X50)
   (line-isolator Breaker_X7_X8 Line_X5_X6)
   (line-isolator Breaker_X9_X10 Line_X5_X6)
   (line-isolator Breaker_X49_X50 Line_X5_X6)
   (line-isolators-3 Line_X39_X40 Breaker_X43_X44 Breaker_X31_X32 Breaker_X33_X34)
   (line-isolator Breaker_X43_X44 Line_X39_X40)
   (line-isolator Breaker_X31_X32 Line_X39_X40)
   (line-isolator Breaker_X33_X34 Line_X39_X40)
   (line-isolators-3 Line_X41_X42 Breaker_X45_X46 Breaker_X47_X48 Breaker_X13_X14)
   (line-isolator Breaker_X45_X46 Line_X41_X42)
   (line-isolator Breaker_X47_X48 Line_X41_X42)
   (line-isolator Breaker_X13_X14 Line_X41_X42)
   (line-isolators-4 Line_X51_X52 Breaker_X27_X28 Breaker_X57_X58 Breaker_X59_X60 Breaker_X63_X64)
   (line-isolator Breaker_X27_X28 Line_X51_X52)
   (line-isolator Breaker_X57_X58 Line_X51_X52)
   (line-isolator Breaker_X59_X60 Line_X51_X52)
   (line-isolator Breaker_X63_X64 Line_X51_X52)
   (line-isolators-4 Line_X53_X54 Breaker_X55_X56 Breaker_X3_X4 Breaker_X61_X62 Breaker_X65_X66)
   (line-isolator Breaker_X55_X56 Line_X53_X54)
   (line-isolator Breaker_X3_X4 Line_X53_X54)
   (line-isolator Breaker_X61_X62 Line_X53_X54)
   (line-isolator Breaker_X65_X66 Line_X53_X54)
   (adjacent Line_X5_X6 Bus_X5)
   (adjacent Line_X5_X6 Bus_X6)
   (adjacent Line_X15_X16 Bus_X15)
   (adjacent Line_X15_X16 Bus_X16)
   (adjacent Line_X17_X18 Bus_X17)
   (adjacent Line_X17_X18 Bus_X18)
   (adjacent Line_X25_X26 Bus_X25)
   (adjacent Line_X25_X26 Bus_X26)
   (adjacent Line_X39_X40 Bus_X39)
   (adjacent Line_X39_X40 Bus_X40)
   (adjacent Line_X41_X42 Bus_X41)
   (adjacent Line_X41_X42 Bus_X42)
   (adjacent Line_X51_X52 Bus_X51)
   (adjacent Line_X51_X52 Bus_X52)
   (adjacent Line_X53_X54 Bus_X53)
   (adjacent Line_X53_X54 Bus_X54)
   (generator-attached-to Generator_X2_1 Bus_X2)
   (generator-attached-to Generator_X36_1 Bus_X36)
   (generator-isolator Breaker_X1_X2 Bus_X2)
   (generator-isolator Breaker_X67_X36 Bus_X36)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X27_X28)
   (breaker-ar-status-is-unknown Breaker_X27_X28)
   (breaker-state-is-unknown Breaker_X29_X30)
   (breaker-ar-status-is-unknown Breaker_X29_X30)
   (breaker-state-is-unknown Breaker_X31_X32)
   (breaker-ar-status-is-unknown Breaker_X31_X32)
   (breaker-state-is-unknown Breaker_X33_X34)
   (breaker-ar-status-is-unknown Breaker_X33_X34)
   (breaker-state-is-unknown Breaker_X37_X38)
   (breaker-ar-status-is-unknown Breaker_X37_X38)
   (breaker-state-is-unknown Breaker_X43_X44)
   (breaker-ar-status-is-unknown Breaker_X43_X44)
   (breaker-state-is-unknown Breaker_X45_X46)
   (breaker-ar-status-is-unknown Breaker_X45_X46)
   (breaker-state-is-unknown Breaker_X47_X48)
   (breaker-ar-status-is-unknown Breaker_X47_X48)
   (breaker-state-is-unknown Breaker_X49_X50)
   (breaker-ar-status-is-unknown Breaker_X49_X50)
   (breaker-state-is-unknown Breaker_X55_X56)
   (breaker-ar-status-is-unknown Breaker_X55_X56)
   (breaker-state-is-unknown Breaker_X57_X58)
   (breaker-ar-status-is-unknown Breaker_X57_X58)
   (breaker-state-is-unknown Breaker_X59_X60)
   (breaker-ar-status-is-unknown Breaker_X59_X60)
   (breaker-state-is-unknown Breaker_X61_X62)
   (breaker-ar-status-is-unknown Breaker_X61_X62)
   (breaker-state-is-unknown Breaker_X63_X64)
   (breaker-ar-status-is-unknown Breaker_X63_X64)
   (breaker-state-is-unknown Breaker_X65_X66)
   (breaker-ar-status-is-unknown Breaker_X65_X66)
   (breaker-state-is-unknown Breaker_X67_X36)
   (breaker-ar-status-is-unknown Breaker_X67_X36)
   (line-voltage-unknown Line_X5_X6)
   (line-voltage-unknown Line_X15_X16)
   (line-voltage-unknown Line_X17_X18)
   (line-voltage-unknown Line_X25_X26)
   (line-voltage-unknown Line_X39_X40)
   (line-voltage-unknown Line_X41_X42)
   (line-voltage-unknown Line_X51_X52)
   (line-voltage-unknown Line_X53_X54)
   (bus-voltage-unknown Bus_X2)
   (bus-voltage-unknown Bus_X52)
   (bus-voltage-unknown Bus_X35)
   (bus-voltage-unknown Bus_X53)
   (bus-voltage-unknown Bus_X5)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X54)
   (bus-voltage-unknown Bus_X6)
   (bus-voltage-unknown Bus_X42)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X17)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X39)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X51)
   (bus-voltage-unknown Bus_X36)
   (bus-voltage-unknown Bus_X40)
   (bus-voltage-unknown Bus_X41)
   (bus-voltage-unknown Bus_X18)
   (generator-status-is-unknown Generator_X2_1)
   (generator-status-is-unknown Generator_X36_1)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1510 Breaker_X11_X12 cb_state open)
   (pending obs1510)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1511 Breaker_X29_X30 cb_state open)
   (pending obs1511)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1512 Breaker_X27_X28 cb_state open)
   (pending obs1512)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1513 Breaker_X3_X4 cb_state open)
   (pending obs1513)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1514 Breaker_X19_X20 cb_state open)
   (pending obs1514)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1515 Breaker_X1_X2 cb_state open)
   (pending obs1515)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1516 Breaker_X9_X10 cb_state open)
   (pending obs1516)

   ;; 1309762800 (2011-07-04 07:00:00):
   (matches-3 obs1517 Breaker_X7_X8 cb_state open)
   (pending obs1517)

   ;; 1309762801 (2011-07-04 07:00:01):
   (matches-4 obs1518 Line_X17_X18 limit KV Low)
   (future obs1518)
   (precedes obs1518 obs1510)
   (precedes obs1518 obs1511)
   (precedes obs1518 obs1512)
   (precedes obs1518 obs1513)
   (precedes obs1518 obs1514)
   (precedes obs1518 obs1515)
   (precedes obs1518 obs1516)
   (precedes obs1518 obs1517)

   ;; 1309762801 (2011-07-04 07:00:01):
   (matches-3 obs1519 Breaker_X13_X14 cb_state open)
   (future obs1519)
   (precedes obs1519 obs1510)
   (precedes obs1519 obs1511)
   (precedes obs1519 obs1512)
   (precedes obs1519 obs1513)
   (precedes obs1519 obs1514)
   (precedes obs1519 obs1515)
   (precedes obs1519 obs1516)
   (precedes obs1519 obs1517)

   ;; 1309762801 (2011-07-04 07:00:01):
   (matches-4 obs1520 Line_X25_X26 limit KV Low)
   (future obs1520)
   (precedes obs1520 obs1510)
   (precedes obs1520 obs1511)
   (precedes obs1520 obs1512)
   (precedes obs1520 obs1513)
   (precedes obs1520 obs1514)
   (precedes obs1520 obs1515)
   (precedes obs1520 obs1516)
   (precedes obs1520 obs1517)

   ;; 1309762801 (2011-07-04 07:00:01):
   (matches-4 obs1521 Line_X5_X6 limit KV Low)
   (future obs1521)
   (precedes obs1521 obs1510)
   (precedes obs1521 obs1511)
   (precedes obs1521 obs1512)
   (precedes obs1521 obs1513)
   (precedes obs1521 obs1514)
   (precedes obs1521 obs1515)
   (precedes obs1521 obs1516)
   (precedes obs1521 obs1517)

   ;; 1309762802 (2011-07-04 07:00:02):
   (matches-3 obs1522 Breaker_X9_X10 cb_state closed)
   (future obs1522)
   (precedes obs1522 obs1518)
   (precedes obs1522 obs1519)
   (precedes obs1522 obs1520)
   (precedes obs1522 obs1521)
   (delay-trip-wait obs1522 obs1514)
   (delay-trip-wait obs1522 obs1511)
   (delay-trip-wait obs1522 obs1515)
   (delay-trip-wait obs1522 obs1510)
   (delay-trip-wait obs1522 obs1516)
   (delay-trip-wait obs1522 obs1513)
   (delay-trip-wait obs1522 obs1512)
   (delay-trip-wait obs1522 obs1517)

   ;; 1309762802 (2011-07-04 07:00:02):
   (matches-3 obs1523 Breaker_X23_X24 cb_state open)
   (future obs1523)
   (precedes obs1523 obs1518)
   (precedes obs1523 obs1519)
   (precedes obs1523 obs1520)
   (precedes obs1523 obs1521)
   (delay-trip-wait obs1523 obs1514)
   (delay-trip-wait obs1523 obs1511)
   (delay-trip-wait obs1523 obs1515)
   (delay-trip-wait obs1523 obs1510)
   (delay-trip-wait obs1523 obs1516)
   (delay-trip-wait obs1523 obs1513)
   (delay-trip-wait obs1523 obs1512)
   (delay-trip-wait obs1523 obs1517)

   ;; 1309762802 (2011-07-04 07:00:02):
   (matches-3 obs1524 Breaker_X33_X34 cb_state open)
   (future obs1524)
   (precedes obs1524 obs1518)
   (precedes obs1524 obs1519)
   (precedes obs1524 obs1520)
   (precedes obs1524 obs1521)
   (delay-trip-wait obs1524 obs1514)
   (delay-trip-wait obs1524 obs1511)
   (delay-trip-wait obs1524 obs1515)
   (delay-trip-wait obs1524 obs1510)
   (delay-trip-wait obs1524 obs1516)
   (delay-trip-wait obs1524 obs1513)
   (delay-trip-wait obs1524 obs1512)
   (delay-trip-wait obs1524 obs1517)

   ;; 1309762802 (2011-07-04 07:00:02):
   (matches-3 obs1525 Generator_X36_1 runback reset)
   (future obs1525)
   (precedes obs1525 obs1518)
   (precedes obs1525 obs1519)
   (precedes obs1525 obs1520)
   (precedes obs1525 obs1521)
   (delay-trip-wait obs1525 obs1511)
   (delay-trip-wait obs1525 obs1510)
   (delay-trip-wait obs1525 obs1516)
   (delay-trip-wait obs1525 obs1513)
   (delay-trip-wait obs1525 obs1514)
   (delay-trip-wait obs1525 obs1515)
   (delay-trip-wait obs1525 obs1512)
   (delay-trip-wait obs1525 obs1517)

   ;; 1309762803 (2011-07-04 07:00:03):
   (matches-3 obs1526 Breaker_X21_X22 cb_state open)
   (future obs1526)
   (precedes obs1526 obs1522)
   (precedes obs1526 obs1523)
   (precedes obs1526 obs1524)
   (precedes obs1526 obs1525)
   (delay-trip-wait obs1526 obs1520)
   (delay-trip-wait obs1526 obs1519)
   (delay-trip-wait obs1526 obs1518)
   (delay-trip-wait obs1526 obs1521)

   ;; 1309762803 (2011-07-04 07:00:03):
   (matches-4 obs1527 Bus_X35 limit KV Low)
   (future obs1527)
   (precedes obs1527 obs1522)
   (precedes obs1527 obs1523)
   (precedes obs1527 obs1524)
   (precedes obs1527 obs1525)
   (delay-trip-wait obs1527 obs1520)
   (delay-trip-wait obs1527 obs1519)
   (delay-trip-wait obs1527 obs1518)
   (delay-trip-wait obs1527 obs1521)

   ;; 1309762803 (2011-07-04 07:00:03):
   (matches-3 obs1528 Breaker_X31_X32 cb_state closed)
   (future obs1528)
   (precedes obs1528 obs1522)
   (precedes obs1528 obs1523)
   (precedes obs1528 obs1524)
   (precedes obs1528 obs1525)
   (delay-trip-wait obs1528 obs1520)
   (delay-trip-wait obs1528 obs1519)
   (delay-trip-wait obs1528 obs1518)
   (delay-trip-wait obs1528 obs1521)

   ;; 1309762803 (2011-07-04 07:00:03):
   (matches-4 obs1529 Line_X15_X16 limit KV Low)
   (future obs1529)
   (precedes obs1529 obs1522)
   (precedes obs1529 obs1523)
   (precedes obs1529 obs1524)
   (precedes obs1529 obs1525)
   (delay-trip-wait obs1529 obs1520)
   (delay-trip-wait obs1529 obs1519)
   (delay-trip-wait obs1529 obs1518)
   (delay-trip-wait obs1529 obs1521)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1510)
              (observed obs1511)
              (observed obs1512)
              (observed obs1513)
              (observed obs1514)
              (observed obs1515)
              (observed obs1516)
              (observed obs1517)
              (observed obs1518)
              (observed obs1519)
              (observed obs1520)
              (observed obs1521)
              (observed obs1522)
              (observed obs1523)
              (observed obs1524)
              (observed obs1525)
              (observed obs1526)
              (observed obs1527)
              (observed obs1528)
              (observed obs1529)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.720 (cpu) 1.929 (real)
