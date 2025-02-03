.global main
.global multby5
.global getInput
.global output

.section .data
    input: .word 0
.section .rodata
    outRes: .asciz "%d x 5 = %d\n"
    outPrompt: .asciz "Enter a number to multiply by 5: "
    inpat: .asciz "%d"
.text

main:
    push {lr}
    bl getInput
    mov r4, r0
    bl multby5
    mov r1, r0
    mov r0, r4
    bl output
    mov r0, #0
    pop {pc}

multby5:
    push {lr}
    add r0, r0, r0, lsl #2
    pop {pc}

getInput:
    push {lr}
    ldr r0, =outPrompt
    bl printf
    ldr r1, =input
    ldr r0, =inpat
    bl scanf
    ldr r0, =input
    ldr r0, [r0]
    pop {pc}

output:
    push {lr}
    push {r0, r1}
    ldr r0, =outRes
    pop {r1, r2}
    bl printf
    pop {pc}
