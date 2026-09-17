%{
#include <stdio.h>

int yylex();

void yyerror(const char *s)
{
    fprintf(stderr, "Parse error: %s\n", s);
}
%}

%token INTEGER FLOAT CHAR EOL

%%

program:
      /* empty */
    | program line
    ;

line:
      statement EOL
    ;

statement:
      INTEGER
        {
            printf("Type: INTEGER\n");
        }
    | FLOAT
        {
            printf("Type: FLOAT\n");
        }
    | CHAR
        {
            printf("Type: CHAR/STRING\n");
        }
    ;

%%

int main()
{
    yyparse();
    return 0;
}
