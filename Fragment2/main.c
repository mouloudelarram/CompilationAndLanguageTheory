#include <stdio.h>

extern int yyparse();

int main() {
    printf("Entrez une expression : ");
    return yyparse();
    
}