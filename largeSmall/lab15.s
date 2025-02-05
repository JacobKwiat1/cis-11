.global main
.global BandS

.section .data
    arr: .skip 40
    biggest: .word 2,147,483,647
    smallest: .word -2,147,483,648
.section .rodata
    prompt: .asciz "please enter value:\n"
    //out: .asciz "value %d: %d\n"
    outF: .asciz "the largest value was %d and the smallest was %d\n"
    comp: .asciz "comparing %d\n"
    inpat: .asciz "%d"

.text
main:
    push {lr}
    
    mov r5, #0
    ldr r4, =arr
    fillA:
        ldr r0, =prompt
        bl printf

        ldr r0, =inpat
        mov r1, r4
        bl scanf
        add r5, #1
        add r4, #4
        cmp r5, #10
        blt fillA
    ldr r0, =arr

    bl BandS
    mov r2, r0
    ldr r0, =outF
    bl printf
    @ ldr r4, =arr
    @ mov r5, #1
    @ loop:
    @     ldr r0, =out
    @     mov r1, r5
    @     ldr r2, [r4], #4
    @     bl printf
    @     cmp r5, #10
    @     add r5, #1
    @     blt loop

     pop {pc}

BandS:
    push {lr}
    ldr r1, =smallest
    ldr r2, =biggest
    ldr r1, [r1]
    ldr r2, [r2]
primary:
    //Load variables into registers
    cmp r0, r4
    beq end
    ldr r3, [r0], #4
    cmp r3, r1
    bgt ismax
    cmp r3, r2
    blt ismin
    bal primary

ismin:
    mov r2, r3
    bal primary
ismax:
    mov r1, r3
    cmp r3, r2
    blt ismin
    bal primary
end:

    mov r0, r2

    pop {pc}
