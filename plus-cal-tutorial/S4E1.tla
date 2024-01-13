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
    variables max=minValue, inp \in Tuples, I=1..Len(inp)   ;
    {
        while (I /= {}) {
            with (i \in I) {
                if (inp[i] > max) {
                    max := inp[i]
                };
                I := I \ {i};
            }
        }
        
        assert \A i \in 1..Len(inp): inp[i] <= max
    }
}

*)

=============================================================================
\* Modification History
\* Last modified Sat Jan 13 20:10:21 CET 2024 by alexander
\* Created Sat Jan 13 19:45:39 CET 2024 by alexander
