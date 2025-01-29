.global main
.global getInputs
.extern intSqrt //DO NOT REMOVE


.align 4
.section .data
// your data here
    sideA: .word 0
    sideB: .word 0
.align 4
.section .rodata
// your read only data here
    askA: .asciz "enter side A: "
    askB: .asciz "enter side B: "
    outError: .asciz "please enter values greater than 0\n"
    inpat: .asciz "%d"
    output: .asciz "the hypotenuse of a triangle with sides of length %d and %d is %d\n"
.text
main:
    push {lr}
	
	// this is dummy code to show you how to use the intSqrt function
	// you can erase this and put your code here
	bl getInputs
    mov r4, r0
    mov r5, r1

    mul r0, r4, r4
    mul r1, r5, r5

    add r0, r1

    bl intSqrt                 // Call a square root routine

    mov r3, r0
    mov r2, r5
    mov r1, r4
    ldr r0, =output
    bl printf

    pop {pc} // should return 2 if the sqrt is working

getInputs:
    push {lr}
    gido:
        ldr r0, =askA
        bl printf
        ldr r0, =inpat
        ldr r1, =sideA
        bl scanf
        ldr r0, =sideA
        ldr r0, [r0]
        cmp r0, #1
        blt error
        
        ldr r0, =askB
        bl printf
        ldr r0, =inpat
        ldr r1, =sideB
        bl scanf
        ldr r0, =sideB
        ldr r0, [r0]
        cmp r0, #1
        blt error
        bal giEnd
    error:
        ldr r0, =outError
        bl printf
        bal gido

    giEnd:
        ldr r0, =sideA
        ldr r0, [r0]
        ldr r1, =sideB
        ldr r1, [r1]
        pop {pc}
