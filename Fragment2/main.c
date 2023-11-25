#include "yacc.tab.h"

extern int yyparse();

int main() {
    yyparse();
    return 0;
}
