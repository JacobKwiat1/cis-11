.global main

.section .data //Initialized Variables
    num1: .word 0
    num2:  .word 0
    num3: .word 0

.section .rodata //Readonly Data
    inPat: .asciz "%d"
    prmpt1: .asciz "Enter the first number: "
    prmpt2: .asciz "Enter the second number: "
    prmpt3: .asciz "Enter the third number: "
    outRslt: .asciz "largest number: %d\n"

.section .bss //Uninitialized Variables

.text
main:
    push {lr}

    //Prompt1
    ldr r0, =prmpt1
    bl printf
    //user input
    ldr r0, =inPat
    ldr r1, =num1
    bl scanf

    //Prompt2
    ldr r0, =prmpt2
    bl printf
    //Get user input
    ldr r0, =inPat
    ldr r1, =num2
    bl scanf

    //prompt3
    ldr r0, =prmpt3
    bl printf
    //user input
    ldr r0, =inPat
    ldr r1, =num3
    bl scanf

    //Load variables into registers

    ldr r2, =num1 //address
    ldr r2, [r2]   //value
    ldr r3, =num2  //address
    ldr r3, [r3]   //value    
    ldr r4, =num3
    ldr r4, [r4]
    //start comparing
    cmp r2, r3
    bgt isMore 
    cmp r3, r4
    blt isNum3
    mov r1, r3
    ldr r0, =outRslt
    bl printf
    bal end

isMore:
    cmp r2, r4
    blt isNum3
    mov r1, r2
    ldr r0, =outRslt
    bl printf
    bal end
isNum3:
    mov r1, r4
    ldr r0, =outRslt
    bl printf
    bal end
end:
    mov r0, #0

    //Resume where I left off
    pop {pc}
