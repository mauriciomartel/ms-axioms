(define (domain APPN)
  (:requirements :typing :equality :adl :action-costs)

  (:types
   BREAKER - BRANCH
   DISCONNECTOR - BRANCH
   LINE - BRANCH
   TRANSFORMER - BRANCH
   SERIES_CAP - BRANCH
   BRANCH - COMPONENT
   GENERATOR - COMPONENT
   BUS - COMPONENT
   COMPONENT - OBSERVABLE
   MESSAGE - OBSERVABLE
   LOW_LEVEL - LEVEL
   HIGH_LEVEL - LEVEL
   LEVEL - OBSERVABLE
   OBSERVABLE - OBJECT
   OBSERVATION - OBJECT
   COUNT - OBJECT
   HYPOTHESIS - OBJECT)

  (:constants
   LOW_1 - LOW_LEVEL
   LOW_2 - LOW_LEVEL
   LOW_3 - LOW_LEVEL
   LOW_4 - LOW_LEVEL
   LOW_5 - LOW_LEVEL
   LOW - LOW_LEVEL
   HIGH_1 - HIGH_LEVEL
   HIGH_2 - HIGH_LEVEL
   HIGH_3 - HIGH_LEVEL
   HIGH_4 - HIGH_LEVEL
   HIGH_5 - HIGH_LEVEL
   HIGH - HIGH_LEVEL
   NORMAL - LEVEL
   COMMAND - MESSAGE
   CB_STATE - MESSAGE
   CB_COMMAND_FAIL - MESSAGE
   OPEN - MESSAGE
   CLOSED - MESSAGE
   ABNORMAL - MESSAGE
   NOT_RESPONDING - MESSAGE
   AR_SUPY_CONTROL_STATUS - MESSAGE
   CB_AR_STATUS - MESSAGE
   AUTO - MESSAGE
   NON_AUTO - MESSAGE
   OPEN-UNEXPLAINED - MESSAGE
   CLOSE-UNEXPLAINED - MESSAGE
   AR-STATUS-AUTO-UNEXPLAINED - MESSAGE
   AR-STATUS-NON-AUTO-UNEXPLAINED - MESSAGE
   NOT-RESPONDING - MESSAGE
   SW_STATE - MESSAGE
   LIMIT - MESSAGE
   ENTERED_ZERO_ZONE - MESSAGE
   KV - MESSAGE
   MW - MESSAGE
   MVAR - MESSAGE
   VOLTAGE-LOW-UNEXPLAINED - MESSAGE
   VOLTAGE-HIGH-UNEXPLAINED - MESSAGE
   VOLTAGE-NORMAL-UNEXPLAINED - MESSAGE
   VOLTAGE-ZERO-UNEXPLAINED - MESSAGE
   POWER-LOW-UNEXPLAINED - MESSAGE
   POWER-HIGH-UNEXPLAINED - MESSAGE
   POWER-NORMAL-UNEXPLAINED - MESSAGE
   POWER-ZERO-UNEXPLAINED - MESSAGE
   MVAR-LOW-UNEXPLAINED - MESSAGE
   MVAR-HIGH-UNEXPLAINED - MESSAGE
   MVAR-NORMAL-UNEXPLAINED - MESSAGE
   MVAR-ZERO-UNEXPLAINED - MESSAGE
   LINE-ISO-TRIP - MESSAGE
   RUNBACK - MESSAGE
   UNIT_STATUS - MESSAGE
   ON - MESSAGE
   OFF - MESSAGE
   ALARM - MESSAGE
   RESET - MESSAGE
   SHUTDOWN-UNEXPLAINED - MESSAGE
   STARTUP-UNEXPLAINED - MESSAGE
   RUNBACK-ALARM-UNEXPLAINED - MESSAGE
   RUNBACK-RESET-UNEXPLAINED - MESSAGE)

  (:predicates
   (STATIC-TRUE)
   (LINE-ISOLATORS-2 ?L - LINE ?B1 - BREAKER ?B2 - BREAKER)
   (LINE-ISOLATORS-3 ?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 -
       BREAKER)
   (LINE-ISOLATORS-4 ?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 -
       BREAKER ?B4 - BREAKER)
   (LINE-ISOLATOR ?B - BREAKER ?L - LINE)
   (ADJACENT ?L - LINE ?B - BUS)
   (GENERATOR-ISOLATOR ?BK - BREAKER ?BU - BUS)
   (GENERATOR-ATTACHED-TO ?G - GENERATOR ?B - BUS)
   (CAPACITOR-SWITCH ?B - BREAKER)
   (REACTOR-SWITCH ?B - BREAKER)
   (CAPACITOR-SWITCHED-IN ?O - OBSERVATION)
   (CAPACITOR-SWITCHED-OUT ?O - OBSERVATION)
   (REACTOR-SWITCHED-IN ?O - OBSERVATION)
   (REACTOR-SWITCHED-OUT ?O - OBSERVATION)
   (MATCHES-2 ?O - OBSERVATION ?A1 ?A2 - OBSERVABLE)
   (MATCHES-3 ?O - OBSERVATION ?A1 ?A2 ?A3 - OBSERVABLE)
   (MATCHES-4 ?O - OBSERVATION ?A1 ?A2 ?A3 ?A4 - OBSERVABLE)
   (FUTURE ?O - OBSERVATION)
   (PENDING ?O - OBSERVATION)
   (OBSERVED ?O - OBSERVATION)
   (PRECEDES ?O - OBSERVATION ?O1 - OBSERVATION)
   (DELAY-TRIP-WAIT ?O - OBSERVATION ?O1 - OBSERVATION)
   (DELAY-SHORT-TIME ?O - OBSERVATION ?O1 - OBSERVATION)
   (DELAY-RC-WAIT ?O - OBSERVATION ?O1 - OBSERVATION)
   (FAULT-COUNT-2 ?A1 ?A2 - OBSERVABLE ?C - COUNT)
   (NEXT-COUNT ?C ?NEXT-C - COUNT)
   (HYPOTHESIS-FAULT-COUNT-2 ?H - HYPOTHESIS ?A1 ?A2 - OBSERVABLE ?C -
       COUNT)
   (DOMINATES-2 ?H - HYPOTHESIS ?A1 ?A2 - OBSERVABLE)
   (BREAKER-STATE-IS-UNKNOWN ?B - BREAKER)
   (BREAKER-STATE-IS-OPEN ?B - BREAKER)
   (BREAKER-STATE-IS-CLOSED ?B - BREAKER)
   (BREAKER-COMMANDED-OPEN ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-COMMANDED-CLOSED ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-AR-STATUS-IS-UNKNOWN ?B - BREAKER)
   (BREAKER-AR-STATUS-IS-AUTO ?B - BREAKER)
   (BREAKER-AR-STATUS-IS-NON-AUTO ?B - BREAKER)
   (BREAKER-COMMANDED-AR-AUTO ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-COMMANDED-AR-NON-AUTO ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-AUTO-RECLOSE-WAIT ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-AUTO-REOPEN-WAIT ?B - BREAKER ?O - OBSERVATION)
   (BREAKER-AUTO-RECLOSE-LOCKOUT ?B - BREAKER)
   (DISCONNECTOR-STATE-IS-UNKNOWN ?D - DISCONNECTOR)
   (DISCONNECTOR-STATE-IS-OPEN ?D - DISCONNECTOR)
   (DISCONNECTOR-STATE-IS-CLOSED ?D - DISCONNECTOR)
   (DISCONNECTOR-COMMANDED-OPEN ?D - DISCONNECTOR ?O - OBSERVATION)
   (DISCONNECTOR-COMMANDED-CLOSED ?D - DISCONNECTOR ?O - OBSERVATION)
   (BUS-ISOLATED ?B - BUS)
   (BUS-ISO-STATE-CHANGED ?B - BUS ?O - OBSERVATION)
   (BUS-VOLTAGE-UNKNOWN ?B - BUS)
   (BUS-VOLTAGE-HIGH ?B - BUS)
   (BUS-VOLTAGE-LOW ?B - BUS)
   (BUS-VOLTAGE-NORMAL ?B - BUS)
   (BUS-MW-HIGH ?B - BUS)
   (BUS-MW-LOW ?B - BUS)
   (BUS-MW-NORMAL ?B - BUS)
   (BUS-MVAR-HIGH ?B - BUS)
   (BUS-MVAR-LOW ?B - BUS)
   (BUS-MVAR-NORMAL ?B - BUS)
   (LINE-ISOLATED ?L - LINE)
   (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L - LINE ?O - OBSERVATION)
   (LINE-ISO-STATE-CHANGED ?L - LINE ?O - OBSERVATION)
   (LINE-ISO-TRIP-IN-PROGRESS ?L - LINE ?O - OBSERVATION)
   (LINE-VOLTAGE-UNKNOWN ?L - LINE)
   (LINE-VOLTAGE-HIGH ?L - LINE)
   (LINE-VOLTAGE-LOW ?L - LINE)
   (LINE-VOLTAGE-NORMAL ?L - LINE)
   (LINE-MW-HIGH ?L - LINE)
   (LINE-MW-LOW ?L - LINE)
   (LINE-MW-NORMAL ?L - LINE)
   (LINE-MVAR-HIGH ?L - LINE)
   (LINE-MVAR-LOW ?L - LINE)
   (LINE-MVAR-NORMAL ?L - LINE)
   (GENERATOR-STATUS-IS-UNKNOWN ?G - GENERATOR)
   (GENERATOR-STATUS-IS-ON ?G - GENERATOR)
   (GENERATOR-STATUS-IS-OFF ?G - GENERATOR)
   (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G - GENERATOR)
   (GENERATOR-STATUS-IS-STARTING-UP ?G - GENERATOR)
   (GENERATOR-RUNBACK ?G - GENERATOR))

  (:functions
   (TOTAL-COST))

  (:action BREAKER-INIT-STATE-WAS-OPEN
   :parameters (?B - BREAKER )
   :precondition (AND (BREAKER-STATE-IS-UNKNOWN ?B))
   :effect (AND (NOT (BREAKER-STATE-IS-UNKNOWN ?B))
                (BREAKER-STATE-IS-OPEN ?B))
  )

  (:action BREAKER-INIT-STATE-WAS-CLOSED
   :parameters (?B - BREAKER )
   :precondition (AND (BREAKER-STATE-IS-UNKNOWN ?B))
   :effect (AND (NOT (BREAKER-STATE-IS-UNKNOWN ?B))
                (BREAKER-STATE-IS-CLOSED ?B))
  )

  (:action BREAKER-INIT-AR-STATUS-WAS-AUTO
   :parameters (?B - BREAKER )
   :precondition (AND (BREAKER-AR-STATUS-IS-UNKNOWN ?B))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-UNKNOWN ?B))
                (BREAKER-AR-STATUS-IS-AUTO ?B))
  )

  (:action BREAKER-INIT-AR-STATUS-WAS-NON-AUTO
   :parameters (?B - BREAKER )
   :precondition (AND (BREAKER-AR-STATUS-IS-UNKNOWN ?B))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-UNKNOWN ?B))
                (BREAKER-AR-STATUS-IS-NON-AUTO ?B))
  )

  (:action BREAKER-OPEN-UNEXPLAINED
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (BREAKER-STATE-IS-CLOSED ?B)
                      (MATCHES-3 ?O0 ?B CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-CLOSED ?B))
                (BREAKER-STATE-IS-OPEN ?B)
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-OUT ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-OUT ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-TRIP-UNEXPLAINED
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (BREAKER-STATE-IS-CLOSED ?B)
                      (BREAKER-AR-STATUS-IS-AUTO ?B)
                      (MATCHES-3 ?O0 ?B CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-CLOSED ?B))
                (BREAKER-STATE-IS-OPEN ?B)
                (BREAKER-AUTO-RECLOSE-WAIT ?B ?O0)
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-OUT ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-OUT ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-CLOSE-UNEXPLAINED
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (BREAKER-STATE-IS-OPEN ?B)
                      (MATCHES-3 ?O0 ?B CB_STATE CLOSED) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-OPEN ?B))
                (BREAKER-STATE-IS-CLOSED ?B)
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-IN ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-IN ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-RECLOSE
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-STATE-IS-OPEN ?B)
                      (NOT (BREAKER-AUTO-RECLOSE-LOCKOUT ?B))
                      (BREAKER-AUTO-RECLOSE-WAIT ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_STATE CLOSED) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-OPEN ?B))
                (BREAKER-STATE-IS-CLOSED ?B)
                (BREAKER-AUTO-REOPEN-WAIT ?B ?O0)
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-IN ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-IN ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-REOPEN
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-STATE-IS-CLOSED ?B)
                      (BREAKER-AUTO-REOPEN-WAIT ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-CLOSED ?B))
                (BREAKER-STATE-IS-OPEN ?B)
                (BREAKER-AUTO-RECLOSE-LOCKOUT ?B)
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-OUT ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-OUT ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-OPEN
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B CB_STATE OPEN)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-OPEN ?B ?O0) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-OPEN-ON-COMMAND
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-OPEN ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-CLOSED ?B))
                (NOT (BREAKER-STATE-IS-UNKNOWN ?B))
                (BREAKER-STATE-IS-OPEN ?B)
                (NOT (BREAKER-AUTO-RECLOSE-LOCKOUT ?B))
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-OUT ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-OUT ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-CLOSE
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B CB_STATE CLOSED)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-CLOSED ?B ?O0) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-CLOSE-ON-COMMAND
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-CLOSED ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_STATE CLOSED) (PENDING ?O0))
   :effect (AND (NOT (BREAKER-STATE-IS-OPEN ?B))
                (NOT (BREAKER-STATE-IS-UNKNOWN ?B))
                (BREAKER-STATE-IS-CLOSED ?B)
                (NOT (BREAKER-AUTO-RECLOSE-LOCKOUT ?B))
                (WHEN (CAPACITOR-SWITCH ?B)
                  (CAPACITOR-SWITCHED-IN ?O0))
                (WHEN (REACTOR-SWITCH ?B) (REACTOR-SWITCHED-IN ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-OPEN-FAIL
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-OPEN ?B ?TAG0)
                      (MATCHES-2 ?O0 ?B CB_COMMAND_FAIL) (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-CLOSE-FAIL
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-CLOSED ?B ?TAG0)
                      (MATCHES-2 ?O0 ?B CB_COMMAND_FAIL) (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-AR-AUTO-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B AR_SUPY_CONTROL_STATUS
                          AUTO)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-AR-AUTO ?B ?O0) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-AR-AUTO-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B CB_AR_STATUS AUTO)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-AR-AUTO ?B ?O0) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-AUTO-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-AR-AUTO ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B AR_SUPY_CONTROL_STATUS AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-NON-AUTO ?B))
                (BREAKER-AR-STATUS-IS-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-AUTO-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-AR-AUTO ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_AR_STATUS AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-NON-AUTO ?B))
                (BREAKER-AR-STATUS-IS-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-AUTO-UNEXPLAINED-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B AR_SUPY_CONTROL_STATUS AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-NON-AUTO ?B))
                (BREAKER-AR-STATUS-IS-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-AR-STATUS-AUTO-UNEXPLAINED-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B CB_AR_STATUS AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-NON-AUTO ?B))
                (BREAKER-AR-STATUS-IS-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-COMMAND-AR-NON-AUTO-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B AR_SUPY_CONTROL_STATUS
                          NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-AR-NON-AUTO ?B ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-COMMAND-AR-NON-AUTO-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?B CB_AR_STATUS NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (BREAKER-COMMANDED-AR-NON-AUTO ?B ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-NON-AUTO-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-AR-NON-AUTO ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B AR_SUPY_CONTROL_STATUS
                          NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-AUTO ?B))
                (BREAKER-AR-STATUS-IS-NON-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-NON-AUTO-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BREAKER-COMMANDED-AR-NON-AUTO ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B CB_AR_STATUS NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-AUTO ?B))
                (BREAKER-AR-STATUS-IS-NON-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BREAKER-AR-STATUS-NON-AUTO-UNEXPLAINED-1
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B AR_SUPY_CONTROL_STATUS
                          NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-AUTO ?B))
                (BREAKER-AR-STATUS-IS-NON-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-AR-STATUS-NON-AUTO-UNEXPLAINED-2
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B CB_AR_STATUS NON_AUTO)
                      (PENDING ?O0))
   :effect (AND (NOT (BREAKER-AR-STATUS-IS-AUTO ?B))
                (BREAKER-AR-STATUS-IS-NON-AUTO ?B) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-ABNORMAL
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B CB_STATE ABNORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BREAKER-NOT-RESPONDING
   :parameters (?B - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B CB_STATE NOT_RESPONDING)
                      (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action DISCONNECTOR-INIT-STATE-WAS-OPEN
   :parameters (?D - DISCONNECTOR )
   :precondition (AND (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
                (DISCONNECTOR-STATE-IS-OPEN ?D))
  )

  (:action DISCONNECTOR-INIT-STATE-WAS-CLOSED
   :parameters (?D - DISCONNECTOR )
   :precondition (AND (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
                (DISCONNECTOR-STATE-IS-CLOSED ?D))
  )

  (:action DISCONNECTOR-OPEN-UNEXPLAINED
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION )
   :precondition (AND (DISCONNECTOR-STATE-IS-CLOSED ?D)
                      (MATCHES-3 ?O0 ?D SW_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-CLOSED ?D))
                (DISCONNECTOR-STATE-IS-OPEN ?D) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action DISCONNECTOR-CLOSE-UNEXPLAINED
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION )
   :precondition (AND (DISCONNECTOR-STATE-IS-OPEN ?D)
                      (MATCHES-3 ?O0 ?D SW_STATE CLOSED) (PENDING ?O0))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-OPEN ?D))
                (DISCONNECTOR-STATE-IS-CLOSED ?D) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action DISCONNECTOR-COMMAND-OPEN
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?D SW_STATE OPEN)
                      (PENDING ?O0))
   :effect (AND (DISCONNECTOR-COMMANDED-OPEN ?D ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action DISCONNECTOR-OPEN-ON-COMMAND
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (DISCONNECTOR-COMMANDED-OPEN ?D ?TAG0)
                      (MATCHES-3 ?O0 ?D SW_STATE OPEN) (PENDING ?O0))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-CLOSED ?D))
                (NOT (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
                (DISCONNECTOR-STATE-IS-OPEN ?D) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action DISCONNECTOR-COMMAND-CLOSE
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 COMMAND ?D SW_STATE CLOSED)
                      (PENDING ?O0))
   :effect (AND (DISCONNECTOR-COMMANDED-CLOSED ?D ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action DISCONNECTOR-CLOSE-ON-COMMAND
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (DISCONNECTOR-COMMANDED-CLOSED ?D ?TAG0)
                      (MATCHES-3 ?O0 ?D SW_STATE CLOSED) (PENDING ?O0))
   :effect (AND (NOT (DISCONNECTOR-STATE-IS-OPEN ?D))
                (NOT (DISCONNECTOR-STATE-IS-UNKNOWN ?D))
                (DISCONNECTOR-STATE-IS-CLOSED ?D) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action DISCONNECTOR-NOT-RESPONDING
   :parameters (?D - DISCONNECTOR ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?D SW_STATE NOT_RESPONDING)
                      (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-VOLTAGE-GOES-LOW-UNEXPLAINED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT KV ?LVL)
                      (PENDING ?O0))
   :effect (AND (BUS-VOLTAGE-LOW ?B) (NOT (BUS-VOLTAGE-HIGH ?B))
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-VOLTAGE-GOES-HIGH-UNEXPLAINED
   :parameters (?B - BUS ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT KV ?LVL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-LOW ?B)) (BUS-VOLTAGE-HIGH ?B)
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-LOW ?B)) (NOT (BUS-VOLTAGE-HIGH ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-VOLTAGE-GOES-TO-ZERO-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-LOW ?B)) (NOT (BUS-VOLTAGE-HIGH ?B))
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-VOLTAGE-GOES-LOW-WHEN-ISOLATED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BUS-ISOLATED ?B)
                      (FORALL (?G - GENERATOR)
                              (IMPLY (GENERATOR-ATTACHED-TO ?G ?B)
                                     (GENERATOR-STATUS-IS-OFF ?G)))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (BUS-VOLTAGE-LOW ?B)
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-TO-ZERO-WHEN-ISOLATED
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BUS-ISOLATED ?B)
                      (FORALL (?G - GENERATOR)
                              (IMPLY (GENERATOR-ATTACHED-TO ?G ?B)
                                     (GENERATOR-STATUS-IS-OFF ?G)))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-LOW-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (BUS-VOLTAGE-LOW ?B)
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-HIGH-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?LVL - HIGH_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (BUS-VOLTAGE-HIGH ?B) (NOT (BUS-VOLTAGE-LOW ?B))
                (NOT (BUS-VOLTAGE-NORMAL ?B))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B)) (BUS-VOLTAGE-HIGH ?B)
                      (CAPACITOR-SWITCHED-OUT ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT-2
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B)) (BUS-VOLTAGE-UNKNOWN ?B)
                      (CAPACITOR-SWITCHED-OUT ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B)) (BUS-VOLTAGE-LOW ?B)
                      (CAPACITOR-SWITCHED-IN ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN-2
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B)) (BUS-VOLTAGE-UNKNOWN ?B)
                      (CAPACITOR-SWITCHED-IN ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-VOLTAGE-HIGH ?B)) (NOT (BUS-VOLTAGE-LOW ?B))
                (BUS-VOLTAGE-NORMAL ?B) (NOT (BUS-VOLTAGE-UNKNOWN ?B))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-MW-GOES-LOW-UNEXPLAINED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT MW ?LVL)
                      (PENDING ?O0))
   :effect (AND (BUS-MW-LOW ?B) (NOT (BUS-MW-HIGH ?B))
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MW-GOES-HIGH-UNEXPLAINED
   :parameters (?B - BUS ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT MW ?LVL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-LOW ?B)) (BUS-MW-HIGH ?B)
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MW-GOES-NORMAL-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT MW NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-LOW ?B)) (NOT (BUS-MW-HIGH ?B))
                (BUS-MW-NORMAL ?B) (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MW-GOES-TO-ZERO-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-LOW ?B)) (NOT (BUS-MW-HIGH ?B))
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MW-GOES-LOW-WHEN-ISOLATED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BUS-ISOLATED ?B)
                      (FORALL (?G - GENERATOR)
                              (IMPLY (GENERATOR-ATTACHED-TO ?G ?B)
                                     (GENERATOR-STATUS-IS-OFF ?G)))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-HIGH ?B)) (BUS-MW-LOW ?B)
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-MW-GOES-TO-ZERO-WHEN-ISOLATED
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (BUS-ISOLATED ?B)
                      (FORALL (?G - GENERATOR)
                              (IMPLY (GENERATOR-ATTACHED-TO ?G ?B)
                                     (GENERATOR-STATUS-IS-OFF ?G)))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-3 ?O0 ?B ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-HIGH ?B)) (NOT (BUS-MW-LOW ?B))
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-MW-GOES-LOW-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-HIGH ?B)) (BUS-MW-LOW ?B)
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-MW-GOES-HIGH-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?LVL - HIGH_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (BUS-MW-HIGH ?B) (NOT (BUS-MW-LOW ?B))
                (NOT (BUS-MW-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action BUS-MW-GOES-NORMAL-WHEN-RE-ENERGISED
   :parameters (?B - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (BUS-ISOLATED ?B))
                      (BUS-ISO-STATE-CHANGED ?B ?TAG0)
                      (MATCHES-4 ?O0 ?B LIMIT MW NORMAL) (PENDING ?O0))
   :effect (AND (NOT (BUS-MW-HIGH ?B)) (NOT (BUS-MW-LOW ?B))
                (BUS-MW-NORMAL ?B) (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action BUS-MVAR-GOES-LOW-UNEXPLAINED
   :parameters (?B - BUS ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT MVAR ?LVL)
                      (PENDING ?O0))
   :effect (AND (BUS-MVAR-LOW ?B) (NOT (BUS-MVAR-HIGH ?B))
                (NOT (BUS-MVAR-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MVAR-GOES-HIGH-UNEXPLAINED
   :parameters (?B - BUS ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?B LIMIT MVAR ?LVL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MVAR-LOW ?B)) (BUS-MVAR-HIGH ?B)
                (NOT (BUS-MVAR-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MVAR-GOES-NORMAL-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B LIMIT MVAR NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MVAR-LOW ?B)) (NOT (BUS-MVAR-HIGH ?B))
                (BUS-MVAR-NORMAL ?B) (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action BUS-MVAR-GOES-TO-ZERO-UNEXPLAINED
   :parameters (?B - BUS ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B ENTERED_ZERO_ZONE MVAR)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-MVAR-LOW ?B)) (NOT (BUS-MVAR-HIGH ?B))
                (NOT (BUS-MVAR-NORMAL ?B)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-ISO-TRIP-FIRST-BREAKER-SIMPLE-TRIP-1
   :parameters (?L - LINE ?B - BREAKER ?B-1 - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (LINE-ISOLATOR ?B ?L)
                      (NOT (LINE-ISOLATED ?L))
                      (BREAKER-STATE-IS-CLOSED ?B-1)
                      (BREAKER-AR-STATUS-IS-AUTO ?B-1)
                      (NOT (BREAKER-AUTO-RECLOSE-LOCKOUT ?B-1))
                      (MATCHES-3 ?O0 ?B-1 CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (LINE-ISO-TRIP-IN-PROGRESS ?L ?O0)
                (NOT (BREAKER-STATE-IS-CLOSED ?B-1))
                (BREAKER-STATE-IS-OPEN ?B-1)
                (BREAKER-AUTO-RECLOSE-WAIT ?B-1 ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-ISO-TRIP-FIRST-BREAKER-SIMPLE-TRIP-2
   :parameters (?L - LINE ?B - BREAKER ?B-1 - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (LINE-ISOLATOR ?B ?L)
                      (NOT (LINE-ISOLATED ?L))
                      (BREAKER-STATE-IS-CLOSED ?B-1)
                      (BREAKER-AR-STATUS-IS-NON-AUTO ?B-1)
                      (MATCHES-3 ?O0 ?B-1 CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (LINE-ISO-TRIP-IN-PROGRESS ?L ?O0)
                (NOT (BREAKER-STATE-IS-CLOSED ?B-1))
                (BREAKER-STATE-IS-OPEN ?B-1) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-ISO-TRIP-MORE-BREAKER-SIMPLE-TRIP-1
   :parameters (?L - LINE ?B - BREAKER ?B-1 - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (LINE-ISOLATOR ?B ?L)
                      (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG0)
                      (BREAKER-STATE-IS-CLOSED ?B-1)
                      (BREAKER-AR-STATUS-IS-AUTO ?B-1)
                      (NOT (BREAKER-AUTO-RECLOSE-LOCKOUT ?B-1))
                      (MATCHES-3 ?O0 ?B-1 CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (STATIC-TRUE) (NOT (BREAKER-STATE-IS-CLOSED ?B-1))
                (BREAKER-STATE-IS-OPEN ?B-1)
                (BREAKER-AUTO-RECLOSE-WAIT ?B-1 ?O0)
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-ISO-TRIP-MORE-BREAKER-SIMPLE-TRIP-2
   :parameters (?L - LINE ?B - BREAKER ?B-1 - BREAKER ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (LINE-ISOLATOR ?B ?L)
                      (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG0)
                      (BREAKER-STATE-IS-CLOSED ?B-1)
                      (BREAKER-AR-STATUS-IS-NON-AUTO ?B-1)
                      (MATCHES-3 ?O0 ?B-1 CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (STATIC-TRUE) (NOT (BREAKER-STATE-IS-CLOSED ?B-1))
                (BREAKER-STATE-IS-OPEN ?B-1) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-FINISH-ISO-TRIP-2
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-2 ?L ?B1 ?B2)
                      (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2))
   :effect (AND (NOT (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1) (LINE-ISOLATED ?L))
  )

  (:action LINE-FINISH-ISO-TRIP-3
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3))
   :effect (AND (NOT (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1) (LINE-ISOLATED ?L))
  )

  (:action LINE-FINISH-ISO-TRIP-4
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3)
                      (BREAKER-STATE-IS-OPEN ?B4))
   :effect (AND (NOT (LINE-ISO-TRIP-IN-PROGRESS ?L ?TAG1))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1) (LINE-ISOLATED ?L))
  )

  (:action LINE-SET-STATE-ISOLATED-2
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-2 ?L ?B1 ?B2)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2))
   :effect (AND (LINE-ISOLATED ?L) (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-SET-STATE-ISOLATED-3
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3))
   :effect (AND (LINE-ISOLATED ?L) (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-SET-STATE-ISOLATED-4
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3)
                      (BREAKER-STATE-IS-OPEN ?B4))
   :effect (AND (LINE-ISOLATED ?L) (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-2A
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L) (LINE-ISOLATORS-2 ?L ?B1 ?B2)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B1))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-2B
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L) (LINE-ISOLATORS-2 ?L ?B1 ?B2)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B2))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-3A
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B1))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-3B
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B2))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-3C
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B3))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-4A
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B1))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-4B
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B2))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-4C
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B3))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-RE-ENERGISE-ISOLATED-4D
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER ?TAG1 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?TAG1)
                      (BREAKER-STATE-IS-CLOSED ?B4))
   :effect (AND (NOT (LINE-ISOLATED ?L))
                (LINE-ISO-STATE-CHANGED ?L ?TAG1))
  )

  (:action LINE-INIT-STATE-ISOLATED-2
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER )
   :precondition (AND (LINE-ISOLATORS-2 ?L ?B1 ?B2)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2))
   :effect (AND (LINE-ISOLATED ?L))
  )

  (:action LINE-INIT-STATE-ISOLATED-3
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER )
   :precondition (AND (LINE-ISOLATORS-3 ?L ?B1 ?B2 ?B3)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3))
   :effect (AND (LINE-ISOLATED ?L))
  )

  (:action LINE-INIT-STATE-ISOLATED-4
   :parameters (?L - LINE ?B1 - BREAKER ?B2 - BREAKER ?B3 - BREAKER ?B4 - BREAKER )
   :precondition (AND (LINE-ISOLATORS-4 ?L ?B1 ?B2 ?B3 ?B4)
                      (BREAKER-STATE-IS-OPEN ?B1)
                      (BREAKER-STATE-IS-OPEN ?B2)
                      (BREAKER-STATE-IS-OPEN ?B3)
                      (BREAKER-STATE-IS-OPEN ?B4))
   :effect (AND (LINE-ISOLATED ?L))
  )

  (:action LINE-VOLTAGE-GOES-LOW-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT KV ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-LOW ?L) (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-LOW-UNEXPLAINED-2-BUS-VOLTAGE-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?LVL - LOW_LEVEL ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-LOW ?L) (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (BUS-VOLTAGE-LOW ?B-1)
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-HIGH-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT KV ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-HIGH ?L) (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-HIGH-UNEXPLAINED-2-BUS-VOLTAGE-GOES-HIGH
   :parameters (?L - LINE ?B - BUS ?LVL - HIGH_LEVEL ?B-1 - BUS ?LVL-1 - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-HIGH ?L) (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1)) (BUS-VOLTAGE-HIGH ?B-1)
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-UNEXPLAINED-2-BUS-VOLTAGE-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1)) (BUS-VOLTAGE-NORMAL ?B-1)
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-TO-ZERO-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?L ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-TO-ZERO-UNEXPLAINED-2-BUS-VOLTAGE-GOES-TO-ZERO
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B-1 ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-VOLTAGE-GOES-LOW-WHEN-ISOLATED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L)) (LINE-VOLTAGE-LOW ?L)
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-LOW-WHEN-ISOLATED-2-BUS-VOLTAGE-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L)) (LINE-VOLTAGE-LOW ?L)
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (BUS-VOLTAGE-LOW ?B-1)
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-TO-ZERO-WHEN-ISOLATED-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-3 ?O0 ?L ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-TO-ZERO-WHEN-ISOLATED-2-BUS-VOLTAGE-GOES-TO-ZERO
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B-1 ENTERED_ZERO_ZONE KV)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-LOW-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L)) (LINE-VOLTAGE-LOW ?L)
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-LOW-WHEN-RE-ENERGISED-2-BUS-VOLTAGE-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L)) (LINE-VOLTAGE-LOW ?L)
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (BUS-VOLTAGE-LOW ?B-1)
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-HIGH-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?LVL - HIGH_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV ?LVL) (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-HIGH ?L) (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-HIGH-WHEN-RE-ENERGISED-2-BUS-VOLTAGE-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-VOLTAGE-HIGH ?L) (NOT (LINE-VOLTAGE-LOW ?L))
                (NOT (LINE-VOLTAGE-NORMAL ?L))
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (BUS-VOLTAGE-LOW ?B-1)
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-RE-ENERGISED-2-BUS-VOLTAGE-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (BUS-VOLTAGE-LOW ?B-1)
                (NOT (BUS-VOLTAGE-HIGH ?B-1))
                (NOT (BUS-VOLTAGE-NORMAL ?B-1))
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT-1-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L)) (LINE-VOLTAGE-HIGH ?L)
                      (CAPACITOR-SWITCHED-OUT ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT-1-2
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-VOLTAGE-UNKNOWN ?L)
                      (CAPACITOR-SWITCHED-OUT ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT-2-1-BUS-VOLTAGE-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L)) (LINE-VOLTAGE-HIGH ?L)
                      (CAPACITOR-SWITCHED-OUT ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1)) (BUS-VOLTAGE-NORMAL ?B-1)
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-OUT-2-2-BUS-VOLTAGE-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-VOLTAGE-UNKNOWN ?L)
                      (CAPACITOR-SWITCHED-OUT ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1)) (BUS-VOLTAGE-NORMAL ?B-1)
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN-1-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L)) (LINE-VOLTAGE-LOW ?L)
                      (CAPACITOR-SWITCHED-IN ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN-1-2
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-VOLTAGE-UNKNOWN ?L)
                      (CAPACITOR-SWITCHED-IN ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT KV NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN-2-1-BUS-VOLTAGE-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L)) (LINE-VOLTAGE-LOW ?L)
                      (CAPACITOR-SWITCHED-IN ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1)) (BUS-VOLTAGE-NORMAL ?B-1)
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-VOLTAGE-GOES-NORMAL-WHEN-CAPS-IN-2-2-BUS-VOLTAGE-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-VOLTAGE-UNKNOWN ?L)
                      (CAPACITOR-SWITCHED-IN ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT KV NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-VOLTAGE-HIGH ?L))
                (NOT (LINE-VOLTAGE-LOW ?L)) (LINE-VOLTAGE-NORMAL ?L)
                (NOT (LINE-VOLTAGE-UNKNOWN ?L))
                (NOT (BUS-VOLTAGE-LOW ?B-1))
                (NOT (BUS-VOLTAGE-HIGH ?B-1)) (BUS-VOLTAGE-NORMAL ?B-1)
                (NOT (BUS-VOLTAGE-UNKNOWN ?B-1)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-LOW-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT MW ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-MW-LOW ?L) (NOT (LINE-MW-HIGH ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-LOW-UNEXPLAINED-2-BUS-MW-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?LVL - LOW_LEVEL ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-MW-LOW ?L) (NOT (LINE-MW-HIGH ?L))
                (NOT (LINE-MW-NORMAL ?L)) (BUS-MW-LOW ?B-1)
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-HIGH-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT MW ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-MW-HIGH ?L) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-HIGH-UNEXPLAINED-2-BUS-MW-GOES-HIGH
   :parameters (?L - LINE ?B - BUS ?LVL - HIGH_LEVEL ?B-1 - BUS ?LVL-1 - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-MW-HIGH ?L) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (BUS-MW-LOW ?B-1))
                (BUS-MW-HIGH ?B-1) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-NORMAL-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT MW NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (LINE-MW-NORMAL ?L) (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-NORMAL-UNEXPLAINED-2-BUS-MW-GOES-NORMAL
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (LINE-MW-NORMAL ?L) (NOT (BUS-MW-LOW ?B-1))
                (NOT (BUS-MW-HIGH ?B-1)) (BUS-MW-NORMAL ?B-1)
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-TO-ZERO-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?L ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-TO-ZERO-UNEXPLAINED-2-BUS-MW-GOES-TO-ZERO
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B-1 ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (BUS-MW-LOW ?B-1))
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MW-GOES-LOW-WHEN-ISOLATED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (LINE-MW-LOW ?L)
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-LOW-WHEN-ISOLATED-2-BUS-MW-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (LINE-MW-LOW ?L)
                (NOT (LINE-MW-NORMAL ?L)) (BUS-MW-LOW ?B-1)
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-TO-ZERO-WHEN-ISOLATED-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-3 ?O0 ?L ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-TO-ZERO-WHEN-ISOLATED-2-BUS-MW-GOES-TO-ZERO
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B) (LINE-ISOLATED ?L)
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?B-1 ENTERED_ZERO_ZONE MW)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (BUS-MW-LOW ?B-1))
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-LOW-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (LINE-MW-LOW ?L)
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-LOW-WHEN-RE-ENERGISED-2-BUS-MW-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (LINE-MW-LOW ?L)
                (NOT (LINE-MW-NORMAL ?L)) (BUS-MW-LOW ?B-1)
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-HIGH-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?LVL - HIGH_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT MW ?LVL) (PENDING ?O0))
   :effect (AND (LINE-MW-HIGH ?L) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-HIGH-WHEN-RE-ENERGISED-2-BUS-MW-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (LINE-MW-HIGH ?L) (NOT (LINE-MW-LOW ?L))
                (NOT (LINE-MW-NORMAL ?L)) (BUS-MW-LOW ?B-1)
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-NORMAL-WHEN-RE-ENERGISED-1
   :parameters (?L - LINE ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0)
                      (MATCHES-4 ?O0 ?L LIMIT MW NORMAL) (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (LINE-MW-NORMAL ?L) (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MW-GOES-NORMAL-WHEN-RE-ENERGISED-2-BUS-MW-GOES-LOW
   :parameters (?L - LINE ?B - BUS ?B-1 - BUS ?LVL-1 - LOW_LEVEL ?O0 - OBSERVATION ?TAG0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?B) (ADJACENT ?L ?B)
                      (NOT (LINE-ISOLATED ?L))
                      (LINE-ISO-STATE-CHANGED ?L ?TAG0) (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?B-1 LIMIT MW ?LVL-1)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MW-HIGH ?L)) (NOT (LINE-MW-LOW ?L))
                (LINE-MW-NORMAL ?L) (BUS-MW-LOW ?B-1)
                (NOT (BUS-MW-HIGH ?B-1)) (NOT (BUS-MW-NORMAL ?B-1))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action LINE-MVAR-GOES-LOW-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - LOW_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT MVAR ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-MVAR-LOW ?L) (NOT (LINE-MVAR-HIGH ?L))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MVAR-GOES-HIGH-UNEXPLAINED-1
   :parameters (?L - LINE ?LVL - HIGH_LEVEL ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-4 ?O0 ?L LIMIT MVAR ?LVL)
                      (PENDING ?O0))
   :effect (AND (LINE-MVAR-HIGH ?L) (NOT (LINE-MVAR-LOW ?L))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MVAR-GOES-NORMAL-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-4 ?O0 ?L LIMIT MVAR NORMAL)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MVAR-HIGH ?L)) (NOT (LINE-MVAR-LOW ?L))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action LINE-MVAR-GOES-TO-ZERO-UNEXPLAINED-1
   :parameters (?L - LINE ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE)
                      (MATCHES-3 ?O0 ?L ENTERED_ZERO_ZONE MVAR)
                      (PENDING ?O0))
   :effect (AND (NOT (LINE-MVAR-HIGH ?L)) (NOT (LINE-MVAR-LOW ?L))
                (NOT (PENDING ?O0)) (OBSERVED ?O0)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action GENERATOR-INIT-STATUS-WAS-ON
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-UNKNOWN ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-UNKNOWN ?G))
                (GENERATOR-STATUS-IS-ON ?G))
  )

  (:action GENERATOR-INIT-STATUS-WAS-OFF
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-UNKNOWN ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-UNKNOWN ?G))
                (GENERATOR-STATUS-IS-OFF ?G))
  )

  (:action GENERATOR-BEGIN-SHUTDOWN
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-ON ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-ON ?G))
                (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action GENERATOR-SHUTDOWN-BREAKER-OPEN-BREAKER-OPEN
   :parameters (?G - GENERATOR ?BK - BREAKER ?B - BUS ?B-1 - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?BK) (GENERATOR-ATTACHED-TO ?G ?B)
                      (GENERATOR-ISOLATOR ?BK ?B)
                      (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G)
                      (BREAKER-STATE-IS-CLOSED ?B-1)
                      (MATCHES-3 ?O0 ?B-1 CB_STATE OPEN) (PENDING ?O0))
   :effect (AND (BUS-ISOLATED ?B) (BUS-ISO-STATE-CHANGED ?B ?O0)
                (NOT (BREAKER-STATE-IS-CLOSED ?B-1))
                (BREAKER-STATE-IS-OPEN ?B-1)
                (WHEN (CAPACITOR-SWITCH ?B-1)
                  (CAPACITOR-SWITCHED-OUT ?O0))
                (WHEN (REACTOR-SWITCH ?B-1)
                  (REACTOR-SWITCHED-OUT ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B-1 ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action GENERATOR-SHUTDOWN-TURN-OFF
   :parameters (?G - GENERATOR ?O0 - OBSERVATION )
   :precondition (AND (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G)
                      (MATCHES-3 ?O0 ?G UNIT_STATUS OFF) (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action GENERATOR-SHUTDOWN-COMPLETE
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-SHUTTING-DOWN ?G))
                (GENERATOR-STATUS-IS-OFF ?G))
  )

  (:action GENERATOR-BEGIN-STARTUP
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-OFF ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-ON ?G))
                (GENERATOR-STATUS-IS-STARTING-UP ?G)
                (INCREASE (TOTAL-COST) 1))
  )

  (:action GENERATOR-STARTUP-BREAKER-CLOSE-BREAKER-CLOSE
   :parameters (?G - GENERATOR ?BK - BREAKER ?B - BUS ?B-1 - BREAKER ?O0 - OBSERVATION )
   :precondition (AND (= ?B-1 ?BK) (GENERATOR-ATTACHED-TO ?G ?B)
                      (GENERATOR-ISOLATOR ?BK ?B)
                      (GENERATOR-STATUS-IS-STARTING-UP ?G)
                      (BREAKER-STATE-IS-OPEN ?B-1)
                      (MATCHES-3 ?O0 ?B-1 CB_STATE CLOSED)
                      (PENDING ?O0))
   :effect (AND (NOT (BUS-ISOLATED ?B)) (BUS-ISO-STATE-CHANGED ?B ?O0)
                (NOT (BREAKER-STATE-IS-OPEN ?B-1))
                (BREAKER-STATE-IS-CLOSED ?B-1)
                (WHEN (CAPACITOR-SWITCH ?B-1)
                  (CAPACITOR-SWITCHED-IN ?O0))
                (WHEN (REACTOR-SWITCH ?B-1) (REACTOR-SWITCHED-IN ?O0))
                (FORALL (?QL - LINE)
                        (WHEN (LINE-ISOLATOR ?B-1 ?QL)
                          (LINE-ISO-STATE-MAY-HAVE-CHANGED ?QL ?O0)))
                (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action GENERATOR-STARTUP-TURN-ON
   :parameters (?G - GENERATOR ?O0 - OBSERVATION )
   :precondition (AND (GENERATOR-STATUS-IS-STARTING-UP ?G)
                      (MATCHES-3 ?O0 ?G UNIT_STATUS ON) (PENDING ?O0))
   :effect (AND (NOT (PENDING ?O0)) (OBSERVED ?O0))
  )

  (:action GENERATOR-STARTUP-COMPLETE
   :parameters (?G - GENERATOR )
   :precondition (AND (GENERATOR-STATUS-IS-STARTING-UP ?G))
   :effect (AND (NOT (GENERATOR-STATUS-IS-STARTING-UP ?G))
                (GENERATOR-STATUS-IS-ON ?G))
  )

  (:action GENERATOR-RUNBACK-ALARM
   :parameters (?G - GENERATOR ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-3 ?O0 ?G RUNBACK ALARM)
                      (PENDING ?O0))
   :effect (AND (GENERATOR-RUNBACK ?G) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action GENERATOR-RUNBACK-ALARM-RESET
   :parameters (?G - GENERATOR ?O0 - OBSERVATION )
   :precondition (AND (STATIC-TRUE) (MATCHES-3 ?O0 ?G RUNBACK RESET)
                      (PENDING ?O0))
   :effect (AND (NOT (GENERATOR-RUNBACK ?G)) (NOT (PENDING ?O0))
                (OBSERVED ?O0) (INCREASE (TOTAL-COST) 1))
  )

  (:action GENERATOR-RUNBACK-RESET-WHEN-OFF
   :parameters (?G - GENERATOR ?O0 - OBSERVATION )
   :precondition (AND (GENERATOR-STATUS-IS-OFF ?G)
                      (MATCHES-3 ?O0 ?G RUNBACK RESET) (PENDING ?O0))
   :effect (AND (NOT (GENERATOR-RUNBACK ?G)) (NOT (PENDING ?O0))
                (OBSERVED ?O0))
  )

  (:action ADVANCE-TO-OBS
   :parameters (?O - OBSERVATION )
   :precondition (AND (FORALL (?O1 - OBSERVATION)
                              (IMPLY (PRECEDES ?O ?O1) (OBSERVED ?O1)))
                      (FUTURE ?O)
                      (FORALL (?O1 - OBSERVATION ?L - LINE)
                              (IMPLY (DELAY-TRIP-WAIT ?O ?O1)
                                     (NOT
                                      (LINE-ISO-TRIP-IN-PROGRESS ?L
                                       ?O1)))))
   :effect (AND (NOT (FUTURE ?O)) (PENDING ?O)
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (BREAKER-AUTO-RECLOSE-WAIT ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (BREAKER-COMMANDED-OPEN ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (BREAKER-COMMANDED-CLOSED ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (BREAKER-COMMANDED-AR-AUTO ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (BREAKER-COMMANDED-AR-NON-AUTO ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?D - DISCONNECTOR)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (DISCONNECTOR-COMMANDED-OPEN ?D ?O1))))
                (FORALL (?O1 - OBSERVATION ?D - DISCONNECTOR)
                        (WHEN (DELAY-RC-WAIT ?O ?O1)
                          (NOT (DISCONNECTOR-COMMANDED-OPEN ?D ?O1))))
                (FORALL (?O1 - OBSERVATION ?B - BREAKER)
                        (WHEN (DELAY-TRIP-WAIT ?O ?O1)
                          (NOT (BREAKER-AUTO-REOPEN-WAIT ?B ?O1))))
                (FORALL (?O1 - OBSERVATION ?L - LINE)
                        (WHEN (DELAY-SHORT-TIME ?O ?O1)
                          (NOT (LINE-ISO-STATE-MAY-HAVE-CHANGED ?L ?O1))))
                (FORALL (?O1 - OBSERVATION ?L - LINE)
                        (WHEN (DELAY-SHORT-TIME ?O ?O1)
                          (NOT (LINE-ISO-STATE-CHANGED ?L ?O1))))
                (FORALL (?O1 - OBSERVATION)
                        (WHEN (DELAY-SHORT-TIME ?O ?O1)
                          (NOT (CAPACITOR-SWITCHED-IN ?O1))))
                (FORALL (?O1 - OBSERVATION)
                        (WHEN (DELAY-SHORT-TIME ?O ?O1)
                          (NOT (CAPACITOR-SWITCHED-OUT ?O1)))))
  )
 )
