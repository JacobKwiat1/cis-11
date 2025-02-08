.global main
.section .Bss
    array: .space 20
    total: .space 4
.section .data
    len: .word 5

.section .rodata
    outprompt: .asciz "enter numbers for summing\n"
    outRes: .asciz "The sum is %d\n"
    outIn: .asciz "Enter number %d: "
    inpat: .asciz "%d"

.text
main:
    push {lr}

    ldr r0, =outprompt
    bl printf

    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl input

    ldr r0, =array
    ldr r1, =len
    ldr r1, [r1]
    bl sum
    ldr r1, =total
    str r0, [r1] //store sum from function and save it into total

    ldr r0, =outRes
    ldr r1, [r1]
    bl printf

        mov r0, #0
    pop {pc}

sum:
    stmdb sp!, {r4, lr}
    mov r2, #0
    mov r3, #0
    sWhile:
        cmp r3, r1
        bge sEnd

        ldr r4, [r0, r3, lsl #2] //a + (i*4)
        add r2, r4
        add r3, #1
        bal sWhile
    sEnd:
    mov r0, r2
    ldmia sp!, {r4, pc}

input:
    stmdb sp!, {lr}
    mov r2, #0
    iWhile:
        cmp r2, r1
        bge iEnd
        stmdb sp!, {r0-r2}    
        ldr r0, =outIn
        add r2, #1
        mov r1, r2
        bl printf
        ldmia sp!, {r0-r2}
        
        stmdb sp!, {r0-r2}
        add r1, r0, r2, lsl #2
        ldr r0, =inpat
        bl scanf
        ldmia sp!, {r0-r2}
        add r2, #1
        bal iWhile
        iEnd:
    ldmia sp!, {pc}
