---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491498475321000 == 
IsPrime(79)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491498475321000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 20:29:44 CET 2024 by alexander
