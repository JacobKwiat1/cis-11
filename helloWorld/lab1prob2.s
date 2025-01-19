.global main

.section .data

.section .rodata
    //char* hello = "Hello World\n"
    hello: .asciz "Hello World\n"
    format: .asciz "%s"

.section .bss

.text
main:
    //push onto stack for temp storage
    push {lr} //start and end point
    //load the format
    ldr r0, =format
    //load string
    ldr r1, =hello
    //print
    bl printf
    //return 0
    mov r0, #0
    //pop from stack
    pop {pc}
