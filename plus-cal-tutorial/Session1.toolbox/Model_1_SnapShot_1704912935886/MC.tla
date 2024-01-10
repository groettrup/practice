---- MODULE MC ----
EXTENDS Session1, TLC

\* Constant expression definition @modelExpressionEval
const_expr_170491293386416000 == 
{1,1,2,2,3,3} \ {2, 3, 4}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_170491293386416000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 10 19:55:33 CET 2024 by alexander
