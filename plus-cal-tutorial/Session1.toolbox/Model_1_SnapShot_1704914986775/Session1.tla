------------------------------ MODULE Session1 ------------------------------
EXTENDS Integers

IsPrime(n) ==   /\ (1 < n)
                /\ \A m \in (2..n-1) : ~ \E p \in (2..n-1) : n = p * m 

=============================================================================
\* Modification History
\* Last modified Wed Jan 10 20:29:41 CET 2024 by alexander
\* Last modified Wed Jan 10 20:29:15 CET 2024 by alexander
\* Last modified Thu Dec 17 15:34:55 PST 2020 by lamport
\* Created Sat Dec 05 17:41:14 PST 2020 by lamport
