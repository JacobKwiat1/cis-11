#include "stdio.h"
#include "stdlib.h"
#include "time.h"

int main(){
    //seed to make the random number better
    srand(time(0));

    for(int i = 0; i < 20; i++) {
        //if I want 0-90 then it is just the rand % 90
        int a = rand()%90 + 10; //inclusive 10-99
        printf( "%d\n", a);
    }
}
