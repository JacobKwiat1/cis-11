#include "stdio.h"
#include "wiringPi.h"
#include "stdbool.h"

#define PIN_R 5
#define PIN_G 6
#define PIN_B 21
#define PIN_BUTTON 12


int main(){
    wiringPiSetupGpio();

    pinMode(PIN_R, OUTPUT);
    pinMode(PIN_G, OUTPUT);
    pinMode(PIN_B, OUTPUT);
    pinMode(PIN_BUTTON, INPUT);
    int phase = 0;
    bool on = true;

    while(1){
        if(digitalRead(PIN_BUTTON) == HIGH){
            on = true;
        }
        else {
            on = false;
        }

        if(on){
            rgb(phase);
            printf("phase%d\n", phase);
            phase = (phase + 1) & 0b111;
        }
        delay(1000);
    }
}

void rgb(int phase){
    if(phase & 0b100) digitalWrite(PIN_R, HIGH);
    if(phase & 0b010) digitalWrite(PIN_G, HIGH);
    if(phase & 0b001) digitalWrite(PIN_B, HIGH);

    return;
}

void clear(){
    digitalWrite(PIN_R, LOW);
    digitalWrite(PIN_G, LOW);
    digitalWrite(PIN_B, LOW);
}