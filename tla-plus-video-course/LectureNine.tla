---------------------------- MODULE LectureNine ----------------------------

EXTENDS Integers, Sequences

Remove(i, seq) == 
  [j \in 1..(Len(seq)-1) |-> IF j < i THEN seq[j] 
                                      ELSE seq[j+1]]

=============================================================================
\* Modification History
\* Last modified Thu Jan 04 22:59:25 CET 2024 by alexander
\* Created Thu Jan 04 22:59:14 CET 2024 by alexander
