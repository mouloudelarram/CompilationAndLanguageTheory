%{
#include "yacc.tab.h"
%}

%option noyywrap

DIGIT   [0-9]
ID      [a-zA-Z][a-zA-Z0-9]*

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"=="    { return EQ; }
"<"     { return LT; }
"<="    { return LTE; }
"!"     { return NOT; }
"&&"    { return AND; }
"||"    { return OR; }
{DIGIT}+    { yylval = atoi(yytext); return INT; }
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { return yytext[0]; }

%%
