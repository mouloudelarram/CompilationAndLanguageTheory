%option noyywrap

%%
[+-]?[0-9][0-9]*    printf("That\'s a valid Interger !\n");
[ \t\n]             ;
.                   printf("That\'s not a valid Interger !\n");
%%
