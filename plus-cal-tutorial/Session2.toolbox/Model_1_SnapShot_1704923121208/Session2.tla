The module begins with a string of four or more - characters. Text that
precedes the module is ignored.

------------------------------- MODULE Session2 -------------------------------
EXTENDS Integers, TLC
 
(********

--algorithm AnyName {
   variable x = {"a","b"} ;    
   {  
     x := x \cap { "a" } ;
     print x
   }
}

********)
\* BEGIN TRANSLATION (chksum(pcal) = "955901c1" /\ chksum(tla) = "e4c47baf")
VARIABLES x, pc

vars == << x, pc >>

Init == (* Global variables *)
        /\ x = {"a","b"}
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ x' = (x \cap { "a" })
         /\ PrintT(x')
         /\ pc' = "Done"

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

\* This is a single-line comment.  
\* The module is ended by a string of four or more = characters.  
===============================================================================
Text that follows the module is ignored.  The Toolbox maintains the following 
information.

\* Modification History
\* Last modified Wed Jan 10 22:45:16 CET 2024 by alexander
\* Last modified Tue Dec 22 16:15:06 PST 2020 by lamport
\* Created Sat Dec 05 17:41:14 PST 2020 by lamport
