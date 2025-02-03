.global main
.global .fallingDistance
.section .data
    distance: .word 0
    g: .word 9
.section .rodata
    out: .asciz "distance for %d seconds is %dm\n"
.text

main:
    push {lr}
    mov r4, #0
    loop:
        add r4, #1
        mov r0, r4
        bl fallingDistance
        mov r2, r0
        mov r1, r4
        ldr r0, =out
        bl printf
        cmp r4, #10
        blt loop
    pop {pc}
    
    fallingDistance:
        push {lr}
        ldr r1, =g
        ldr r1, [r1]
        mul r0, r0
        mul r0, r1
        mov r1, #2
        lsr r0, #1
        pop {pc}
