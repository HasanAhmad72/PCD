%{
#include <stdio.h>
#include <stdlib.h>
#include "type.tab.h"
%}

%%

[0-9]+              { return INTEGER; }

[0-9]+\.[0-9]+      { return FLOAT; }

[a-zA-Z]+           { return CHAR; }

[ \t]+              ;

\n                  { return EOL; }

.                   { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
