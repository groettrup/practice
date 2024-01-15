-------------------------------- MODULE S4E1 --------------------------------

EXTENDS Integers, Sequences, TLC

CONSTANT Tuples, minValue

ASSUME  /\ minValue \in Int
        /\ Tuples \subseteq Seq(Int)
        /\ \A t \in Tuples: \A i \in 1..Len(t): t[i] > minValue

(***********
  Write an algorithm SillyTupleMax by modifying TupleMax to work in the following silly way.
  It repeatedly examines an arbitrary element of the tuple inp and terminates with max equal
  to that value if it is the maximum value of all the tuple's elements.
  Thus, if it's lucky, it can terminate after trying a single element.  If it's very, very
  unlucky, it can keep picking non-maximal elements and never terminate.
  **********)

(*
--algorithm SillyTupleMax {
    variables max=minValue, inp \in Tuples, I=1..Len(inp), b = (I # {});
    {
        while (b) {
            with (i \in I) {
                if (\A j \in I: inp[i] >= inp[j]) {
                    max := inp[i];
                    b   := FALSE
                };
            }
        };        
        assert IF inp = << >>   THEN max = minValue
                                ELSE    /\ \E n \in 1..Len(inp): max = inp[n]
                                        /\ \A n \in 1..Len(inp): max >= inp[n]
    }
}

*)
\* BEGIN TRANSLATION (chksum(pcal) = "c6b50722" /\ chksum(tla) = "7ed0afc5")
VARIABLES max, inp, I, b, pc

vars == << max, inp, I, b, pc >>

Init == (* Global variables *)
        /\ max = minValue
        /\ inp \in Tuples
        /\ I = 1..Len(inp)
        /\ b = (I # {})
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF b
               THEN /\ \E i \in I:
                         IF \A j \in I: inp[i] >= inp[j]
                            THEN /\ max' = inp[i]
                                 /\ b' = FALSE
                            ELSE /\ TRUE
                                 /\ UNCHANGED << max, b >>
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert(IF inp = << >>   THEN max = minValue
                                               ELSE    /\ \E n \in 1..Len(inp): max = inp[n]
                                                       /\ \A n \in 1..Len(inp): max >= inp[n], 
                              "Failure of assertion at line 31, column 9.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << max, b >>
         /\ UNCHANGED << inp, I >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Mon Jan 15 19:18:52 CET 2024 by alexander
\* Created Sat Jan 13 19:45:39 CET 2024 by alexander
