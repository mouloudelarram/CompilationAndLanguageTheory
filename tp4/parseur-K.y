%{
    //Group 2 : EL ARRAM Mouloud
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "table_symbole.h"

    extern dico d;
    extern FILE *file;
    extern int t;
    extern int DeclationVariable;
    extern int Adresse;
    int yylex();
    void yyerror(const char *s);
%}

%union {
    int ival;
    char *sval;
}

%token <ival> NUM
%token <sval> ID


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

%type <ival> Exp

%start Bloc

%%
Bloc : 
    Prg                                            {  }
    |LB Prg  RB                                    {  }
    ;

Prg : Stm                                          {  }
    | Stm Prg                                      {  }
    ;

Stm : INT ID SEMICOLON                             { ajouterVariable(&d, $2, GLOBAL, NULL, Adresse++); fprintf(file, "\t%s: .word 0\n", $2); }
    | ID ASSIGN Exp SEMICOLON                      { 
        if(affectationValide(&d, $1)) {
            if (DeclationVariable == 1) { 
                DeclationVariable = 0; 
                fprintf(file, ".text\n\tmain:\n"); 
            }
            fprintf(file, "\t\tli $t%d, %d\n\t\tsw $t%d, %s \n", t, $3, t++, $1); 
                
        }
    }
    | INT ID Sec SEMICOLON                         { ajouterVariable(&d, $2, GLOBAL, NULL, Adresse++); fprintf(file, "\t%s: .word 0\n", $2); }
    | IF LP Exp RP LB Prg RB ELSE LB Prg RB        { }
    | IF LP Exp RP Stm ELSE Stm                    { }
    | WHILE LP Exp RP LB Prg RB                    { }
    | VOID SEMICOLON                               {  }
    | SEMICOLON                                    {  }
    ;            

Sec : COMMA ID Sec                                 { ajouterVariable(&d, $2, GLOBAL, NULL, Adresse++); fprintf(file, "\t%s: .word 0\n", $2); }
    | COMMA ID                                     { ajouterVariable(&d, $2, GLOBAL, NULL, Adresse++); fprintf(file, "\t%s: .word 0\n", $2); }
    ;

Exp : Exp ADD Exp                          { $$ = $1 + $3; printf("add $t: %d, \n", $1);}
    | Exp SUB Exp                          { $$ = $1 - $3; }
    | Exp MUL Exp                          { $$ = $1 * $3; }
    | Exp AND Exp                          { $$ = $1 && $3; }
    | Exp OR Exp                           { $$ = $1 || $3; }
    | NOT Exp                              { $$ = !$2; }
    | Exp EQ Exp                           { $$ = $1 == $3; }
    | Exp LT Exp                           { $$ = $1 < $3; }
    | Exp LE Exp                           { $$ = $1 <= $3; }
    | LP Exp RP                            { $$ = $2; }
    | NUM                                  { $$ = $1; }
    | ID                                   { $$ = 0;}
    | ID LP Exp RP                         {  $$ = 0; } 
    | VOID                                 { $$ = 0; } 
    ;
%%

void yyerror(const char *s) {
    printf("Erreur de syntaxe : %s\n", s);
    exit(0);
}
 

 