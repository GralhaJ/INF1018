#include <stdio.h>

int main(void){
    char a;

    a = 'A';
    printf("a = %c e a = %d\n", a, a);

    a = 70;
    printf("a = %c e a = %d\n", a, a);

    a = 260;
    printf("a = %c e a = %d\n", a, a);

    a = 0x30;
    printf("a = %c e a = %d\n", a, a);

    return 0;
}