.global main

.section .data //Initialized Variables
    grade: .word 0

.section .rodata //Readonly Data
    inPat: .asciz "%d"
    prmpt: .asciz "Enter grade: "
    outRslt: .asciz "final grade: %c\n"

.section .bss //Uninitialized Variables

.text
main:
    push {lr}

    //Prompt1
    ldr r0, =prmpt
    bl printf
    //user input
    ldr r0, =inPat
    ldr r1, =grade
    bl scanf

    //Load variables into registers

    ldr r2, =grade //address
    ldr r2, [r2]   //value
    cmp r2, #59
    bgt over1
    mov r1, #'F'
    ldr r0, =outRslt
    bl printf
    bal end
over1:
    cmp r2, #69
    bgt over2
    mov r1, #'D'
    ldr r0, =outRslt
    bl printf
    bal end
over2:
    cmp r2, #79
    bgt over3
    mov r1, #'C'
    ldr r0, =outRslt
    bl printf
    bal end
over3:
    cmp r2, #89
    bgt over4
    mov r1, #'B'
    ldr r0, =outRslt
    bl printf
    bal end
over4:
    mov r1, #'A'
    ldr r0, =outRslt
    bl printf
    bal end
end:
    mov r0, #0

    //Resume where I left off
    pop {pc}
