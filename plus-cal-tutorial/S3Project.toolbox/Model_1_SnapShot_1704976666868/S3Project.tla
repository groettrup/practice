----------------------------- MODULE S3Project -----------------------------

EXTENDS Integers, Sequences, TLC

CONSTANTS base, exp
ASSUME base \in Int /\ exp \in Int /\ exp >= 0
(*
--algorithm Exponentiate {
    variables m=1, n=base;
    {
        assert TRUE;
        while ( n>0 ) {
            n := n - 1;
            m := m * base;
        };
        assert m = base^exp
    }
}
*)
\* BEGIN TRANSLATION (chksum(pcal) = "71fdb3bb" /\ chksum(tla) = "1906ac8e")
VARIABLES m, n, pc

vars == << m, n, pc >>

Init == (* Global variables *)
        /\ m = 1
        /\ n = base
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(TRUE, "Failure of assertion at line 11, column 9.")
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << m, n >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF n>0
               THEN /\ n' = n - 1
                    /\ m' = m * base
                    /\ pc' = "Lbl_2"
               ELSE /\ Assert(m = base^exp, 
                              "Failure of assertion at line 16, column 9.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << m, n >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 


=============================================================================
\* Modification History
\* Last modified Thu Jan 11 13:24:17 CET 2024 by alexander
\* Created Thu Jan 11 12:50:07 CET 2024 by alexander
