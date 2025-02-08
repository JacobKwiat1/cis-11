.global main
.global sort

.section .data
    goal: .word 0
    temp: .word 0
    arr: .word 3, 7, 23, 4, 8, 45, 34, 9, 87, 2
    len: .word 10
.section .rodata
    head: .asciz "F\tC\n"
    outC: .asciz "The temperature in Celsius is %d\n"
    outF: .asciz "The temperature in Fahrenheit is %d\n"
    outK: .asciz "The temperature in Kelvin is %d\n"
    ask: .asciz "What do you want to convert a temperature to (C or F or K):\n"
    getC: .asciz "Enter the temperature in Celsius:\n"
    getF: .asciz "Enter the temperature in Fahrenheit:\n"
    getK: .asciz "Enter the temperature:\n"
    prmptK: .asciz "What will you be converting from (C or F):\n"
    inpat: .asciz "%c"
    inNum: .asciz "%d"
    outBefore: .asciz "Before sorting\n"
    outAfter: .asciz "Sorted array!\n"
    outNum: .asciz "%d "
    newline: .asciz "\n"

.text
main:
    push {lr}
    ldr r0, =arr
    ldr r1, =len
    ldr r1, [r1]
    bl sort
    ldr r0, =arr
    ldr r1, =len
    ldr r1, [r1]
    bl outArray
    pop {pc}

sort:
    push {r4-r8, lr}
    mov r6, r0
    mov r7, r1
    mov r4, #0
    out:
    cmp r4, r7
    bge endOut
        add r5, r4, #1
        ldr r0, [r6, r4, lsl #2]
        in:
            cmp r5, r7
            bge endIn
            
            ldr r1, [r6, r5, lsl #2]
            cmp r0, r1
            blt skip

            add r8, r6, r5, lsl #2
            str r0, [r8]
            add r8, r6, r4, lsl #2
            str r1, [r8]
            ldr r0, [r6, r4, lsl #2]
            skip:
            add r5, #1
            bal in
        endIn:
        add r4, #1
        bal out
    endOut:
    pop {r4-r8, pc}

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
