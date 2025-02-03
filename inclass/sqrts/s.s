.global main
.global getInput
.global abs
.global isqrt

.section .data
    input: .word 0
.section .rodata
    outPrompt: .asciz "enter the number you'd like to approx. sqrt: "
    outFin: .asciz "the approximation of the sqrt of %d is %d\n"
    outWhile: .asciz "guess %d is %d\n"
    inpat: .asciz "%d"
.text

main:
    push {lr}
    bl getInput
    mov r4, r0
    bl isqrt
    mov r0, #0
    pop {pc}

getInput:
    push {lr}
    gido:
        ldr r0, =outPrompt
        bl printf
        ldr r0, =inpat
        ldr r1, =input
        bl scanf
        ldr r0, =input
        ldr r0, [r0]
        cmp r0, #0
        blt gido
    pop {pc}

abs:
    push {lr}
    cmp r0, #0
    bgt absEnd
    rsb r0, r0, #0
    absEnd:
    pop {pc}

isqrt:
    push {lr}
    //r5 prevGuess, r6 guess, r7 t, r8 i, r4 input
    lsr r6, r4, #1
    mov r8, #0
    @ ldr r6, [r6]
    @ ldr r8, [r8]

    sqrtdo:
    mov r5, r6
    mov r0, r4
    mov r1, r6
    bl divide
    mov r7, r0
    @ ldr r7, [r7]
    add r7, r6
    lsr r7, #1
    mov r6, r7
    add r8, #1

    ldr r0, =outWhile
    mov r1, r8
    mov r2, r6
    bl printf

    sub r0, r6, r5
    bl abs
    cmp r0, #0
    bgt sqrtdo
    pop {pc}

divide:
    push {lr}
    mov r3, #0
    loop:
        sub r0, r1
        add r3, #1
        cmp r0, #-1
        bgt loop
    mov r0, r3
    sub r0, #1 
    pop {pc}
