#include "stdio.h"

int abs(int x);

int main()  {
    int input;
    printf("enter number you'd like to approx. sqrt: ");
    scanf("%d", &input);
    if(input <= 0)  {
        printf("wtf");
    }

    int guess = input >> 1; //divide by 2
    int prevGuess;  //to determine convergence
    int i = 0;
    int t;
    //formula is (1/2)*(x_n + input/x_n)

    do{
        prevGuess = guess;
        t = input/guess;
        t += guess;
        t = t >> 1;
        guess = t;
        i++;
        printf("guess %d is %d\n", i, guess);
    } while( abs(guess - prevGuess) > 0);

    //out
    printf("the approximation of the sqrt of %d is %d\n", input, guess);
}

int abs(int x)  {
    return (x < 0) ? -x : x;
}