
%{
#include "yacc.y"
%}

%%
[0-9]+          { yylval = atoi(yytext); return INTEGER; }
[ \t\n]         ;
.               { return yytext[0]; }
%%

// FILEPATH: yacc.y

%{
#include <stdio.h>
%}

%token INTEGER

%%
expression : INTEGER
           | expression '+' expression
           | expression '-' expression
           | expression '*' expression
           | expression '==' expression
           | expression '<' expression
           | expression '<=' expression
           | '!' expression
           | expression '&&' expression
           | expression '||' expression
           ;

%%

int yylex();
void yyerror(const char *s);

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}

// FILEPATH: main.c

#include <stdio.h>

extern int yyparse();

int main() {
    printf("Entrez une expression : ");
    yyparse();
    return 0;
}
