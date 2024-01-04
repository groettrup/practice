---- MODULE MC ----
EXTENDS ABSpec, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
x, y, z
----

\* MV CONSTANT definitions Data
const_170440724953930000 == 
{x, y, z}
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_170440724953933000 ==
\A v \in Data \X {0,1} : (AVar=v) ~> (BVar=v)
----
=============================================================================
\* Modification History
\* Created Thu Jan 04 23:27:29 CET 2024 by alexander
