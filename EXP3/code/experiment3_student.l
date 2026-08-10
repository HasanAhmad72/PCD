%{
#include <stdio.h>
%}

%%

int|float|char|if|else|while|for|return    {
    printf("Keyword : %s\n", yytext);
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

";"|","|"("|")"|"{"|"}"    {
    printf("Delimiter : %s\n", yytext);
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