---- MODULE MC ----
EXTENDS TwoPhase, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions RM
const_170415560241442000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_170415560241443000 == 
Permutations(const_170415560241442000)
----

=============================================================================
\* Modification History
\* Created Tue Jan 02 01:33:22 CET 2024 by alexander
