#include <stdio.h>
#include <string.h>

#define MAX 50

struct Statement
{
    char code[100];
    int leader;
};

struct Statement stmt[MAX];
int n;

int isJump(char *s)
{
    return (strstr(s, "goto") != NULL ||
            strstr(s, "if") != NULL);
}

int getTarget(char *s)
{
    char *p;
    int target;

    p = strstr(s, "goto");

    if (p != NULL)
    {
        if (sscanf(p + 4, "%d", &target) == 1)
            return target;
    }

    return -1;
}

void findLeaders()
{
    int i, target;

    for (i = 0; i < n; i++)
        stmt[i].leader = 0;

    stmt[0].leader = 1;

    for (i = 0; i < n; i++)
    {
        if (isJump(stmt[i].code))
        {
            if (i + 1 < n)
                stmt[i + 1].leader = 1;

            target = getTarget(stmt[i].code);

            if (target >= 1 && target <= n)
                stmt[target - 1].leader = 1;
        }
    }
}

void printBasicBlocks()
{
    int i, block = 1;

    printf("\nBASIC BLOCKS\n");
    printf("============\n");

    for (i = 0; i < n; i++)
    {
        if (stmt[i].leader)
            printf("\nB%d:\n", block++);

        printf(" %d: %s\n", i + 1, stmt[i].code);
    }
}

int main()
{
    int i;

    printf("Enter number of three-address statements: ");
    scanf("%d", &n);
    getchar();

    printf("\nEnter the statements:\n");

    for (i = 0; i < n; i++)
    {
        printf("%d: ", i + 1);
        fgets(stmt[i].code, sizeof(stmt[i].code), stdin);

        stmt[i].code[strcspn(stmt[i].code, "\n")] = '\0';
    }

    findLeaders();
    printBasicBlocks();

    printf("\nData-flow analysis can now be performed "
           "on these basic blocks.\n");

    return 0;
}
