#include <stdio.h>

int is_little(void)
{
    int x = 1;
    char *p = (char *)&x;

    return (*p == 1);
}

void num2string(char *s, int num, int base)
{
    char *start = s;

    // Caso base: num = 0
    if (num == 0)
    {
        *s++ = '0';
        *s = '\0';
        return;
    }

    // Converte o número
    while (num > 0)
    {
        int digit = num % base;

        if (digit < 10)
            *s++ = '0' + digit;
        else
            *s++ = 'A' + digit - 10;

        num /= base;
    }

    // Finalizador da string
    *s = '\0';

    // Inverte a string
    char *end = s - 1;

    while (start < end)
    {
        char temp = *start;
        *start = *end;
        *end = temp;

        start++;
        end--;
    }
}

int main(void)
{
    if (is_little())
        printf("A memoria e little-endian\n");
    else
        printf("A memoria e big-endian\n");

    char s[100];

    num2string(s, 50, 2);

    printf("50 na base 2: %s\n", s);

    return 0;
}
