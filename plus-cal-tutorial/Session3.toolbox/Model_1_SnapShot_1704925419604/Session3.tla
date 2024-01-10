------------------------------- MODULE Session3 -------------------------------
EXTENDS Integers, Sequences, TLC

(*********

--algorithm TupleMax {
   variables inp = <<>>,  max = -99999, i = 1 ;    
   { 
     assert  \A n \in 1..Len(inp) : inp[n] > -99999 ;
     while (i =< Len(inp)) {
       if (inp[i] > max) { max := inp[i] } ;
       i := i + 1
     } ;
     assert    (\E n \in 1..Len(inp) : max = inp[n])
            /\ (\A n \in 1..Len(inp) : max >= inp[n])  
   }
}

********)
\* BEGIN TRANSLATION (chksum(pcal) = "dbdd942f" /\ chksum(tla) = "d90f3e47")
VARIABLES inp, max, i, pc

vars == << inp, max, i, pc >>

Init == (* Global variables *)
        /\ inp = <<>>
        /\ max = -99999
        /\ i = 1
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(\A n \in 1..Len(inp) : inp[n] > -99999, 
                   "Failure of assertion at line 9, column 6.")
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << inp, max, i >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF i =< Len(inp)
               THEN /\ IF inp[i] > max
                          THEN /\ max' = inp[i]
                          ELSE /\ TRUE
                               /\ max' = max
                    /\ i' = i + 1
                    /\ pc' = "Lbl_2"
               ELSE /\ Assert(   (\E n \in 1..Len(inp) : max = inp[n])
                              /\ (\A n \in 1..Len(inp) : max >= inp[n]), 
                              "Failure of assertion at line 14, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << max, i >>
         /\ inp' = inp

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

===========================================
\* Modification History
\* Last modified Wed Jan 10 23:23:33 CET 2024 by alexander
\* Last modified Sat Dec 26 11:48:57 PST 2020 by claus
\* Created Fri Dec 25 00:00:00 PST 2020 by claus
