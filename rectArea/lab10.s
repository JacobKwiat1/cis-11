.global main
.global getLength
.global getWidth
.global getArea
.global displayData

.section .data
    length: .word 0
    width: .word 0
.section .rodata
    askL: .asciz "enter the length: "
    askW: .asciz "enter the width: "
    out: .asciz "length: %d\nwidth: %d\narea: %d\n"
    instuff: .asciz "%d"
.text

main:
    push {lr}
    bl getLength
    mov r4, r0
    bl getWidth
    mov r5, r0
    mov r1, r4
    bl getArea
    mov r6, r0

    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl displayData

    mov r0, #0
    pop {pc}

getLength:
    push {lr}

    ldr r0, =askL
    bl printf

    ldr r1, =length
    ldr r0, =instuff
    bl scanf


    ldr r0, =length
    ldr r0, [r0]
    pop {pc}

getWidth:
    push {lr}

    ldr r0, =askW
    bl printf

    ldr r1, =width
    ldr r0, =instuff
    bl scanf

    ldr r0, =width
    ldr r0, [r0]
    pop {pc}

getArea:
    push {lr}
    mul r0, r1
    pop {pc}

displayData:
    push {lr}
    push {r0-r2}
    ldr r0, =out
    pop {r1-r3}
    bl printf
    pop {pc}
