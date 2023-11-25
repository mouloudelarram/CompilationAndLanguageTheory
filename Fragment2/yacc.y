%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ADD SUB MUL DIV EQ LT LTE NOT AND OR INT EOL

%%

stmt: expr EOL  { printf("Result: %d\n", $1); }
    ;

expr: expr ADD expr  { $$ = $1 + $3; }
    | expr SUB expr  { $$ = $1 - $3; }
    | expr MUL expr  { $$ = $1 * $3; }
    | expr DIV expr  { $$ = $1 / $3; }
    | expr EQ expr   { $$ = $1 == $3; }
    | expr LT expr   { $$ = $1 < $3; }
    | expr LTE expr  { $$ = $1 <= $3; }
    | NOT expr       { $$ = !$2; }
    | expr AND expr  { $$ = $1 && $3; }
    | expr OR expr   { $$ = $1 || $3; }
    | INT            { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    return 0;
}
