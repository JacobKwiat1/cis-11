.global main

.extern wiringPiSetupGpio
.extern pinMode
.extern digitalRead
.extern delay
.extern digitalWrite

.equ PIN_R, 5
.equ PIN_G, 6
.equ PIN_B, 21
.equ PIN_BUTTON, 12
.equ HIGH, 1
.equ LOW, 0
.equ INPUT, 0
.equ OUTPUT, 1

.text
main:
    push {lr}

    bl wiringPiSetupGpio

    mov r0, #PIN_LED
    mov r1, #OUTPUT
    bl pinMode

    mov r0, #PIN_BUTTON
    mov r1, INPUT

    mov r4, #0
    mov r5, #0

    while:
        mov r0, #PIN_BUTTON
        bl digitalRead
        mov r6, r0

        cmp r6, #1
        bne skip
        cmp r5, #0
        bne skip

        eor r4, r4, #1

        mov r0, #PIN_LED
        mov r1, r4
        bl digitalWrite

        skip:

        mov r5, r6

        mov r0, #50
        bl delay
        bal while
    
    mov r0, #0
    pop {pc}