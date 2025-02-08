#include "stdio.h"
#include "stdlib.h"
#include "time.h"
void input(int*, int);
void outArr(int*, int);
void bubbleSort(int*, int);


void input(int *a, int n)   {
    //user input
    // for(int i = 0; i < n; i++)  {
    //     printf("Enter a[%d]: ", i+1);
    //     scanf("%d", &a[i]);
    // }
    //random numbere
        for(int i = 0; i < n; i++)  {
            a[i] = rand() % 90 + 10;
    }

}

void outArr(int *a, int n)  {
    for(int i = 0; i < n; i++)  {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void bubbleSort(int *a, int n)  {
    int x = n-1;
    for(int i = 0; i < x; i++)  {
        for(int j = 0; j < x; j++)  {
            if(a[j] > a[j+1])   {
                int temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
}

int main()   {
    int len = 5;
    int array[len];
    input(array, len);

    printf("Sorted Array!\n");
    bubbleSort(array, len);
    outArr(array, len);

}