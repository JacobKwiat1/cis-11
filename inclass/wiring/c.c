#include "stdio.h"
#include "wiringPi.h"
#include "stdbool.h"

#define PIN_LED 21

int main(){
    //initialize
    wiringPiSetupGPIO();
    
    //set pin mode
    pinMode(PIN_LED, OUTPUT);

    bool on = false;

    while(true){
        if(on){
            //turn on the pin
            digitalWrite(PIN_LED, HIGH); //turn pin 21 on
            on = false;
        }
        else {
            digitalWrite(PIN_LED, LOW); //turn pin 21 off
            on = true;
        }
        //delay for visibility in miliseconds
        delay(250);
    }
    return 0;
}
