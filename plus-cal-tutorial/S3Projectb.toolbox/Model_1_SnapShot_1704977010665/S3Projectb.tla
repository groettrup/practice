----------------------------- MODULE S3Projectb -----------------------------

EXTENDS Integers, Sequences, TLC

CONSTANTS base, exp
ASSUME base \in Int /\ exp \in Int /\ exp >= 0
(*
--algorithm Exponentiate {
    variables m=1, n=exp;
    {
        assert TRUE;
        while ( n>0 ) {
            if (n%2=0) {
                m := m * base;
            } else {
                m := m * m;
            };
            n := n \div 2;
        };
        assert m = base^exp
    }
}
*)
\* BEGIN TRANSLATION (chksum(pcal) = "7bc1d1ec" /\ chksum(tla) = "f9f1d762")
VARIABLES m, n, pc

vars == << m, n, pc >>

Init == (* Global variables *)
        /\ m = 1
        /\ n = exp
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(TRUE, "Failure of assertion at line 11, column 9.")
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << m, n >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF n>0
               THEN /\ IF n%2=0
                          THEN /\ m' = m * base
                          ELSE /\ m' = m * m
                    /\ n' = (n \div 2)
                    /\ pc' = "Lbl_2"
               ELSE /\ Assert(m = base^exp, 
                              "Failure of assertion at line 20, column 9.")
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
\* Last modified Thu Jan 11 13:43:25 CET 2024 by alexander
\* Created Thu Jan 11 13:40:06 CET 2024 by alexander
