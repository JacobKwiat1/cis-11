.global main

.section .data
num1: .float 0
num2: .float 0

.section .rodata
    outprompt: .asciz "Enter 2 numbers %%f %%f\n"
    inPat: .asciz "%f %f"

.text
main:
    push {lr}

    ldr r0, =outprompt
    bl printf

    ldr r0, =inPat
    ldr r1, =num1
    ldr r2, =num2
    bl scanf

    ldr r0, =num1
    vldr s0, [r0]

    ldr r1, =num2
    vldr s2, [r1]

    vcmp.f32 s0, s2
    
    pop {pc}
