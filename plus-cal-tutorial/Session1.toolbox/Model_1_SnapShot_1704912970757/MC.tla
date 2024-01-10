---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491296873218000 == 
{1,1,1} \subseteq {1,1,2,2}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491296873218000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 19:56:08 CET 2024 by alexander
