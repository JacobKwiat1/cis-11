.global main
.section .rodata    
    inPat: .asciz "%d"
    out: .asciz "read in %d\n"

.text
main:
    str lr, [sp, #-4]!

    ldr r0, =inPat
    sub sp, #4 //make space in stack for input
    mov r1, sp //copy sp address into r1
    bl scanf
    
    ldr r1, [sp], #4
    ldr r0, =out
    bl printf

    ldr pc, [sp], #4
