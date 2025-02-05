.global main
.global sumArr

.section .data
    arr: .word 10, 20, 30, 40, 50 //defined array
.section .rodata
    outSum: .asciz "sum is %d\n"
    outStep: .asciz "%d + %d\n"
.text
main:
    stmdb sp!, {lr}

    ldr r0, =arr
    mov r1, #5
    bl sumArr

    mov r1, r0
    ldr r0, =outSum
    bl printf

    mov r0, #0
    ldmia sp!, {pc}

sumArr:
    stmdb sp!, {lr}
   mov r4, #0 //sum
   mov r5, #0 //counter
    loop:
        cmp r5, r1
        bgt endWhile
        stmdb sp!, {r0, r1} //push {r0, r1}
        ldr r2, [r0]
        mov r1, r4
        ldr r0, =outStep
        bl printf
        ldmia sp!, {r0, r1} //pop {r0,r1}

        ldr r2, [r0], #4 //load value from array and increment after
        add r4, r2
        add r5, #1
        bal loop
    endWhile:
    mov r0, r4
    ldmia sp!, {pc}
