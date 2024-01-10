---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491275192710000 == 
{<<1>>, <<2,2>>, <<3,3,3>>} \cup {<<1>>, <<1,2>>, <<1,2,3>>}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491275192710000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 19:52:31 CET 2024 by alexander
