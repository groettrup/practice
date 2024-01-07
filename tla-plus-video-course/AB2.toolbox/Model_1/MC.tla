---- MODULE MC ----
EXTENDS AB2, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_170464819942611000 == 
{d1, d2, d3}
----

\* SYMMETRY definition
symm_170464819942612000 == 
Permutations(const_170464819942611000)
----

\* CONSTRAINT definition @modelParameterContraint:0
constr_170464819942613000 ==
/\ Len(AtoB2) =< 5
/\ Len(BtoA2) =< 5
----
=============================================================================
\* Modification History
\* Created Sun Jan 07 18:23:19 CET 2024 by alexander
