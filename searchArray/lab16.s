.global main

.section .bss
    arr: .space 100
.section .data
    search: .word 0
.section .rodata
    prompt: .asciz "enter the number you would like to search for: "
    inpat: .asciz "%d"
    outNum: .asciz "value %d: %d\n"
    outRes: .asciz "found %d at place %d\n"
    unfound: .asciz "-1\n"
    test: .asciz "%d\n"
.text
main:
    push {lr}
    ldr r5, =arr
    mov r6, #0
    bl initRandom
    makeLoop:
        cmp r6, #25
        bge endMake
        mov r0, #100
        mov r1, #0
        bl getRand
        
        str r0, [r5, r6, lsl #2]
        add r6, #1
        bal makeLoop
    endMake:
    ldr r0, =arr
    mov r1, #25
    bl outArray

    ldr r0, =prompt
    bl printf

    ldr r0, =inpat
    ldr r1, =search
    bl scanf
    

    mov r6, #0
    ldr r5, =arr
    ldr r7, =search
    ldr r7, [r7]
    searchLoop:
    cmp r6, #25
    bge endSearch

    ldr r0, [r5, r6, lsl #2]
    cmp r7, r0
    beq found

    add r6, #1
    bal searchLoop
    found:
        ldr r0, =outRes
        ldr r1, =search
        ldr r1, [r1]
        add r2, r6, #1
        bl printf
        bal end
    endSearch:
        ldr r0, =unfound
        bl printf
    end:
    pop {pc}

outArray:
    stmdb sp!, {r4-r6, lr}
    mov r4, #0
    mov r5, r0
    mov r6, r1
    oaWhile:
        cmp r4, r6
        bge oaEnd

        ldr r2, [r5], #4
        add r1, r4, #1
        ldr r0, =outNum
        bl printf

        add r4, #1
        bal oaWhile
    oaEnd:
    ldmia sp!, {r4-r6, pc}
