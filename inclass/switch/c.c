#include "wiringPi.h"
#include "stdbool.h"
#include "stdio.h"

#define PIN_LED 18
#define PIN_BUTTON 16

int main() {
    wiringPiSetupGpio();

    pinMode(PIN_LED, OUTPUT);
    pinMode(PIN_BUTTON, INPUT);

    int ledState = 0;
    int prevBtnState = 0;

    while(1) {
        prevBtnState = digitalRead(PIN_BUTTON);
        int currentBtnState = digitalRead(PIN_BUTTON);
        if(prevBtnState == 1 && ledState == 0)   {
            printf("pressed the button\n");
            ledState = !ledState;
            digitalWrite(PIN_LED, ledState);
        }

        prevBtnState = currentBtnState;


        delay(50);
    }
}
