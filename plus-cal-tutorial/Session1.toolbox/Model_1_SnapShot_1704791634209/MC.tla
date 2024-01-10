---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_17047916321033000 == 
2+2

----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_17047916321033000>>)
----

=============================================================================
\* Modification History
\* Created Tue Jan 09 10:13:52 CET 2024 by alexander
