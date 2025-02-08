.global main

.section .rodata
    Output: .asciz  "%d\n"
.text
main:
    stmdb sp!, {lr}

    bl initRandom

    mov r4, #0
    while:
        cmp r4, #100
        bge end

        mov r0, #90
        mov r1, #10
        bl getRand

        mov r1, r0
        ldr r0, =Output
        bl printf

        add r4, #1
        bal while
    ldmia sp!, {pc}

