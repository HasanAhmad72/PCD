%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp_count = 0;

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int yylex();
%}

%code requires {
typedef struct {
    int value;
    char place[20];
} Expr;
}

%union {
    int num;
    Expr expr;
}

%token <num> NUM
%token EOL

%type <expr> expr

%left '+' '-'
%left '*' '/'

%%

program:
      lines
    ;

lines:
      lines line
    | line
    ;

line:
      expr EOL
      {
          printf("Result: %s\n", $1.place);
      }
    ;

expr:
      NUM
      {
          $$.value = $1;
          sprintf($$.place, "%d", $1);
      }

    | '(' expr ')'
      {
          $$ = $2;
      }

    | expr '+' expr
      {
          Expr temp;
          temp.value = $1.value + $3.value;
          sprintf(temp.place, "t%d", ++temp_count);

          printf("%s = %s + %s\n",
                 temp.place, $1.place, $3.place);

          $$ = temp;
      }

    | expr '-' expr
      {
          Expr temp;
          temp.value = $1.value - $3.value;
          sprintf(temp.place, "t%d", ++temp_count);

          printf("%s = %s - %s\n",
                 temp.place, $1.place, $3.place);

          $$ = temp;
      }

    | expr '*' expr
      {
          Expr temp;
          temp.value = $1.value * $3.value;
          sprintf(temp.place, "t%d", ++temp_count);

          printf("%s = %s * %s\n",
                 temp.place, $1.place, $3.place);

          $$ = temp;
      }

    | expr '/' expr
      {
          if ($3.value == 0)
          {
              yyerror("Division by zero");
              exit(1);
          }

          Expr temp;
          temp.value = $1.value / $3.value;
          sprintf(temp.place, "t%d", ++temp_count);

          printf("%s = %s / %s\n",
                 temp.place, $1.place, $3.place);

          $$ = temp;
      }
    ;

%%

int main()
{
    yyparse();
    return 0;
}
