#include "stdio.h"
#include "stdint.h"

extern uint32_t addVal(uint32_t a, uint32_t b);

int main(){
    uint32_t a, b, c;
    a = 4;
    b = 2;
    c = addVal(a,b);

    printf("a = %d\n", a);
    printf("a = %d\n", b);
    printf("a = %d\n", c);
}