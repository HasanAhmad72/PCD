#include <stdio.h>
#include <string.h>

struct op
{
    char l;
    char r[20];
} op[10], pr[10];

int main()
{
    int i, j, k, n, z = 0;
    char temp;
    char *p;

    printf("Enter the number of values: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++)
    {
        printf("left: ");
        scanf(" %c", &op[i].l);

        printf("right: ");
        scanf(" %s", op[i].r);
    }

    printf("\nIntermediate Code\n");

    for (i = 0; i < n; i++)
        printf("%c = %s\n", op[i].l, op[i].r);

    /* Dead Code Elimination */
    for (i = 0; i < n - 1; i++)
    {
        temp = op[i].l;

        for (j = 0; j < n; j++)
        {
            p = strchr(op[j].r, temp);

            if (p)
            {
                pr[z].l = op[i].l;
                strcpy(pr[z].r, op[i].r);
                z++;
                break;
            }
        }
    }

    pr[z].l = op[n - 1].l;
    strcpy(pr[z].r, op[n - 1].r);
    z++;

    printf("\nAfter Dead Code Elimination\n");

    for (k = 0; k < z; k++)
        printf("%c = %s\n", pr[k].l, pr[k].r);

    /* Common Expression Elimination */
    printf("\nEliminate Common Expression\n");

    for (i = 0; i < z; i++)
    {
        for (j = i + 1; j < z; j++)
        {
            if (strcmp(pr[i].r, pr[j].r) == 0)
                pr[j].l = '\0';
        }
    }

    printf("\nOptimized Code\n");

    for (i = 0; i < z; i++)
    {
        if (pr[i].l != '\0')
            printf("%c = %s\n", pr[i].l, pr[i].r);
    }

    return 0;
}
