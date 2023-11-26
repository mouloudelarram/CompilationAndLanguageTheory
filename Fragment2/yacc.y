%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUM 
%token ADD SUB MUL AND OR NOT EQ LT LE

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
            | NUM                                   { }
            ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}
