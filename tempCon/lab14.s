.global main
.global celsius
.global Fahrenheit

.section .data
    goal: .word 0
    temp: .word 0
.section .rodata
    head: .asciz "F\tC\n"
    outC: .asciz "The temperature in Celsius is %d\n"
    outF: .asciz "The temperature in Fahrenheit is %d\n"
    outK: .asciz "The temperature in Kelvin is %d\n"
    ask: .asciz "What do you want to convert a temperature to (C or F or K):\n"
    getC: .asciz "Enter the temperature in Celsius:\n"
    getF: .asciz "Enter the temperature in Fahrenheit:\n"
    getK: .asciz "Enter the temperature:\n"
    prmptK: .asciz "What will you be converting from (C or F):\n"
    inpat: .asciz "%c"
    inNum: .asciz "%d"

.text
main:
    push {lr}

    prompt:
    ldr r0, =ask
    bl printf

    ldr r0, =inpat
    ldr r1, =goal
    bl scanf

    ldr r0, =goal
    ldr r0, [r0]

    cmp r0, #70
    beq fahr
    cmp r0, #67
    beq cel
    cmp r0, #75
    beq kel
    bne prompt

    fahr:
        ldr r0, =getC
        bl printf

        ldr r0, =inNum
        ldr r1, =temp
        bl scanf

        ldr r0, =temp
        ldr r0, [r0]
        bl Fahrenheit

        mov r1, r0
        ldr r0, =outF
        bl printf

        bal finish

    cel:
        ldr r0, =getF
        bl printf

        ldr r0, =inNum
        ldr r1, =temp
        bl scanf

        ldr r0, =temp
        ldr r0, [r0]
        bl celsius

        mov r1, r0
        ldr r0, =outC
        bl printf

        bal finish

    kel:
        askK:
            ldr r0, =prmptK
            bl printf

            ldr r0, =inpat
            ldr r1, =goal
            bl scanf

            ldr r0, =goal
            ldr r0, [r0]

            cmp r0, #70
            beq KF
            cmp r0, #67
            beq KC
            bne askK
            
        KF:
            ldr r0, =getK
            bl printf

            ldr r0, =inNum
            ldr r1, =temp
            bl scanf

            ldr r0, =temp
            ldr r0, [r0]
            bl celsius
            bl Kelvin
            bal KO
        KC:
            ldr r0, =getK
            bl printf

            ldr r0, =inNum
            ldr r1, =temp
            bl scanf

            ldr r0, =temp
            ldr r0, [r0]
            bl Kelvin
            bal KO
        KO:
            mov r1, r0
            ldr r0, =outK
            bl printf
        bal finish

    finish:
    mov r0, #0
    pop {pc}

celsius:
    push {lr}
    sub r0, #32
    mov r1, #5
    mul r0, r1
    mov r1, #9
    bl divMod
    pop {pc}

Fahrenheit:
    push {lr}
    mov r1, #9
    mul r0, r1
    mov r1, #5
    bl divMod
    add r0, #32
    pop {pc}

Kelvin:
    push {lr}
    ldr r1, =#273
    add r0, r1
    pop {pc}

