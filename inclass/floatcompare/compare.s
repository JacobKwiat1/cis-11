.global main
.section .data
    a: .float 1.0000001
    b: .float 1.0000002
    delta: .float 0.00001
.section .rodata
    outEq: .asciz "equal\n"
    outNe: .asciz "not equal\n"
    outDelEq: .asciz "equal within delta\n"
    outDelNe: .asciz "not equal within delta\n"
.text
main:
    push {lr}

    ldr r0, =a
    vldr s0, [r0]
    ldr r0, =b
    vldr s2, [r0]

    vcmp.f32 s0, s2

    ldreq r0, =outEq
    ldrne r0, =outNe

    bl printf


    vsub.f32 s4, s0, s2
    vabs.f32 s4, s4
    //load delta
    ldr r0, =delta
    vldr s5, [r0]
    vcmp.f32 s4, s5
 
    vmrs APSR_nzcv, FPSCR

    ldrlt r0, =outDelEq
    ldrge r0, =outDelNe
    bl printf

    mov r0, #0
    pop {pc}
