----------------------------- MODULE S3Project -----------------------------

EXTENDS Integers, Sequences, TLC

(*
--algorithm Exponentiate {
    variables m \in {-8..8}, n \in {0..5}, res = 1;
    {
        assert TRUE;
        while ( n>0 ) {
            n := n - 1;
            res := res * m;
        };
        assert res = m*n
    }
}
*)
\* BEGIN TRANSLATION (chksum(pcal) = "6df95bd8" /\ chksum(tla) = "eecdc37c")
VARIABLES m, n, res, pc

vars == << m, n, res, pc >>

Init == (* Global variables *)
        /\ m \in {-8..8}
        /\ n \in {0..5}
        /\ res = 1
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(TRUE, "Failure of assertion at line 9, column 9.")
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << m, n, res >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF n>0
               THEN /\ n' = n - 1
                    /\ res' = res * m
                    /\ pc' = "Lbl_2"
               ELSE /\ Assert(res = m*n, 
                              "Failure of assertion at line 14, column 9.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << n, res >>
         /\ m' = m

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 


=============================================================================
\* Modification History
\* Last modified Thu Jan 11 13:47:41 CET 2024 by alexander
\* Created Thu Jan 11 12:50:07 CET 2024 by alexander
