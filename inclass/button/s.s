.global .main
.extern wiringPiSetupGpio
.extern pinMode
.extern digitalWrite
.extern digitalRead
.extern delay

.equ PIN_LED, 17
.equ PIN_BUTTON, 18
.equ LOW, 0
.equ HIGH, 1
.equ INPUT, 0
.equ OUTPUT, 1

.text
main:
    push {lr}
    bl wiringPiSetupGpio

    mov r0, #PIN_BUTTON
    mov r1, #INPUT
    bl pinMode

    mov r0, #PIN_LED
    mov r1, #OUTPUT
    bl pinMode

    while:
        mov r0, #PIN_BUTTON
        bl digitalRead
        cmp r0, #HIGH
        beq down
        bne up
        down:
            mov r0, #PIN_LED
            mov r1, #HIGH
            bl digitalWrite
            bal delayLabel
        up:
            mov r0, #PIN_LED
            mov r1, #LOW
            bl digitalWrite
            bal delayLabel
        
        delayLabel:
            mov r0, #100
            bl delay
        
        bal while

    mov r0, #0
    pop {pc}