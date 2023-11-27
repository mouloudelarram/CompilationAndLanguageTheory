%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUM ID FUN
%token ADD SUB MUL AND OR NOT EQ LT LE LEFT RIGHT

%left ADD SUB
%left MUL
%left AND
%left OR
%right NOT
%left EQ LT LE
%nonassoc LEFT RIGHT

%%
expression  : expression ADD expression               { }
            | expression SUB expression               { }
            | expression MUL expression               { }
            | expression AND expression               { }
            | expression OR expression                { }
            | NOT expression                          { }
            | expression EQ expression                { }
            | expression LT expression                { }
            | expression LE expression                { }
            | LEFT expression RIGHT                   { }
            | NUM                                     { }
            | ID                                      { }
            | ID LEFT expression RIGHT                { } /*function*/
            ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}
 

 