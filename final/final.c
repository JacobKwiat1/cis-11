#include "stdio.h"
#include "wiringPi.h"
#include "stdbool.h"

#define PIN_LED1 0
#define PIN_LED2 0
#define PIN_BUTTON 0

int main()  {
    pinMode(PIN_LED1, OUTPUT);
    pinMode(PIN_LED2, OUTPUT);
    pinMode(PIN_BUTTON, INPUT);
    
}
