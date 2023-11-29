#include <stdio.h>

extern int yyparse();

int main() {
    int rep =yyparse();
    if (rep == 0)
        printf("Programme Valide\n");
    else
        printf("Programme Invalide\n");
    return rep;
    
} 