/*%FIRST PART Optional*/
%option noyywrap

%%
"user" printf("That\'s a User !\n");
.      printf("%s is not a User Expresion !\n", yytext);
"exit" return 0;
%%

/*%THIRD PART Optional*/
