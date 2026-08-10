%{
#include <stdio.h>
%}

%%

"=="|"!="|"<="|">="|"<"|">"    {
    printf("Relational Operator : %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]*    {
    printf("Identifier : %s\n", yytext);
}

[0-9]+    {
    printf("Integer : %s\n", yytext);
}

[ \t\n]+    {
    /* Ignore white spaces */
}

.    {
    printf("Unknown Token : %s\n", yytext);
}

%%

int main()
{
    printf("Enter Source Code:\n\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}