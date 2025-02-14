.global main

.section .data
    input: .float 0
    five: .float 5.0

.section .rodata
    outprompt: .asciz "Enter 5 numbers to average\n"
    outInLoop: .asciz "Enter number %d: "
    InFloat: .asciz "%f"
    outRes: .asciz "Your average is %f\n"
.text
main:
    push {lr}
    ldr r0, =outprompt
    bl printf

    vldr s0, =#0

    mov r6, #0
    loop:
        cmp r6, #5
        bge endLoop

        ldr r0, =outInLoop
        mov r1, r6
        add r1, #1
        bl printf

        ldr r0, =InFloat
        ldr r1, =input
        bl scanf

        ldr r0, =input
        vldr s2, [r0]
        vadd.f32 s8, s2
        add r6, #1
        bal loop
    endLoop:
    //ldr r0, =five


    //vldr s2, [r0]

    //vdiv.f32 s0, s2
    @ ldr r0, =outRes
    @ vcvt.f64.f32 d2, s8
    @ vmov r1, r2, d2

    ldr r0, =five
    vldr s2, [r0]
    vdiv.f32 s8, s8, s2
    vcvt.f64.f32 d2, s8

    ldr r0, =outRes
    vmov r1, r2, d2
    bl printf
    pop {pc}
