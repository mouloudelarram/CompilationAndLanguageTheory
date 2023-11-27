%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUM ID FUN
%token ADD SUB MUL AND OR NOT EQ LT LE LEFT RIGHT
%left '+' '-'
%left '*' '/'

%%
expresion   : expresion ADD expresion               { } 
            | expresion SUB expresion               { }
            | expresion MUL expresion               { }
            | expresion AND expresion               { }
            | expresion OR expresion                { }
            | NOT expresion                         { }
            | expresion EQ expresion                { }
            | expresion LT expresion                { }
            | expresion LE expresion                { }
            | LEFT expresion RIGHT                  { }
            | NUM                                   { }
            | ID                                    { }
            | ID LEFT expresion RIGHT               { } /*function*/
            ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}
 

 