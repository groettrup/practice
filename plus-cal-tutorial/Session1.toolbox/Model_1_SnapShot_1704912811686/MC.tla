---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491280966112000 == 
{{"a","b"}, {"a"}, {"b"}} \cap {{"a","b","c"}, {"a","b"}, {"a"}}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491280966112000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 19:53:29 CET 2024 by alexander
