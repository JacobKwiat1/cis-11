
.global _start

.section .rodata
    hello: .ascii "Hello World\n"

.section .data

.section .bss

.text

_start:
    //4 into r7 write instruction
    mov r7, #4
    //1 into r0 for output to terminal
    mov r0, #1
    // words into r1
    ldr r1, =hello
    // length of words
    mov r2, #12
    //do stuff
    swi 0
    //exit command
    mov r7, #1
    //error code
    mov r0, #0
    swi 0
