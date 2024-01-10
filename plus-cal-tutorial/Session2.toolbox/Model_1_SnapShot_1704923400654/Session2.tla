The module begins with a string of four or more - characters. Text that
precedes the module is ignored.

------------------------------- MODULE Session2 -------------------------------
EXTENDS Integers, TLC
 
(********

--algorithm AnyName {
   variable x = <<1,2,3>> ;    
   {  
     x[3] := x[2] + 4;
     print x
   }
}

********)
\* BEGIN TRANSLATION (chksum(pcal) = "e5da1259" /\ chksum(tla) = "6d849a4")
VARIABLES x, pc

vars == << x, pc >>

Init == (* Global variables *)
        /\ x = <<1,2,3>>
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ x' = [x EXCEPT ![3] = x[2] + 4]
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
\* Last modified Wed Jan 10 22:49:55 CET 2024 by alexander
\* Last modified Tue Dec 22 16:15:06 PST 2020 by lamport
\* Created Sat Dec 05 17:41:14 PST 2020 by lamport
