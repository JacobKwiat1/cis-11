#include "stdio.h"

int sumArr(int *arr, int size);

int main()  {
    int arr[] = {10, 20, 30, 40, 50};
    int size = 5;
    int sum = sumArr(arr, size);
    printf("sum is %d\n", sum);
    return 0;
}

int sumArr(int *arr, int size)  {
    int sum = 0;
    int i = 0;
    while(i < size) {
        sum += arr[i];
        printf("%d + %d\n", sum, arr[i]);
        i++;
    }
    return sum;
}
