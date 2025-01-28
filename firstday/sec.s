.global main
.global factorial

.section .data
    val: .word 0
.section .rodata
    instuff: .asciz "%d"
    outPrmpt: .asciz "Enter a number from 1-12:\n"
    outFin: .asciz "The factorial is %d\n"
.text

main:
    push {lr}
    ldr r0, =outPrmpt
    bl printf
    ldr r1, =val
    ldr r0, =instuff
    bl scanf

    ldr r1, =val
    ldr r1, [r1]
    cmp r1, #1
    blt main
    cmp r1, #12
    bgt main

    mov r0, r1

    bl factorial
    mov r1, r0
    
    ldr r0, =outFin
    bl printf

    mov r0, #0
    pop {pc}

factorial:
    push {lr}
    cmp r0, #0
    beq baseCase

    push {r0}
    sub r0, #1
    bl factorial

    pop {r1}
    //r0 == (n-1)!
    //r1 == n
    mul r0, r1
    bal exitCase

baseCase:
    mov r0, #1
exitCase:
    pop {pc}
