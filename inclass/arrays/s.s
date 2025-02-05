.global main

.section .data
    arr: .skip 100 //25*4bytes
.section .rodata
    out: .asciz "a[%d] = %d\n"
.text
main:
    push {lr}

    ldr r0, =arr
    mov r1, #25
    bl outputArr

    ldr r0, =arr
    mov r4, #0
    for:
        cmp r4, #25
        bge end

        str r4, [r0]

        add r0, #4
        add r4, #1
        bal for
    
    end:

    ldr r0, =arr
    mov r1, #25
    bl outputArr


    mov r0, #0
    pop {pc}

outputArr:
    push {r4, lr}
    mov r4, #0
    oaFor:
    //r0 = array address, r1 = size of array
        cmp r4, r1
        bge oaEnd

        push {r0-r1}
        ldr r2, [r0]
        mov r1, r4
        ldr r0, =out
        bl printf
        pop {r0-r1}


        add r4, #1
        add r0, #4 //increment address by an int
        bal oaFor
        oaEnd:
    pop {r4, pc}
    