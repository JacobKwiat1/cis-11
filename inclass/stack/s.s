.global main

.section .data
    o: .asciz "%d\n"
.text
main:
    push {lr}
    //manually push number 25
    sub sp, #4
    mov r0, #25
    str r0, [sp]

    //pushing 16 to the stack
    sub sp, #4
    mov r0, #16
    str r0, [sp]

    //pop 16 from the top
    ldr r1, [sp]
    add sp, #4
    
    ldr r0, =o
    ldr r1, [sp]
    bl printf

    pop {pc}
