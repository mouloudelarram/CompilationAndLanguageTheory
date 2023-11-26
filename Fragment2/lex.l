%{
    #include "yacc.tab.h"
    int yyerror(char *s);
%}

%%
[+-]?[0-9]+       { return NUM; }
"+"          { return ADD; }
"-"          { return SUB; }
"*"          { return MUL; }
"=="         { return EQ; }
"<"          { return LT; }
"<="         { return LE; }
"&&"         { return AND; }
"||"         { return OR; }
"!"          { return NOT; }

[ \t\n]     ;
.           { yyerror("Unknown character"); exit(0);}
%%

int yywrap() {
    return 1;
}
