#include <stdio.h>

extern int yyparse();

int main() {
    int rep =yyparse();
    if (rep == 0)
        printf("Expression correcte\n");
    else
        printf("Expression incorrecte\n");
    return rep;
    
} 