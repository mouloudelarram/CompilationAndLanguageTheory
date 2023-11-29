%{
    #include "parseur-K.tab.h"
    #include <stdio.h>
    int yyerror(char *s);
%}

%%
"+"                     { return ADD;   }
"-"                     { return SUB;   }
"*"                     { return MUL;   }
"=="                    { return EQ;    }
"<"                     { return LT;    }
"<="                    { return LE;    }
"&&"                    { return AND;   }
"||"                    { return OR;    }
"!"                     { return NOT;   }
"("                     { return LP;    }
")"                     { return RP;    }
"int"                   { return INT;   }
"void"                  { return VOID;  }
"if"                    { return IF;    }
"else"                  { return ELSE;  }
"while"                 { return WHILE; }
"="                     { return ASSIGN;}
"{"                     { return LB;    }
"}"                     { return RB;    }
";"                     { return SEMICOLON;                       }   
0|[1-9][0-9]*           { yylval = atoi(yytext); return NUM;      }  /*printf ("NUM %s \n" , yytext);  lexème (123, NUM) */
[a-zA-Z][a-zA-Z0-9]*    { return ID;                              }  /*yyval = strdup(yytext); return ID OP;*/
[ \t\n]                 { /* ignore whitespace */                 }
.                       { yyerror("Unknown character"); exit(0);  }  /* return yytext[0]; */
%%

int yywrap() {
    return 1;
}
 