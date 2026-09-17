#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[100];
int pos = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void error()
{
    printf("Invalid Expression\n");
    exit(0);
}

void E()
{
    T();
    Eprime();
}

void Eprime()
{
    if (input[pos] == '+')
    {
        pos++;
        T();
        Eprime();
    }
    else if (input[pos] == '-')
    {
        pos++;
        T();
        Eprime();
    }
}

void T()
{
    F();
    Tprime();
}

void Tprime()
{
    if (input[pos] == '*')
    {
        pos++;
        F();
        Tprime();
    }
    else if (input[pos] == '/')
    {
        pos++;
        F();
        Tprime();
    }
}

void F()
{
    if (input[pos] >= '0' && input[pos] <= '9')
    {
        while (input[pos] >= '0' && input[pos] <= '9')
            pos++;
    }
    else if (input[pos] == '(')
    {
        pos++;
        E();

        if (input[pos] == ')')
            pos++;
        else
            error();
    }
    else
    {
        error();
    }
}

int main()
{
    printf("Enter arithmetic expression: ");
    scanf("%s", input);

    E();

    if (input[pos] == '\0')
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}
