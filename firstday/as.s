.global main
.global passByVal

.section .data
    val1: .word 123
    val2: .word 100
    val3: .word 256

.section .rodata
    outVal1: .asciz "val1: %d\n"
    outVal2: .asciz "val2: %d\n"
    outVal3: .asciz "val3: %d\n"
    outPassByVal: .asciz "Pass by value fr\n\n"
    outSum: .asciz "sum: %d\n"
    outEndPass: .asciz "End pass by value fn\n\n"
.text
main:
    push {lr}
    //val1
    ldr r0, =outVal1
    ldr r1, =val1
    ldr r1, [r1]
    bl printf
    //val2
    ldr r0, =outVal2
    ldr r1, =val2
    ldr r1, [r1]
    bl printf
    //val3
    ldr r0, =outVal3
    ldr r1, =val3
    ldr r1, [r1]
    bl printf

    //load param for passsbyvalue
    ldr r0, =val1
    ldr r0, [r0]
    ldr r1, =val2
    ldr r1, [r1]
    ldr r2, =val3
    ldr r2, [r2]
    bl passByVal
    
    mov r0, #0
    pop {pc}

//passbyval function
passByVal:
    push {r4, r5, r6, lr}
    //save params because printf deletes my shit
    push {r0-r3} //saved params
    ldr r0, =outPassByVal
    bl printf
    pop {r0-r3}//put them back

    add r4, r0, r1
    add r4, r4, r2

    push {r0-r3}
    ldr r0, =outSum
    mov r1, r4
    bl printf
    pop {r0-r3}

    add r0, r0, #1  @a += 1
    add r1, r1, #3  @b += 3
    sub r2, r2, #4  @c -= 4

    //move a,b,c
    mov r4, r0
    mov r5, r1
    mov r6, r2

    ldr r0, = outVal1
    mov r1, r4
    bl printf

    ldr r0, = outVal2
    mov r1, r5
    bl printf

    ldr r0, = outVal3
    mov r1, r6
    bl printf

    ldr r0, =outEndPass
    bl printf

    //mov r0, #0 //don't need sense no return
    pop {r4, r5, r6, pc}
