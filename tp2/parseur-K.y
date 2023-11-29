%{
    //Group 2 : EL ARRAM Mouloud
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUM ID
%token ADD SUB MUL AND OR NOT EQ LT LE LEFT RIGHT
%token INT VOID 
%token LB RB LP RP SEMICOLON 
%token ASSIGN IF ELSE WHILE

%left ADD SUB
%left MUL
%left AND OR
%left EQ LT LE
%right NOT
%left ASSIGN 
%right INT VOIDTYPE
%nonassoc LB RB LP RP


%%
Prg : Stm                                          { }
    | Stm SEMICOLON  Prg                           { }
    | LB Prg  RB                                   { }
    ;

Stm : Exp SEMICOLON                                { }
    | Exp SEMICOLON  Stm                           { }
    | IF LP Exp RP LB Prg RB ELSE LB Prg RB        { }
    | WHILE LP Exp RP LB Prg RB                    { }
    ;            

Exp  : Exp ADD Exp                                 { }
            | Exp SUB Exp                          { }
            | Exp MUL Exp                          { }
            | Exp AND Exp                          { }
            | Exp OR Exp                           { }
            | NOT Exp                              { }
            | Exp EQ Exp                           { }
            | Exp LT Exp                           { }
            | Exp LE Exp                           { }
            | LP Exp RP                            { }
            | NUM                                  { }
            | ID                                   { }
            | ID LP Exp RP                         { }
            | INT ID                               { }
            | ID ASSIGN Exp                        { }
            | VOIDTYPE                             { } 
            ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}
 

 