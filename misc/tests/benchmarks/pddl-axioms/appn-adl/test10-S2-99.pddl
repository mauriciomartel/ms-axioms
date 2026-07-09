;; from 2011-07-05 02:00:00 to 2011-07-05 03:00:00: 20 observations (9 alarms), 21 components
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
   Line_X15_X16 - Line
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Bus_X21 - bus
   Breaker_X22_X23 - Breaker
   Line_X24_X25 - Line
   Breaker_X26_X27 - Breaker
   Breaker_X28_X29 - Breaker
   Bus_X13 - bus
   Bus_X15 - bus
   Bus_X24 - bus
   Bus_X14 - bus
   Bus_X16 - bus
   Bus_X25 - bus
   obs1398 - observation
   obs1399 - observation
   obs1400 - observation
   obs1401 - observation
   obs1402 - observation
   obs1403 - observation
   obs1404 - observation
   obs1405 - observation
   obs1406 - observation
   obs1407 - observation
   obs1408 - observation
   obs1409 - observation
   obs1410 - observation
   obs1411 - observation
   obs1412 - observation
   obs1413 - observation
   obs1414 - observation
   obs1415 - observation
   obs1416 - observation
   obs1417 - observation
   )

  (:init
   (static-true)
   (line-isolators-3 Line_X13_X14 Breaker_X22_X23 Breaker_X11_X12 Breaker_X19_X20)
   (line-isolator Breaker_X22_X23 Line_X13_X14)
   (line-isolator Breaker_X11_X12 Line_X13_X14)
   (line-isolator Breaker_X19_X20 Line_X13_X14)
   (line-isolators-4 Line_X24_X25 Breaker_X9_X10 Breaker_X7_X8 Breaker_X1_X2 Breaker_X3_X4)
   (line-isolator Breaker_X9_X10 Line_X24_X25)
   (line-isolator Breaker_X7_X8 Line_X24_X25)
   (line-isolator Breaker_X1_X2 Line_X24_X25)
   (line-isolator Breaker_X3_X4 Line_X24_X25)
   (line-isolators-4 Line_X15_X16 Breaker_X17_X18 Breaker_X26_X27 Breaker_X28_X29 Breaker_X5_X6)
   (line-isolator Breaker_X17_X18 Line_X15_X16)
   (line-isolator Breaker_X26_X27 Line_X15_X16)
   (line-isolator Breaker_X28_X29 Line_X15_X16)
   (line-isolator Breaker_X5_X6 Line_X15_X16)
   (adjacent Line_X13_X14 Bus_X13)
   (adjacent Line_X13_X14 Bus_X14)
   (adjacent Line_X15_X16 Bus_X15)
   (adjacent Line_X15_X16 Bus_X16)
   (adjacent Line_X24_X25 Bus_X24)
   (adjacent Line_X24_X25 Bus_X25)
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
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X22_X23)
   (breaker-ar-status-is-unknown Breaker_X22_X23)
   (breaker-state-is-unknown Breaker_X26_X27)
   (breaker-ar-status-is-unknown Breaker_X26_X27)
   (breaker-state-is-unknown Breaker_X28_X29)
   (breaker-ar-status-is-unknown Breaker_X28_X29)
   (line-voltage-unknown Line_X13_X14)
   (line-voltage-unknown Line_X15_X16)
   (line-voltage-unknown Line_X24_X25)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X15)
   (bus-voltage-unknown Bus_X14)
   (bus-voltage-unknown Bus_X21)

   ;; 1309831200 (2011-07-05 02:00:00):
   (matches-4 obs1398 command Breaker_X19_X20 cb_state open)
   (pending obs1398)

   ;; 1309831200 (2011-07-05 02:00:00):
   (matches-3 obs1399 Line_X13_X14 entered_zero_zone KV)
   (pending obs1399)

   ;; 1309831228 (2011-07-05 02:00:28):
   (matches-3 obs1400 Breaker_X11_X12 ar_supy_control_status NON_AUTO)
   (future obs1400)
   (precedes obs1400 obs1398)
   (precedes obs1400 obs1399)
   (delay-short-time obs1400 obs1399)
   (delay-trip-wait obs1400 obs1399)
   (delay-short-time obs1400 obs1398)
   (delay-trip-wait obs1400 obs1398)

   ;; 1309831229 (2011-07-05 02:00:29):
   (matches-4 obs1401 command Breaker_X7_X8 ar_supy_control_status NON_AUTO)
   (future obs1401)
   (precedes obs1401 obs1400)

   ;; 1309831229 (2011-07-05 02:00:29):
   (matches-4 obs1402 command Breaker_X9_X10 ar_supy_control_status NON_AUTO)
   (future obs1402)
   (precedes obs1402 obs1400)

   ;; 1309831236 (2011-07-05 02:00:36):
   (matches-3 obs1403 Breaker_X7_X8 ar_supy_control_status NON_AUTO)
   (future obs1403)
   (precedes obs1403 obs1401)
   (precedes obs1403 obs1402)
   (delay-trip-wait obs1403 obs1402)
   (delay-trip-wait obs1403 obs1401)
   (delay-trip-wait obs1403 obs1400)

   ;; 1309831240 (2011-07-05 02:00:40):
   (matches-3 obs1404 Breaker_X9_X10 ar_supy_control_status NON_AUTO)
   (future obs1404)
   (precedes obs1404 obs1403)
   (delay-trip-wait obs1404 obs1403)

   ;; 1309831241 (2011-07-05 02:00:41):
   (matches-4 obs1405 command Breaker_X7_X8 cb_state open)
   (future obs1405)
   (precedes obs1405 obs1404)

   ;; 1309831245 (2011-07-05 02:00:45):
   (matches-4 obs1406 command Breaker_X11_X12 cb_state open)
   (future obs1406)
   (precedes obs1406 obs1405)
   (delay-trip-wait obs1406 obs1405)
   (delay-short-time obs1406 obs1402)
   (delay-short-time obs1406 obs1400)
   (delay-short-time obs1406 obs1401)
   (delay-trip-wait obs1406 obs1404)

   ;; 1309831249 (2011-07-05 02:00:49):
   (matches-3 obs1407 Breaker_X17_X18 cb_state open)
   (future obs1407)
   (precedes obs1407 obs1406)
   (delay-trip-wait obs1407 obs1406)

   ;; 1309831250 (2011-07-05 02:00:50):
   (matches-3 obs1408 Breaker_X3_X4 ar_supy_control_status NON_AUTO)
   (future obs1408)
   (precedes obs1408 obs1407)

   ;; 1309831251 (2011-07-05 02:00:51):
   (matches-3 obs1409 Line_X15_X16 entered_zero_zone KV)
   (future obs1409)
   (precedes obs1409 obs1408)
   (delay-trip-wait obs1409 obs1407)

   ;; 1309831253 (2011-07-05 02:00:53):
   (matches-3 obs1410 Breaker_X11_X12 cb_state open)
   (future obs1410)
   (precedes obs1410 obs1409)
   (delay-trip-wait obs1410 obs1409)
   (delay-trip-wait obs1410 obs1408)
   (delay-short-time obs1410 obs1403)

   ;; 1309831255 (2011-07-05 02:00:55):
   (matches-4 obs1411 command Breaker_X11_X12 ar_supy_control_status NON_AUTO)
   (future obs1411)
   (precedes obs1411 obs1410)
   (delay-trip-wait obs1411 obs1410)

   ;; 1309831255 (2011-07-05 02:00:55):
   (matches-3 obs1412 Breaker_X19_X20 cb_state open)
   (future obs1412)
   (precedes obs1412 obs1410)
   (delay-trip-wait obs1412 obs1410)

   ;; 1309831255 (2011-07-05 02:00:55):
   (matches-4 obs1413 Bus_X21 limit KV Normal)
   (future obs1413)
   (precedes obs1413 obs1410)
   (delay-trip-wait obs1413 obs1410)

   ;; 1309831262 (2011-07-05 02:01:02):
   (matches-4 obs1414 command Breaker_X9_X10 cb_state open)
   (future obs1414)
   (precedes obs1414 obs1411)
   (precedes obs1414 obs1412)
   (precedes obs1414 obs1413)
   (delay-short-time obs1414 obs1405)
   (delay-short-time obs1414 obs1406)
   (delay-trip-wait obs1414 obs1413)
   (delay-trip-wait obs1414 obs1411)
   (delay-trip-wait obs1414 obs1412)
   (delay-short-time obs1414 obs1404)

   ;; 1309831266 (2011-07-05 02:01:06):
   (matches-3 obs1415 Breaker_X5_X6 cb_state closed)
   (future obs1415)
   (precedes obs1415 obs1414)
   (delay-trip-wait obs1415 obs1414)
   (delay-short-time obs1415 obs1408)
   (delay-short-time obs1415 obs1407)

   ;; 1309831270 (2011-07-05 02:01:10):
   (matches-3 obs1416 Breaker_X19_X20 cb_state closed)
   (future obs1416)
   (precedes obs1416 obs1415)
   (delay-short-time obs1416 obs1410)
   (delay-trip-wait obs1416 obs1415)
   (delay-short-time obs1416 obs1409)

   ;; 1309831274 (2011-07-05 02:01:14):
   (matches-4 obs1417 command Breaker_X1_X2 ar_supy_control_status NON_AUTO)
   (future obs1417)
   (precedes obs1417 obs1416)
   (delay-short-time obs1417 obs1412)
   (delay-short-time obs1417 obs1413)
   (delay-short-time obs1417 obs1411)
   (delay-rc-wait obs1417 obs1400)
   (delay-trip-wait obs1417 obs1416)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1398)
              (observed obs1399)
              (observed obs1400)
              (observed obs1401)
              (observed obs1402)
              (observed obs1403)
              (observed obs1404)
              (observed obs1405)
              (observed obs1406)
              (observed obs1407)
              (observed obs1408)
              (observed obs1409)
              (observed obs1410)
              (observed obs1411)
              (observed obs1412)
              (observed obs1413)
              (observed obs1414)
              (observed obs1415)
              (observed obs1416)
              (observed obs1417)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.428 (cpu) 1.455 (real)
