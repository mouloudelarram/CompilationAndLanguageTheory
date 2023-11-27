%{
    #include "parseur-K.tab.h"
    #include <stdio.h>
    int yyerror(char *s);
%}

%%
0|[1-9][0-9]*           { yylval = atoi(yytext); return NUM; } /*printf ("NUM %s \n" , yytext);*/
[a-zA-Z][a-zA-Z0-9]*    { return ID;    }
"+"                     { return ADD;   }
"-"                     { return SUB;   }
"*"                     { return MUL;   }
"=="                    { return EQ;    }
"<"                     { return LT;    }
"<="                    { return LE;    }
"&&"                    { return AND;   }
"||"                    { return OR;    }
"!"                     { return NOT;   }
"("                     { return LEFT;  }
")"                     { return RIGHT; }
[ \t\n]                 { /* ignore whitespace */ }
.                       { yyerror("Unknown character"); exit(0);} /* return yytext[0]; */
%%

int yywrap() {
    return 1;
}
 