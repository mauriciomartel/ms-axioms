(define (domain GRID)
     (:requirements :typing :negative-preconditions)
     (:types
          SIDE - OBJECT
          CELL - OBJECT
     )
     (:constants
          RIGHT - SIDE
          LEFT - SIDE
          DOWN - SIDE
          UP - SIDE
     )
     (:predicates
          (DISPENSER ?C - CELL)
          (PROC ?C - CELL)
          (BUSY ?P - CELL)
          (NEWJOB ?C - CELL)
          (AVAILABLE ?C - CELL)
          (BAR-NEIGHS ?C - CELL)
          (REQUEST ?C - CELL ?DIR - SIDE)
          (ACCEPT ?C - CELL ?DIR - SIDE)
          (REJECT ?C - CELL ?DIR - SIDE)
          (SENDING ?C - CELL ?DIR - SIDE)
          (RECD ?C - CELL ?DIR - SIDE)
          (THRESHOLD-EXCEED ?C - CELL)
          (THRESHOLD-REACH ?C - CELL)
          (NEIGHBOUR ?DIR - SIDE ?C1 - CELL ?C2 - CELL)
          (JOB0)
          (JOB1)
          (JOB2)
          (JOB3)
          (JOB4)
          (JOB5)
          (JOB6)
          (JOB7)
          (JOB8)
          (JOB9)
          (JOB10)
          (JOB11)
          (JOB12)
          (JOB13)
          (JOB14)
          (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C - CELL)
          (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-LOST-REQUEST ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-FINISH-RECD ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-MARK-SENT ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-RECV ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-SEND ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (DISABLED-CONTROL-REJECT-PARENT-UP ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (DISABLED-CONTROL-REJECT-NON-PARENT ?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-ACCEPT-PASSON ?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
          (DISABLED-CONTROL-ACCEPT ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P - CELL ?N1 - CELL)
          (DISABLED-CONTROL-REQUEST-PASSON-UP ?P - CELL ?N1 - CELL)
          (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P - CELL ?N1 - CELL)
          (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P - CELL ?N1 - CELL)
          (DISABLED-CONTROL-MARK-AVAILABLE ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
          (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C - CELL)
          (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C - CELL)
          (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C - CELL ?N - CELL ?S - SIDE)
          (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C - CELL)
          (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C - CELL)
          (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C - CELL)
          (DISABLED-CONTROL-UNMARK-EXCEED ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
          (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
     )
     (:derived
          (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEWJOB ?C))
               (not
                    (AVAILABLE ?C))
               (RECD ?C LEFT))
     )
     (:derived
          (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (ACCEPT ?P ?S1))
               (REQUEST ?N1 ?S1OP)
               (NEWJOB ?P))
     )
     (:derived
          (DISABLED-CONTROL-LOST-REQUEST ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (REQUEST ?P ?S1OP))
               (REQUEST ?P ?S1)
               (REQUEST ?N1 ?S1OP)
               (NEWJOB ?P))
     )
     (:derived
          (DISABLED-CONTROL-FINISH-RECD ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (RECD ?P ?S1))
               (SENDING ?N1 ?S1OP))
     )
     (:derived
          (DISABLED-CONTROL-MARK-SENT ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?N1))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (SENDING ?P ?S1))
               (not
                    (RECD ?N1 ?S1OP)))
     )
     (:derived
          (DISABLED-CONTROL-RECV ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (SENDING ?N1 ?S1OP))
               (RECD ?P ?S1)
               (NEWJOB ?P))
     )
     (:derived
          (DISABLED-CONTROL-SEND ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (REQUEST ?P ?S1))
               (not
                    (ACCEPT ?N1 ?S1OP))
               (not
                    (NEWJOB ?P))
               (AVAILABLE ?P)
               (SENDING ?P LEFT)
               (SENDING ?P RIGHT)
               (SENDING ?P UP)
               (SENDING ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR LEFT ?N1 ?C))
               (not
                    (NEIGHBOUR RIGHT ?N2 ?C))
               (not
                    (NEIGHBOUR UP ?N3 ?C))
               (not
                    (REQUEST ?C LEFT))
               (not
                    (REQUEST ?C RIGHT))
               (not
                    (REQUEST ?C UP))
               (not
                    (REJECT ?N1 RIGHT))
               (not
                    (REJECT ?N2 LEFT))
               (not
                    (REJECT ?N3 DOWN))
               (REJECT ?C DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REJECT-PARENT-UP ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR LEFT ?N1 ?C))
               (not
                    (NEIGHBOUR RIGHT ?N2 ?C))
               (not
                    (NEIGHBOUR DOWN ?N3 ?C))
               (not
                    (REQUEST ?C LEFT))
               (not
                    (REQUEST ?C RIGHT))
               (not
                    (REQUEST ?C DOWN))
               (not
                    (REJECT ?N1 RIGHT))
               (not
                    (REJECT ?N2 LEFT))
               (not
                    (REJECT ?N3 UP))
               (REJECT ?C UP))
     )
     (:derived
          (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR UP ?N1 ?C))
               (not
                    (NEIGHBOUR DOWN ?N2 ?C))
               (not
                    (NEIGHBOUR LEFT ?N3 ?C))
               (not
                    (REQUEST ?C UP))
               (not
                    (REQUEST ?C DOWN))
               (not
                    (REQUEST ?C LEFT))
               (not
                    (REJECT ?N1 DOWN))
               (not
                    (REJECT ?N2 UP))
               (not
                    (REJECT ?N3 RIGHT))
               (REJECT ?C RIGHT))
     )
     (:derived
          (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR UP ?N1 ?C))
               (not
                    (NEIGHBOUR DOWN ?N2 ?C))
               (not
                    (NEIGHBOUR RIGHT ?N3 ?C))
               (not
                    (REQUEST ?C UP))
               (not
                    (REQUEST ?C DOWN))
               (not
                    (REQUEST ?C RIGHT))
               (not
                    (REJECT ?N1 DOWN))
               (not
                    (REJECT ?N2 UP))
               (not
                    (REJECT ?N3 LEFT))
               (REJECT ?C LEFT))
     )
     (:derived
          (DISABLED-CONTROL-REJECT-NON-PARENT ?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR ?S1 ?N2 ?C))
               (not
                    (NEIGHBOUR ?S1OP ?C ?N2))
               (not
                    (REQUEST ?C ?S1))
               (not
                    (REQUEST ?N2 ?S1OP))
               (REJECT ?C ?S1))
     )
     (:derived
          (DISABLED-CONTROL-ACCEPT-PASSON ?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR ?S1 ?N2 ?C))
               (not
                    (NEIGHBOUR ?S1OP ?C ?N2))
               (not
                    (REQUEST ?C ?S1))
               (not
                    (ACCEPT ?N2 ?S1OP))
               (REQUEST ?C ?SPARENT)
               (ACCEPT ?C LEFT)
               (ACCEPT ?C RIGHT)
               (ACCEPT ?C UP)
               (ACCEPT ?C DOWN))
     )
     (:derived
          (DISABLED-CONTROL-ACCEPT ?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          (OR
               (not
                    (PROC ?P))
               (not
                    (AVAILABLE ?P))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?P))
               (not
                    (NEIGHBOUR ?S1OP ?P ?N1))
               (not
                    (REQUEST ?N1 ?S1OP))
               (ACCEPT ?P LEFT)
               (ACCEPT ?P RIGHT)
               (ACCEPT ?P UP)
               (ACCEPT ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P - CELL ?N1 - CELL)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR DOWN ?N1 ?P))
               (not
                    (REQUEST ?N1 UP))
               (AVAILABLE ?P)
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REQUEST-PASSON-UP ?P - CELL ?N1 - CELL)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR UP ?N1 ?P))
               (not
                    (REQUEST ?N1 DOWN))
               (AVAILABLE ?P)
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P - CELL ?N1 - CELL)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR RIGHT ?N1 ?P))
               (not
                    (REQUEST ?N1 LEFT))
               (AVAILABLE ?P)
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P - CELL ?N1 - CELL)
          (OR
               (not
                    (PROC ?P))
               (not
                    (NEIGHBOUR LEFT ?N1 ?P))
               (not
                    (REQUEST ?N1 RIGHT))
               (AVAILABLE ?P)
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:derived
          (DISABLED-CONTROL-MARK-AVAILABLE ?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR LEFT ?N1 ?C))
               (not
                    (NEIGHBOUR UP ?N2 ?C))
               (not
                    (NEIGHBOUR RIGHT ?N3 ?C))
               (not
                    (NEIGHBOUR DOWN ?N4 ?C))
               (BUSY ?C)
               (BAR-NEIGHS ?N1)
               (BAR-NEIGHS ?N2)
               (BAR-NEIGHS ?N3)
               (BAR-NEIGHS ?N4)
               (THRESHOLD-EXCEED ?C)
               (AVAILABLE ?C))
     )
     (:derived
          (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C - CELL)
          (OR
               (not
                    (BAR-NEIGHS ?C))
               (THRESHOLD-REACH ?C))
     )
     (:derived
          (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C - CELL)
          (OR
               (not
                    (BAR-NEIGHS ?C))
               (BUSY ?C))
     )
     (:derived
          (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C - CELL ?N - CELL ?S - SIDE)
          (OR
               (not
                    (NEIGHBOUR ?S ?C ?N))
               (not
                    (BAR-NEIGHS ?N))
               (not
                    (AVAILABLE ?C)))
     )
     (:derived
          (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C - CELL)
          (OR
               (not
                    (BUSY ?C))
               (not
                    (THRESHOLD-REACH ?C))
               (BAR-NEIGHS ?C))
     )
     (:derived
          (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C - CELL)
          (OR
               (not
                    (THRESHOLD-EXCEED ?C))
               (not
                    (AVAILABLE ?C)))
     )
     (:derived
          (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C - CELL)
          (OR
               (not
                    (BUSY ?C))
               (not
                    (AVAILABLE ?C)))
     )
     (:derived
          (DISABLED-CONTROL-UNMARK-EXCEED ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?C))
               (not
                    (NEIGHBOUR ?S2 ?N2 ?C))
               (not
                    (THRESHOLD-EXCEED ?C))
               (BUSY ?N1)
               (BUSY ?N2)
               (= ?N1 ?N2))
     )
     (:derived
          (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (PROC ?N1))
               (not
                    (PROC ?N2))
               (not
                    (PROC ?N3))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?C))
               (not
                    (NEIGHBOUR ?S2 ?N2 ?C))
               (not
                    (NEIGHBOUR ?S3 ?N3 ?C))
               (not
                    (BUSY ?N1))
               (not
                    (BUSY ?N2))
               (not
                    (BUSY ?N3))
               (= ?N1 ?N2)
               (= ?N2 ?N3)
               (= ?N3 ?N1)
               (THRESHOLD-EXCEED ?C))
     )
     (:derived
          (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?C))
               (not
                    (NEIGHBOUR ?S2 ?N2 ?C))
               (not
                    (NEIGHBOUR ?S3 ?N3 ?C))
               (not
                    (THRESHOLD-REACH ?C))
               (BUSY ?N1)
               (BUSY ?N2)
               (BUSY ?N3)
               (= ?N1 ?N2)
               (= ?N2 ?N3)
               (= ?N3 ?N1))
     )
     (:derived
          (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
          (OR
               (not
                    (PROC ?C))
               (not
                    (PROC ?N1))
               (not
                    (PROC ?N2))
               (not
                    (NEIGHBOUR ?S1 ?N1 ?C))
               (not
                    (NEIGHBOUR ?S2 ?N2 ?C))
               (not
                    (BUSY ?N1))
               (not
                    (BUSY ?N2))
               (= ?N1 ?N2)
               (THRESHOLD-REACH ?C))
     )
     (:ACTION ENV-FINISH-NEWJOB-0
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB1))
               (JOB0)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB0))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-1
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB2))
               (JOB1)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB1))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-2
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB3))
               (JOB2)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB2))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-3
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB4))
               (JOB3)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB3))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-4
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB5))
               (JOB4)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB4))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-5
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB6))
               (JOB5)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB5))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-6
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB7))
               (JOB6)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB6))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-7
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB8))
               (JOB7)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB7))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-8
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB9))
               (JOB8)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB8))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-9
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB10))
               (JOB9)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB9))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-10
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB11))
               (JOB10)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB10))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-11
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB12))
               (JOB11)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB11))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-12
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB13))
               (JOB12)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB12))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-NEWJOB-13
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (JOB14))
               (JOB13)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB13))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-FINISH-JOB-14
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (JOB14)
               (BUSY ?C)
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (not
                    (JOB14))
               (not
                    (BUSY ?C)))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-15
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB13)
               (not
                    (JOB14))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB14)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-14
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB12)
               (not
                    (JOB13))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB13)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-13
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB11)
               (not
                    (JOB12))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB12)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-12
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB10)
               (not
                    (JOB11))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB11)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-11
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB9)
               (not
                    (JOB10))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB10)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-10
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB8)
               (not
                    (JOB9))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB9)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-9
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB7)
               (not
                    (JOB8))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB8)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-8
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB6)
               (not
                    (JOB7))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB7)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-7
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB5)
               (not
                    (JOB6))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB6)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-6
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB4)
               (not
                    (JOB5))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB5)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-5
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB3)
               (not
                    (JOB4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB4)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-4
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB2)
               (not
                    (JOB3))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB3)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-3
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB1)
               (not
                    (JOB2))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB2)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-2
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (JOB0)
               (not
                    (JOB1))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB1)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION ENV-CREATE-NEWJOB-DISPENSER-1
          :PARAMETERS
          (?D - CELL ?N1 - CELL ?S1 - SIDE)
          :PRECONDITION
          (AND
               (DISPENSER ?D)
               (NEIGHBOUR ?S1 ?N1 ?D)
               (not
                    (NEWJOB ?D))
               (not
                    (JOB0))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-NEWJOB-GET-BUSY ?C))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-ACCEPTED-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-LOST-REQUEST ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-FINISH-RECD ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-MARK-SENT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-RECV ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-SEND ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-DOWN ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-UP ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-RIGHT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
                    (DISABLED-CONTROL-REJECT-PARENT-LEFT ?C ?N1 ?N2 ?N3))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-REJECT-NON-PARENT ?C ?N2 ?S1 ?S1OP))
               (FORALL
                    (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
                    (DISABLED-CONTROL-ACCEPT-PASSON ?C ?N2 ?S1 ?S1OP ?SPARENT))
               (FORALL
                    (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
                    (DISABLED-CONTROL-ACCEPT ?P ?N1 ?S1 ?S1OP))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-DOWN ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-UP ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-RIGHT ?P ?N1))
               (FORALL
                    (?P - CELL ?N1 - CELL)
                    (DISABLED-CONTROL-REQUEST-PASSON-LEFT ?P ?N1))
               (FORALL
                    (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
                    (DISABLED-CONTROL-MARK-AVAILABLE ?C ?N1 ?N2 ?N3 ?N4))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-UNBAR-NEIGHS-not-BUSY ?C))
               (FORALL
                    (?C - CELL ?N - CELL ?S - SIDE)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED ?C ?N ?S))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-BAR-NEIGHS-AVAIL ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED ?C))
               (FORALL
                    (?C - CELL)
                    (DISABLED-CONTROL-MARK-UNAVAILABLE-BUSY ?C))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-UNMARK-EXCEED ?C ?N1 ?S1 ?N2 ?S2))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-EXCEED ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
                    (DISABLED-CONTROL-UNMARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2 ?N3 ?S3))
               (FORALL
                    (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
                    (DISABLED-CONTROL-MARK-THRESHOLD-REACH ?C ?N1 ?S1 ?N2 ?S2)))
          :EFFECT
          (AND
               (JOB0)
               (REQUEST ?D ?S1)
               (NEWJOB ?D))
     )
     (:ACTION CONTROL-NEWJOB-GET-BUSY
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEWJOB ?C)
               (not
                    (RECD ?C LEFT))
               (AVAILABLE ?C))
          :EFFECT
          (AND
               (not
                    (NEWJOB ?C))
               (BUSY ?C))
     )
     (:ACTION CONTROL-LOST-ACCEPTED-REQUEST
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?P)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (ACCEPT ?P ?S1)
               (not
                    (REQUEST ?N1 ?S1OP))
               (not
                    (NEWJOB ?P)))
          :EFFECT
          (AND
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN))
               (not
                    (ACCEPT ?P LEFT))
               (not
                    (ACCEPT ?P RIGHT))
               (not
                    (ACCEPT ?P UP))
               (not
                    (ACCEPT ?P DOWN))
               (not
                    (REJECT ?P LEFT))
               (not
                    (REJECT ?P RIGHT))
               (not
                    (REJECT ?P UP))
               (not
                    (REJECT ?P DOWN)))
     )
     (:ACTION CONTROL-LOST-REQUEST
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?P)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (REQUEST ?P ?S1OP)
               (not
                    (REQUEST ?P ?S1))
               (not
                    (REQUEST ?N1 ?S1OP))
               (not
                    (NEWJOB ?P)))
          :EFFECT
          (AND
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN))
               (not
                    (ACCEPT ?P LEFT))
               (not
                    (ACCEPT ?P RIGHT))
               (not
                    (ACCEPT ?P UP))
               (not
                    (ACCEPT ?P DOWN))
               (not
                    (REJECT ?P LEFT))
               (not
                    (REJECT ?P RIGHT))
               (not
                    (REJECT ?P UP))
               (not
                    (REJECT ?P DOWN)))
     )
     (:ACTION CONTROL-FINISH-RECD
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?P)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (not
                    (SENDING ?N1 ?S1OP))
               (RECD ?P ?S1))
          :EFFECT
          (AND
               (not
                    (RECD ?P ?S1)))
     )
     (:ACTION CONTROL-MARK-SENT
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?N1)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (SENDING ?P ?S1)
               (RECD ?N1 ?S1OP))
          :EFFECT
          (AND
               (not
                    (NEWJOB ?P))
               (not
                    (SENDING ?P ?S1))
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN))
               (not
                    (ACCEPT ?P LEFT))
               (not
                    (ACCEPT ?P RIGHT))
               (not
                    (ACCEPT ?P UP))
               (not
                    (ACCEPT ?P DOWN))
               (not
                    (REJECT ?P LEFT))
               (not
                    (REJECT ?P RIGHT))
               (not
                    (REJECT ?P UP))
               (not
                    (REJECT ?P DOWN)))
     )
     (:ACTION CONTROL-RECV
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?P)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (SENDING ?N1 ?S1OP)
               (not
                    (RECD ?P ?S1))
               (not
                    (NEWJOB ?P)))
          :EFFECT
          (AND
               (NEWJOB ?P)
               (RECD ?P ?S1))
     )
     (:ACTION CONTROL-SEND
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (REQUEST ?P ?S1)
               (ACCEPT ?N1 ?S1OP)
               (NEWJOB ?P)
               (not
                    (AVAILABLE ?P))
               (not
                    (SENDING ?P LEFT))
               (not
                    (SENDING ?P RIGHT))
               (not
                    (SENDING ?P UP))
               (not
                    (SENDING ?P DOWN)))
          :EFFECT
          (AND
               (SENDING ?P ?S1))
     )
     (:ACTION CONTROL-REJECT-PARENT-DOWN
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR LEFT ?N1 ?C)
               (NEIGHBOUR RIGHT ?N2 ?C)
               (NEIGHBOUR UP ?N3 ?C)
               (REQUEST ?C LEFT)
               (REQUEST ?C RIGHT)
               (REQUEST ?C UP)
               (REJECT ?N1 RIGHT)
               (REJECT ?N2 LEFT)
               (REJECT ?N3 DOWN)
               (not
                    (REJECT ?C DOWN)))
          :EFFECT
          (AND
               (REJECT ?C DOWN))
     )
     (:ACTION CONTROL-REJECT-PARENT-UP
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR LEFT ?N1 ?C)
               (NEIGHBOUR RIGHT ?N2 ?C)
               (NEIGHBOUR DOWN ?N3 ?C)
               (REQUEST ?C LEFT)
               (REQUEST ?C RIGHT)
               (REQUEST ?C DOWN)
               (REJECT ?N1 RIGHT)
               (REJECT ?N2 LEFT)
               (REJECT ?N3 UP)
               (not
                    (REJECT ?C UP)))
          :EFFECT
          (AND
               (REJECT ?C UP))
     )
     (:ACTION CONTROL-REJECT-PARENT-RIGHT
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR UP ?N1 ?C)
               (NEIGHBOUR DOWN ?N2 ?C)
               (NEIGHBOUR LEFT ?N3 ?C)
               (REQUEST ?C UP)
               (REQUEST ?C DOWN)
               (REQUEST ?C LEFT)
               (REJECT ?N1 DOWN)
               (REJECT ?N2 UP)
               (REJECT ?N3 RIGHT)
               (not
                    (REJECT ?C RIGHT)))
          :EFFECT
          (AND
               (REJECT ?C RIGHT))
     )
     (:ACTION CONTROL-REJECT-PARENT-LEFT
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR UP ?N1 ?C)
               (NEIGHBOUR DOWN ?N2 ?C)
               (NEIGHBOUR RIGHT ?N3 ?C)
               (REQUEST ?C UP)
               (REQUEST ?C DOWN)
               (REQUEST ?C RIGHT)
               (REJECT ?N1 DOWN)
               (REJECT ?N2 UP)
               (REJECT ?N3 LEFT)
               (not
                    (REJECT ?C LEFT)))
          :EFFECT
          (AND
               (REJECT ?C LEFT))
     )
     (:ACTION CONTROL-REJECT-NON-PARENT
          :PARAMETERS
          (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR ?S1 ?N2 ?C)
               (NEIGHBOUR ?S1OP ?C ?N2)
               (REQUEST ?C ?S1)
               (REQUEST ?N2 ?S1OP)
               (not
                    (REJECT ?C ?S1)))
          :EFFECT
          (AND
               (REJECT ?C ?S1))
     )
     (:ACTION CONTROL-ACCEPT-PASSON
          :PARAMETERS
          (?C - CELL ?N2 - CELL ?S1 - SIDE ?S1OP - SIDE ?SPARENT - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR ?S1 ?N2 ?C)
               (NEIGHBOUR ?S1OP ?C ?N2)
               (REQUEST ?C ?S1)
               (ACCEPT ?N2 ?S1OP)
               (not
                    (REQUEST ?C ?SPARENT))
               (not
                    (ACCEPT ?C LEFT))
               (not
                    (ACCEPT ?C RIGHT))
               (not
                    (ACCEPT ?C UP))
               (not
                    (ACCEPT ?C DOWN)))
          :EFFECT
          (AND
               (ACCEPT ?C ?SPARENT))
     )
     (:ACTION CONTROL-ACCEPT
          :PARAMETERS
          (?P - CELL ?N1 - CELL ?S1 - SIDE ?S1OP - SIDE)
          :PRECONDITION
          (AND
               (PROC ?P)
               (AVAILABLE ?P)
               (NEIGHBOUR ?S1 ?N1 ?P)
               (NEIGHBOUR ?S1OP ?P ?N1)
               (REQUEST ?N1 ?S1OP)
               (not
                    (ACCEPT ?P LEFT))
               (not
                    (ACCEPT ?P RIGHT))
               (not
                    (ACCEPT ?P UP))
               (not
                    (ACCEPT ?P DOWN)))
          :EFFECT
          (AND
               (ACCEPT ?P ?S1))
     )
     (:ACTION CONTROL-REQUEST-PASSON-DOWN
          :PARAMETERS
          (?P - CELL ?N1 - CELL)
          :PRECONDITION
          (AND
               (PROC ?P)
               (not
                    (AVAILABLE ?P))
               (NEIGHBOUR DOWN ?N1 ?P)
               (REQUEST ?N1 UP)
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN)))
          :EFFECT
          (AND
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP))
     )
     (:ACTION CONTROL-REQUEST-PASSON-UP
          :PARAMETERS
          (?P - CELL ?N1 - CELL)
          :PRECONDITION
          (AND
               (PROC ?P)
               (not
                    (AVAILABLE ?P))
               (NEIGHBOUR UP ?N1 ?P)
               (REQUEST ?N1 DOWN)
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN)))
          :EFFECT
          (AND
               (REQUEST ?P LEFT)
               (REQUEST ?P RIGHT)
               (REQUEST ?P DOWN))
     )
     (:ACTION CONTROL-REQUEST-PASSON-RIGHT
          :PARAMETERS
          (?P - CELL ?N1 - CELL)
          :PRECONDITION
          (AND
               (PROC ?P)
               (not
                    (AVAILABLE ?P))
               (NEIGHBOUR RIGHT ?N1 ?P)
               (REQUEST ?N1 LEFT)
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN)))
          :EFFECT
          (AND
               (REQUEST ?P LEFT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:ACTION CONTROL-REQUEST-PASSON-LEFT
          :PARAMETERS
          (?P - CELL ?N1 - CELL)
          :PRECONDITION
          (AND
               (PROC ?P)
               (not
                    (AVAILABLE ?P))
               (NEIGHBOUR LEFT ?N1 ?P)
               (REQUEST ?N1 RIGHT)
               (not
                    (REQUEST ?P LEFT))
               (not
                    (REQUEST ?P RIGHT))
               (not
                    (REQUEST ?P UP))
               (not
                    (REQUEST ?P DOWN)))
          :EFFECT
          (AND
               (REQUEST ?P RIGHT)
               (REQUEST ?P UP)
               (REQUEST ?P DOWN))
     )
     (:ACTION CONTROL-MARK-AVAILABLE
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?N2 - CELL ?N3 - CELL ?N4 - CELL)
          :PRECONDITION
          (AND
               (PROC ?C)
               (not
                    (BUSY ?C))
               (NEIGHBOUR LEFT ?N1 ?C)
               (NEIGHBOUR UP ?N2 ?C)
               (NEIGHBOUR RIGHT ?N3 ?C)
               (NEIGHBOUR DOWN ?N4 ?C)
               (not
                    (BAR-NEIGHS ?N1))
               (not
                    (BAR-NEIGHS ?N2))
               (not
                    (BAR-NEIGHS ?N3))
               (not
                    (BAR-NEIGHS ?N4))
               (not
                    (THRESHOLD-EXCEED ?C))
               (not
                    (AVAILABLE ?C)))
          :EFFECT
          (AND
               (AVAILABLE ?C))
     )
     (:ACTION CONTROL-UNBAR-NEIGHS-not-THRESHOLD-REACH
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (not
                    (THRESHOLD-REACH ?C))
               (BAR-NEIGHS ?C))
          :EFFECT
          (AND
               (not
                    (BAR-NEIGHS ?C)))
     )
     (:ACTION CONTROL-UNBAR-NEIGHS-not-BUSY
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (not
                    (BUSY ?C))
               (BAR-NEIGHS ?C))
          :EFFECT
          (AND
               (not
                    (BAR-NEIGHS ?C)))
     )
     (:ACTION CONTROL-MARK-UNAVAILABLE-NEIGHBOUR-THRESHOLD-REACHED
          :PARAMETERS
          (?C - CELL ?N - CELL ?S - SIDE)
          :PRECONDITION
          (AND
               (NEIGHBOUR ?S ?C ?N)
               (BAR-NEIGHS ?N)
               (AVAILABLE ?C))
          :EFFECT
          (AND
               (not
                    (AVAILABLE ?C)))
     )
     (:ACTION CONTROL-BAR-NEIGHS-AVAIL
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (BUSY ?C)
               (THRESHOLD-REACH ?C)
               (not
                    (BAR-NEIGHS ?C)))
          :EFFECT
          (AND
               (BAR-NEIGHS ?C))
     )
     (:ACTION CONTROL-MARK-UNAVAILABLE-THRESHOLD-EXCEED
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (THRESHOLD-EXCEED ?C)
               (AVAILABLE ?C))
          :EFFECT
          (AND
               (not
                    (AVAILABLE ?C)))
     )
     (:ACTION CONTROL-MARK-UNAVAILABLE-BUSY
          :PARAMETERS
          (?C - CELL)
          :PRECONDITION
          (AND
               (BUSY ?C)
               (AVAILABLE ?C))
          :EFFECT
          (AND
               (not
                    (AVAILABLE ?C)))
     )
     (:ACTION CONTROL-UNMARK-EXCEED
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR ?S1 ?N1 ?C)
               (NEIGHBOUR ?S2 ?N2 ?C)
               (not
                    (BUSY ?N1))
               (not
                    (BUSY ?N2))
               (not
                    (= ?N1 ?N2))
               (THRESHOLD-EXCEED ?C))
          :EFFECT
          (AND
               (not
                    (THRESHOLD-EXCEED ?C)))
     )
     (:ACTION CONTROL-MARK-THRESHOLD-EXCEED
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (PROC ?N1)
               (PROC ?N2)
               (PROC ?N3)
               (NEIGHBOUR ?S1 ?N1 ?C)
               (NEIGHBOUR ?S2 ?N2 ?C)
               (NEIGHBOUR ?S3 ?N3 ?C)
               (BUSY ?N1)
               (BUSY ?N2)
               (BUSY ?N3)
               (not
                    (= ?N1 ?N2))
               (not
                    (= ?N2 ?N3))
               (not
                    (= ?N3 ?N1))
               (not
                    (THRESHOLD-EXCEED ?C)))
          :EFFECT
          (AND
               (THRESHOLD-EXCEED ?C))
     )
     (:ACTION CONTROL-UNMARK-THRESHOLD-REACH
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE ?N3 - CELL ?S3 - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (NEIGHBOUR ?S1 ?N1 ?C)
               (NEIGHBOUR ?S2 ?N2 ?C)
               (NEIGHBOUR ?S3 ?N3 ?C)
               (not
                    (BUSY ?N1))
               (not
                    (BUSY ?N2))
               (not
                    (BUSY ?N3))
               (not
                    (= ?N1 ?N2))
               (not
                    (= ?N2 ?N3))
               (not
                    (= ?N3 ?N1))
               (THRESHOLD-REACH ?C))
          :EFFECT
          (AND
               (not
                    (THRESHOLD-REACH ?C)))
     )
     (:ACTION CONTROL-MARK-THRESHOLD-REACH
          :PARAMETERS
          (?C - CELL ?N1 - CELL ?S1 - SIDE ?N2 - CELL ?S2 - SIDE)
          :PRECONDITION
          (AND
               (PROC ?C)
               (PROC ?N1)
               (PROC ?N2)
               (NEIGHBOUR ?S1 ?N1 ?C)
               (NEIGHBOUR ?S2 ?N2 ?C)
               (BUSY ?N1)
               (BUSY ?N2)
               (not
                    (= ?N1 ?N2))
               (not
                    (THRESHOLD-REACH ?C)))
          :EFFECT
          (AND
               (THRESHOLD-REACH ?C))
     )
)