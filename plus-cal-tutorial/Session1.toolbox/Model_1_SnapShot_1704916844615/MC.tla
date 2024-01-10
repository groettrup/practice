---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491684259422000 == 
IsPrime(79)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491684259422000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 21:00:42 CET 2024 by alexander
