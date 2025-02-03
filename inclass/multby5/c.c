#include "stdio.h"

int multBy5(int a);
int getInput();
void output(int in, int res);

int main()  {
    //output number
    int r3, r4;
    r4 = getInput();
    printf("here: %d", r4);
    r3 = multBy5(r4);
    output(r4, r3);
    return 0;
}

void output(int in, int res)    {
    printf("%d x 5 = %d", in, res);
}
int multBy5(int a)  {
   int b = a;
   a = a << 2;
   a = a + b;
   return a;
}

int getInput()  {
    int r1;
    printf("Enter a number to multiply by 5: ");
    scanf("%d", r1);
    return r1;
}