.global main

.section .data
    mph: .word 0
    time: .word 0
.section .rodata
    askS: .asciz "enter speed in mph\n"
    askT: .asciz "enter time in hours\n"
    out: .asciz "%d    %d\n"
    inpat: .asciz "%d"
.text

main:
    push {lr}
speed:
    ldr r0, =askS
    bl printf

    ldr r0, =inpat
    ldr r1, =mph
    bl scanf

    ldr r1, =mph
    ldr r1, [r1]
    cmp r1, #0
    blt speed
    mov r4, r1
hours:
    ldr r0, =askT
    bl printf

    ldr r0, =inpat
    ldr r1, =time
    bl scanf

    ldr r1, =time
    ldr r1, [r1]
    cmp r1, #0
    blt hours
    mov r5, r1
    mov r6, #0
    mov r7, #0
display:
    ldr r0, =out
    add r6, #1
    add r7, r5
    mov r1, r6
    mov r2, r7
    bl printf

    cmp r6, r4
    blt display

    mov r0, #0
    pop {pc}
