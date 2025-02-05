.global main

.section .data

.section .rodata
    out: .asciz "%d\n"
.text

main:
    stmdb sp!, {lr}//same as push {lr}

    mov r0, #25
    //preindexing to store value 25
    //adds offset (-4) to address in sp first, then accesses the new address
    //!saves the new address into sp. Not always necessary
    str r0, [sp, #-4]! //save r0 into the stack and write the stack address to the sp register
    ldr r0, =out

    //postindexing to load the value of 25
    //loads from sp, then adds the offset, then writes back the new address
    ldr r1, [sp], #4
    bl printf

    mov r0, #0

    ldmia sp!, {pc} //pop {pc}
    pop {pc}
