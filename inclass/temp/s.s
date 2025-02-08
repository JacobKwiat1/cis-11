.global main

.section .bss
    array: .space 20
.section .data
    len: .word 5
.section .rodata
    outBefore: .asciz "Before sorting\n"
    outAfter: .asciz "Sorted array!\n"
    outNum: .asciz "%d "
    newline: .asciz "\n"
.text
main:
    stmdb sp!, {lr}

    bl initRandom
    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl input

    ldr r0, =outBefore
    bl printf

    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl outArray

    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl bubbleSort

    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl outArray

    ldmia sp!, {pc}

bubbleSort:
    stmdb sp!, {lr}
    sub r1, #1
    mov r2, #0
    bsForOut:
        cmp r2, r1
        bge bsEndOut
        mov r3, #0
        bsForIn:
            cmp r3, r1
            bge bsEndIn
            add r4, r0, r3, lsl #2 //new address with the offset
            ldr r5, [r4] //value of a[j]
            add r6, r3, #1
            add r6, r0, r6, lsl #2 //a[j+1] address
            ldr r7, [r6]

            cmp r5, r7
            ble noswap
            str r7, [r4]
            str r5, [r6]

            noswap:
            add r3, #1
            bal bsForIn
        bsEndIn:
        add r2, #1
        bal bsForOut
    bsEndOut:

    ldmia sp!, {pc}

input:
    stmdb sp!, {r4-r6, lr}
    mov r4, #0
    mov r5, r0
    mov r6, r1
    iWhile:
        cmp r4, r6
        bge iEnd
        mov r0, #90
        mov r1, #10  
        bl getRand
        //str where, [to, offset, shift]
        str r0, [r5, r4, lsl #2]//r5 +r4*4

        add r4, #1
        bal iWhile
    iEnd:
    ldmia sp!, {r4-r6, pc}

outArray:
    stmdb sp!, {r4-r6, lr}
    mov r4, #0
    mov r5, r0
    mov r6, r1
    oaWhile:
        cmp r4, r6
        bge oaEnd

        ldr r1, [r5], #4
        ldr r0, =outNum
        bl printf

        add r4, #1
        bal oaWhile
    oaEnd:
    ldr r0, =newline
    bl printf
    ldmia sp!, {r4-r6, pc}
