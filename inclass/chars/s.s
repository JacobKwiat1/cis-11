.global main
.section .data
    in: .asciz "%c"
    n: .word 0
.text
main:
    push {lr}

    ldr r0, =in
    ldr r1, =n
    bl scanf

    ldr r0, =n
    ldr r0, [r0]

    cmp r0, #67
    moveq r0, #0
    movne r0, #255


    pop {pc}
