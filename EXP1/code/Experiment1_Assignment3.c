#include <stdio.h>
int main()
{
    char str[100];
    int state = 0;
    int i;
    printf("Enter the string: ");
    scanf("%s", str);
    for(i = 0; str[i] != '\0'; i++)
    {
        switch(state)
        {
            case 0:
                if(str[i] == 'a')
                    state = 1;
                else
                    state = -1;
                break;
            case 1:
                if(str[i] == 'a')
                    state = 2;
                else
                    state = -1;
                break;
            case 2:
                state = -1;
                break;
        }
        if(state == -1)
            break;
    }
    if(state == 2 && str[i] == '\0')
        printf("\nString Accepted.");
    else
        printf("\nString Rejected.");
    return 0;
}