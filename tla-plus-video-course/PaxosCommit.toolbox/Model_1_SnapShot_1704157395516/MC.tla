---- MODULE MC ----
EXTENDS PaxosCommit, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
a1, a2, a3
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Acceptor
const_170415733163153000 == 
{a1, a2, a3}
----

\* MV CONSTANT definitions RM
const_170415733163154000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_170415733163155000 == 
Permutations(const_170415733163154000)
----

\* CONSTANT definitions @modelParameterConstants:0Ballot
const_170415733163156000 == 
{0,1}
----

\* CONSTANT definitions @modelParameterConstants:2Majority
const_170415733163157000 == 
{{a1,a2},{a2,a3},{a1,a3}}
----

=============================================================================
\* Modification History
\* Created Tue Jan 02 02:02:11 CET 2024 by alexander
