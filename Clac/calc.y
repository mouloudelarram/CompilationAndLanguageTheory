%token NOMBRE /* liste des terminaux */
%%
expression: expression '+' terme
    | expression '-' terme
    | terme
    ;
terme: terme '*' facteur
    | terme '/' facteur
    | facteur
    ;
facteur: '(' expression ')'
    | '-' facteur
    | NOMBRE
    ;
%%
#include <stdio.h>

int yyerror(void)
{ 
    printf("erreur de syntaxe\n"); 
    return 1;
}