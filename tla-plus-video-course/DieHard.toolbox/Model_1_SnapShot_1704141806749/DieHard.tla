------------------------------ MODULE DieHard ------------------------------
EXTENDS Integers

VARIABLES small, big

TypeOK ==   /\ small \in 0..3
            /\ big \in 0..5

Init ==     /\ big = 0
            /\ small = 0
\* definitions must preceed usage
FillBig     == big' = 5 /\ small' = small
FillSmall   == big' = big /\ small' = 3
EmptyBig    == big' = 0 /\ small' = small
EmptySmall  == big' = big /\ small' = 0
BigToSmall  ==  IF big + small <= 3
                THEN    /\ big' = 0
                        /\ small' = big + small
                ELSE    /\ big' = big - (3 - small)
                        /\ small' = 3
SmallToBig  ==  IF big + small <= 5
                THEN    /\ big' = big + small
                        /\ small' = 0
                ELSE    /\ big' = 5
                        /\ small' = small - (5 - big)
\* 3 kinds of steps: filling, emptying, transfering
Next ==     \/ FillBig
            \/ FillSmall
            \/ EmptyBig
            \/ EmptySmall
            \/ BigToSmall
            \/ SmallToBig
=============================================================================
\* Modification History
\* Last modified Mon Jan 01 21:42:13 CET 2024 by alexander
\* Created Mon Jan 01 21:10:27 CET 2024 by alexander
