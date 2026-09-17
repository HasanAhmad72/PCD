%{
#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int values[MAX];
char operators[MAX];
int vtop = -1;
int otop = -1;

void pushValue(int value)
{
    values[++vtop] = value;
}

int popValue()
{
    return values[vtop--];
}

void pushOperator(char op)
{
    operators[++otop] = op;
}

char popOperator()
{
    return operators[otop--];
}

int precedence(char op)
{
    if (op == '+' || op == '-')
        return 1;

    if (op == '*' || op == '/')
        return 2;

    return 0;
}

void applyOperator()
{
    int a, b, result;
    char op;

    b = popValue();
    a = popValue();
    op = popOperator();

    switch (op)
    {
        case '+':
            result = a + b;
            break;

        case '-':
            result = a - b;
            break;

        case '*':
            result = a * b;
            break;

        case '/':
            if (b == 0)
            {
                printf("Error: Division by zero\n");
                exit(1);
            }
            result = a / b;
            break;

        default:
            printf("Invalid operator\n");
            exit(1);
    }

    pushValue(result);
}

void processOperator(char op)
{
    while (otop >= 0 &&
           operators[otop] != '(' &&
           precedence(operators[otop]) >= precedence(op))
    {
        applyOperator();
    }

    pushOperator(op);
}

void processRightParenthesis()
{
    while (otop >= 0 && operators[otop] != '(')
    {
        applyOperator();
    }

    if (otop < 0)
    {
        printf("Error: Mismatched parentheses\n");
        exit(1);
    }

    popOperator();
}

%}

%%

[0-9]+      {
                pushValue(atoi(yytext));
            }

[+]         {
                processOperator('+');
            }

[-]         {
                processOperator('-');
            }

[*]         {
                processOperator('*');
            }

[/]         {
                processOperator('/');
            }

[(]         {
                pushOperator('(');
            }

[)]         {
                processRightParenthesis();
            }

[ \t]+      ;

\n          {
                while (otop >= 0)
                {
                    if (operators[otop] == '(')
                    {
                        printf("Error: Mismatched parentheses\n");
                        exit(1);
                    }

                    applyOperator();
                }

                if (vtop == 0)
                {
                    printf("Result = %d\n", values[vtop]);
                }
                else
                {
                    printf("Error: Invalid expression\n");
                }

                vtop = -1;
                otop = -1;
            }

.           {
                printf("Invalid character: %s\n", yytext);
            }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter an arithmetic expression:\n");
    yylex();
    return 0;
}
