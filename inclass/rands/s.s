.global main
.global divide

.section .data
    out: .asciz "%d\n"

.text
main:
push {lr}

mov r0, #0
bl time
bl srand

mov r4, #0
while:
    bl rand
    mov r1, #90
    lsr r0, #1
    bl divide
    add r1, #10
    ldr r0, =out
    bl printf
    add r4, #1
    cmp r4, #20
    blt while
mov r0, #0
pop {pc}

divide:
    push {lr}
    mov r3, #0
    loop:
        sub r0, r1
        add r3, #1
        cmp r0, #0
        bgt loop
        beq perfect
        blt norm
    perfect:
        mov r1, #0
        bal endDiv
    norm:
        mov r8, #0
        sub r1, r8, r0
        mov r0, r3
        sub r0, #1 
    endDiv:
        pop {pc}
