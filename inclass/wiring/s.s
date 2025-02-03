.global main
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalWrite
.extern delay

.equ PIN_LED. 21
.equ LOW, 0
.equ HIGH, 1
.equ INPUT, 0
.equ OUTPUT, 1

.text
main:
push {lr}

bl wiringPiSetupGpio

//pinMode(PIN_LED, OUTPUT);
mov r0, #PIN_LED
mov r1, OUTPUT
bl pinMode

mov r4, #0
while:
    cmp r4, #1
    beq on
    bne off
    on:
        mov r0, #PIN_LED
        mov r1, #HIGH
        bl digitalWrite
        mov r4, #0
        bal delayLabel
    off:
        mov r0, #PIN_LED
        mov r1, #LOW
        bl digitalWrite
        mov r4, #1
        bal delayLabel    

    delayLabel:
        mov r0, #250
        bl delay
    
    bal while

mov r0, #0
pop {pc}
