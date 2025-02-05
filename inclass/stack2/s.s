.global main
.data
    out: .asciz "%d\n"

.text

main:
    push {lr}

    mov r0, #25
    stmdb sp!, {r0}
    
    mov r0, #16
    //! means write back and no ! means it won't write or make the space
    stmdb sp!, {r0}

    mov r0, #0
    pop {pc}
