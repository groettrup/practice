---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491288160714000 == 
{"aa", "bb", "cc"} \ {"a", "b", "c"}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491288160714000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 19:54:41 CET 2024 by alexander
