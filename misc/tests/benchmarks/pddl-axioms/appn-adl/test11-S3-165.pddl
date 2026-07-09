;; from 2011-07-07 20:00:00 to 2011-07-07 21:00:00: 20 observations (20 alarms), 26 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X1 - Breaker
   Breaker_X4_X2 - Breaker
   Breaker_X5_X6 - Breaker
   Line_X7_X8 - Line
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Line_X21_X22 - Line
   Bus_X5 - bus
   Bus_X23 - bus
   Bus_X24 - bus
   Bus_X25 - bus
   Generator_X26_1 - generator
   Generator_X16_1 - generator
   Breaker_X27_X28 - Breaker
   Bus_X7 - bus
   Bus_X21 - bus
   Bus_X8 - bus
   Bus_X22 - bus
   Breaker_X29_X26 - Breaker
   Bus_X26 - bus
   Bus_X16 - bus
   obs3048 - observation
   obs3049 - observation
   obs3050 - observation
   obs3051 - observation
   obs3052 - observation
   obs3053 - observation
   obs3054 - observation
   obs3055 - observation
   obs3056 - observation
   obs3057 - observation
   obs3058 - observation
   obs3059 - observation
   obs3060 - observation
   obs3061 - observation
   obs3062 - observation
   obs3063 - observation
   obs3064 - observation
   obs3065 - observation
   obs3066 - observation
   obs3067 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X21_X22 Breaker_X27_X28 Breaker_X13_X14)
   (line-isolator Breaker_X27_X28 Line_X21_X22)
   (line-isolator Breaker_X13_X14 Line_X21_X22)
   (line-isolators-3 Line_X7_X8 Breaker_X9_X10 Breaker_X19_X20 Breaker_X17_X18)
   (line-isolator Breaker_X9_X10 Line_X7_X8)
   (line-isolator Breaker_X19_X20 Line_X7_X8)
   (line-isolator Breaker_X17_X18 Line_X7_X8)
   (adjacent Line_X7_X8 Bus_X7)
   (adjacent Line_X7_X8 Bus_X8)
   (adjacent Line_X21_X22 Bus_X21)
   (adjacent Line_X21_X22 Bus_X22)
   (generator-attached-to Generator_X26_1 Bus_X26)
   (generator-attached-to Generator_X16_1 Bus_X16)
   (generator-isolator Breaker_X29_X26 Bus_X26)
   (generator-isolator Breaker_X15_X16 Bus_X16)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X1)
   (breaker-ar-status-is-unknown Breaker_X3_X1)
   (breaker-state-is-unknown Breaker_X4_X2)
   (breaker-ar-status-is-unknown Breaker_X4_X2)
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
   (breaker-state-is-unknown Breaker_X27_X28)
   (breaker-ar-status-is-unknown Breaker_X27_X28)
   (breaker-state-is-unknown Breaker_X29_X26)
   (breaker-ar-status-is-unknown Breaker_X29_X26)
   (line-voltage-unknown Line_X7_X8)
   (line-voltage-unknown Line_X21_X22)
   (bus-voltage-unknown Bus_X5)
   (bus-voltage-unknown Bus_X23)
   (bus-voltage-unknown Bus_X7)
   (bus-voltage-unknown Bus_X22)
   (bus-voltage-unknown Bus_X24)
   (bus-voltage-unknown Bus_X25)
   (bus-voltage-unknown Bus_X8)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X16)
   (bus-voltage-unknown Bus_X21)
   (generator-status-is-unknown Generator_X26_1)
   (generator-status-is-unknown Generator_X16_1)

   ;; 1310068800 (2011-07-07 20:00:00):
   (matches-3 obs3048 Breaker_X19_X20 cb_state open)
   (pending obs3048)

   ;; 1310068800 (2011-07-07 20:00:00):
   (matches-3 obs3049 Breaker_X17_X18 cb_state open)
   (pending obs3049)

   ;; 1310068800 (2011-07-07 20:00:00):
   (matches-3 obs3050 Breaker_X13_X14 cb_state open)
   (pending obs3050)

   ;; 1310068800 (2011-07-07 20:00:00):
   (matches-3 obs3051 Breaker_X9_X10 cb_state open)
   (pending obs3051)

   ;; 1310068800 (2011-07-07 20:00:00):
   (matches-4 obs3052 Line_X7_X8 limit KV Low)
   (pending obs3052)

   ;; 1310068801 (2011-07-07 20:00:01):
   (matches-4 obs3053 Bus_X5 limit KV Normal)
   (future obs3053)
   (precedes obs3053 obs3048)
   (precedes obs3053 obs3049)
   (precedes obs3053 obs3050)
   (precedes obs3053 obs3051)
   (precedes obs3053 obs3052)

   ;; 1310068801 (2011-07-07 20:00:01):
   (matches-4 obs3054 Bus_X24 limit KV Normal)
   (future obs3054)
   (precedes obs3054 obs3048)
   (precedes obs3054 obs3049)
   (precedes obs3054 obs3050)
   (precedes obs3054 obs3051)
   (precedes obs3054 obs3052)

   ;; 1310068801 (2011-07-07 20:00:01):
   (matches-3 obs3055 Generator_X16_1 unit_status OFF)
   (future obs3055)
   (precedes obs3055 obs3048)
   (precedes obs3055 obs3049)
   (precedes obs3055 obs3050)
   (precedes obs3055 obs3051)
   (precedes obs3055 obs3052)

   ;; 1310068801 (2011-07-07 20:00:01):
   (matches-4 obs3056 Bus_X25 limit KV Normal)
   (future obs3056)
   (precedes obs3056 obs3048)
   (precedes obs3056 obs3049)
   (precedes obs3056 obs3050)
   (precedes obs3056 obs3051)
   (precedes obs3056 obs3052)

   ;; 1310068801 (2011-07-07 20:00:01):
   (matches-3 obs3057 Breaker_X11_X12 cb_state open)
   (future obs3057)
   (precedes obs3057 obs3048)
   (precedes obs3057 obs3049)
   (precedes obs3057 obs3050)
   (precedes obs3057 obs3051)
   (precedes obs3057 obs3052)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3058 Line_X21_X22 entered_zero_zone KV)
   (future obs3058)
   (precedes obs3058 obs3053)
   (precedes obs3058 obs3054)
   (precedes obs3058 obs3055)
   (precedes obs3058 obs3056)
   (precedes obs3058 obs3057)
   (delay-trip-wait obs3058 obs3048)
   (delay-trip-wait obs3058 obs3050)
   (delay-trip-wait obs3058 obs3052)
   (delay-trip-wait obs3058 obs3049)
   (delay-trip-wait obs3058 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3059 Breaker_X5_X6 cb_state open)
   (future obs3059)
   (precedes obs3059 obs3053)
   (precedes obs3059 obs3054)
   (precedes obs3059 obs3055)
   (precedes obs3059 obs3056)
   (precedes obs3059 obs3057)
   (delay-trip-wait obs3059 obs3048)
   (delay-trip-wait obs3059 obs3050)
   (delay-trip-wait obs3059 obs3052)
   (delay-trip-wait obs3059 obs3049)
   (delay-trip-wait obs3059 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3060 Breaker_X4_X2 cb_state open)
   (future obs3060)
   (precedes obs3060 obs3053)
   (precedes obs3060 obs3054)
   (precedes obs3060 obs3055)
   (precedes obs3060 obs3056)
   (precedes obs3060 obs3057)
   (delay-trip-wait obs3060 obs3048)
   (delay-trip-wait obs3060 obs3050)
   (delay-trip-wait obs3060 obs3052)
   (delay-trip-wait obs3060 obs3049)
   (delay-trip-wait obs3060 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3061 Generator_X16_1 runback alarm)
   (future obs3061)
   (precedes obs3061 obs3053)
   (precedes obs3061 obs3054)
   (precedes obs3061 obs3055)
   (precedes obs3061 obs3056)
   (precedes obs3061 obs3057)
   (delay-trip-wait obs3061 obs3048)
   (delay-trip-wait obs3061 obs3050)
   (delay-trip-wait obs3061 obs3052)
   (delay-trip-wait obs3061 obs3049)
   (delay-trip-wait obs3061 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3062 Breaker_X17_X18 cb_state closed)
   (future obs3062)
   (precedes obs3062 obs3053)
   (precedes obs3062 obs3054)
   (precedes obs3062 obs3055)
   (precedes obs3062 obs3056)
   (precedes obs3062 obs3057)
   (delay-trip-wait obs3062 obs3048)
   (delay-trip-wait obs3062 obs3050)
   (delay-trip-wait obs3062 obs3052)
   (delay-trip-wait obs3062 obs3049)
   (delay-trip-wait obs3062 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3063 Breaker_X1_X2 cb_state open)
   (future obs3063)
   (precedes obs3063 obs3053)
   (precedes obs3063 obs3054)
   (precedes obs3063 obs3055)
   (precedes obs3063 obs3056)
   (precedes obs3063 obs3057)
   (delay-trip-wait obs3063 obs3048)
   (delay-trip-wait obs3063 obs3050)
   (delay-trip-wait obs3063 obs3052)
   (delay-trip-wait obs3063 obs3049)
   (delay-trip-wait obs3063 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3064 Breaker_X3_X1 cb_state open)
   (future obs3064)
   (precedes obs3064 obs3053)
   (precedes obs3064 obs3054)
   (precedes obs3064 obs3055)
   (precedes obs3064 obs3056)
   (precedes obs3064 obs3057)
   (delay-trip-wait obs3064 obs3048)
   (delay-trip-wait obs3064 obs3052)
   (delay-trip-wait obs3064 obs3049)
   (delay-trip-wait obs3064 obs3050)
   (delay-trip-wait obs3064 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3065 Breaker_X15_X16 cb_state open)
   (future obs3065)
   (precedes obs3065 obs3053)
   (precedes obs3065 obs3054)
   (precedes obs3065 obs3055)
   (precedes obs3065 obs3056)
   (precedes obs3065 obs3057)
   (delay-trip-wait obs3065 obs3048)
   (delay-trip-wait obs3065 obs3052)
   (delay-trip-wait obs3065 obs3049)
   (delay-trip-wait obs3065 obs3050)
   (delay-trip-wait obs3065 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-4 obs3066 Bus_X23 limit KV Low)
   (future obs3066)
   (precedes obs3066 obs3053)
   (precedes obs3066 obs3054)
   (precedes obs3066 obs3055)
   (precedes obs3066 obs3056)
   (precedes obs3066 obs3057)
   (delay-trip-wait obs3066 obs3048)
   (delay-trip-wait obs3066 obs3052)
   (delay-trip-wait obs3066 obs3049)
   (delay-trip-wait obs3066 obs3050)
   (delay-trip-wait obs3066 obs3051)

   ;; 1310068802 (2011-07-07 20:00:02):
   (matches-3 obs3067 Generator_X26_1 runback alarm)
   (future obs3067)
   (precedes obs3067 obs3053)
   (precedes obs3067 obs3054)
   (precedes obs3067 obs3055)
   (precedes obs3067 obs3056)
   (precedes obs3067 obs3057)
   (delay-trip-wait obs3067 obs3048)
   (delay-trip-wait obs3067 obs3052)
   (delay-trip-wait obs3067 obs3049)
   (delay-trip-wait obs3067 obs3050)
   (delay-trip-wait obs3067 obs3051)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs3048)
              (observed obs3049)
              (observed obs3050)
              (observed obs3051)
              (observed obs3052)
              (observed obs3053)
              (observed obs3054)
              (observed obs3055)
              (observed obs3056)
              (observed obs3057)
              (observed obs3058)
              (observed obs3059)
              (observed obs3060)
              (observed obs3061)
              (observed obs3062)
              (observed obs3063)
              (observed obs3064)
              (observed obs3065)
              (observed obs3066)
              (observed obs3067)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.652 (cpu) 1.748 (real)
