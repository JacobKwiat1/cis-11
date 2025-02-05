.global main
.global celsius

.section .data
    head: .asciz "F\tC\n"
    out: .asciz "%d\t%d\n"
.section .rodata

.text
main:
    push {lr}
    mov r4, #31
    ldr r0, =head
    bl printf
    loop:
        add r4, #1
        mov r0, r4
        bl celsius
        mov r2, r0
        mov r1, r4
        ldr r0, =out
        bl printf
        cmp r4, #100
        blt loop
    mov r0, #0
    pop {pc}

celsius:
    push {lr}
    sub r0, #32
    mov r1, #5
    mul r0, r1
    mov r1, #9
    bl divMod
    pop {pc}
