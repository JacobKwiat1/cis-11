.global main

.section .data
num1: .float 0
num2: .float 0

.section .rodata
    outprompt: .asciz "Enter 2 numbers %%f %%f\n"
    inPat: .asciz "%f %f"
    outLess: .asciz "num1 is less than num2\n"
    outMore: .asciz "num1 is more than num2\n"
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
    
    //to use floating point status registers for branching I need to copy it
    vmrs APSR_nzcv, FPSCR
    blt less
    bgt more
    equal:
        ldr r0, =outEqual
        bl printf
        bal end
    less:
        ldr r0, =outLess
        bl printf
        bal end
    more:
        ldr r0, =outMore
        bl printf
        bal end

    end:

    pop {pc}
