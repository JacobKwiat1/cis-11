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
    mov r0, #PIN_R
    mov r1, #OUTPUT
    bl pinMode

    mov r0, #PIN_G
    mov r1 #OUTPUT
    bl pinMode

    mov r0, #PIN_G
    mov r1 #OUTPUT
    bl pinMode

    mov r0, #PIN_BUTTON
    mov r1 #INPUT
    bl pinMode

    mov r4, #0
    mov r5, #0

    while:
        mov r0, #PIN_BUTTON
        bl digitalRead
        cmp r0, #HIGH
        moveq r5, #1
        movne r5, #0

        cmp r5, #0
        beq skip

        mov r0, r4
        bl rgb

        add r4, #1
        and r4, r4, #0b111

        skip:
        
        mov r0, #1000
        bl delay
    mov r0, #0
    pop {pc}


rgb:
    //r0 = phase
    push {r4, lr}
    mov r4, r0
    bl clear
    tst r4, #0b100
    movne r0, #PIN_R
    movne r1, #HIGH
    blne digitalWrite

    tst r4, #0b010
    movne r0, #PIN_G
    movne r1, #HIGH
    blne digitalWrite

    tst r4, #0b001
    movne r0, #PIN_B
    movne r1, #HIGH
    blne digitalWrite
    pop {r4, pc}

clear:
    push {lr}
    mov r0, #PIN_R
    mov r1, #LOW
    bl digitalWrite

    mov r0, #PIN_G
    mov r1, #LOW
    bl digitalWrite
    
    mov r0, #PIN_B
    mov r1, #LOW
    bl digitalWrite
    pop {pc}