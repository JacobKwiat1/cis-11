.global addVal

.section .rodata
    outRes: .asciz "the sqrt is %d\n"

.text
main:
    push {lr}

    add r2, r0, r1
    mov r0, r2

    pop {pc}
