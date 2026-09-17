%{
#include <stdio.h>
#include <stdlib.h>
#include "ex4.tab.h"
%}

%%

[0-9]+      {
                yylval.num = atoi(yytext);
                return NUM;
            }

[ \t]+      ;

\n          {
                return EOL;
            }

[-+*/()]    {
                return yytext[0];
            }

.           {
                fprintf(stderr, "Error: Invalid Character: %s\n", yytext);
            }

%%

int yywrap()
{
    return 1;
}
