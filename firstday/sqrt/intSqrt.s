.global main
.extern intSqrt

.section .rodata
    outRes: .asciz "the sqrt is %d\n"

.text
main:
    push {lr}

    mov r0, #4
    bl intSqrt

    mov r1, r0
    ldr r0, =outRes
    bl printf

    pop {pc}
    