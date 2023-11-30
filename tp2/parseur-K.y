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
%token LB RB LP RP SEMICOLON COMMA
%token ASSIGN IF ELSE WHILE

%left ADD SUB
%left MUL
%left AND OR
%left ASSIGN 
%left EQ LT LE
%right NOT
%right INT VOID
%nonassoc LB RB LP RP

%start Prg

%%
Prg : Stm                                          { }
    | Stm Prg                                      { }
    | LB Prg  RB                                   { }
    ;

Stm : INT ID SEMICOLON                             { }
    | ID ASSIGN Exp SEMICOLON                      { }
    | INT ID Sec SEMICOLON                         { }
    | IF LP Exp RP LB Prg RB ELSE LB Prg RB        { }
    | IF LP Exp RP Stm ELSE Stm                    { }
    | WHILE LP Exp RP LB Prg RB                    { }
    | VOID SEMICOLON                               { }
    | SEMICOLON                                    { }
    ;            

Sec : COMMA ID Sec                                 { }
    | COMMA ID                                     { }
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
            | VOID                            { } 
            ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
}
 

 