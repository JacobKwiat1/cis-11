.global main

.section .data //Initialized Variables
    bYear: .word 0
    year:  .word 0

.section .rodata //Readonly Data
    inPat: .asciz "%d"
    prmpt1: .asciz "Enter your birth year: "
    prmpt2: .asciz "Enter the current year: "
    outRslt: .asciz "Your age: %d\n"

.section .bss //Uninitialized Variables

.text
main:
    push {lr}

    //Prompt user to input birth year
    ldr r0, =prmpt1
    bl printf
    //user input
    ldr r0, =inPat
    ldr r1, =bYear
    bl scanf

    //Prompt user to input current year
    ldr r0, =prmpt2
    bl printf
    //Get user input
    ldr r0, =inPat
    ldr r1, =year
    bl scanf

    //Load variables into registers
    ldr r2, =bYear //address
    ldr r2, [r2]   //value
    ldr r3, =year  //address
    ldr r3, [r3]   //value    
    sub r1, r3, r2

    ldr r0, =outRslt
    bl printf

    mov r0, #0

    //Resume where I left off
    pop {pc}
