---- MODULE MC ----
EXTENDS AB2, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
d1, d2, d3
----

\* MV CONSTANT definitions Data
const_17046481251016000 == 
{d1, d2, d3}
----

\* SYMMETRY definition
symm_17046481251017000 == 
Permutations(const_17046481251016000)
----

=============================================================================
\* Modification History
\* Created Sun Jan 07 18:22:05 CET 2024 by alexander
