---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_17047917643345000 == 
<<2+2,3>>

----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_17047917643345000>>)
----

=============================================================================
\* Modification History
\* Created Tue Jan 09 10:16:04 CET 2024 by alexander
