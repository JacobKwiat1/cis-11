.global main
@ .global input
@ .global checkGuesses
@ .global printFeedback
@ .global outArrlr
.section .bss
.align 4
    resp: .space 16
    hold: .space 16

.section .data
    arr: .word 'R','G','B','Y'

.section .rodata
    prompt: .asciz "Enter color number %d for your guess (R, G, B, Y, O, W, P, T): \n"
    inpat: .asciz " %c"
    outNum: .asciz "%c "
    outGuess: .asciz "guess #%d: "
    outRes: .asciz "reponse: "
    newLine: .asciz "\n"
    loss: .asciz "You lose!\n"
    win: .asciz "You win!\n"

.text
main:
    push {lr}
    mov r4, #0
    gameplay:
        cmp r4, #10
        bge endGame
        bl input
        ldr r0, =arr
        ldr r1, =hold
        ldr r2, =resp
        bl checkGuess

        cmp r0, #4
        beq endWin

        ldr r0, =resp
        bl formatFeed

        ldr r0, =outGuess
        add r1, r4, #1
        bl printf
        ldr r0, =hold
        mov r1, #4
        bl outArray


        ldr r0, =outRes
        bl printf
        ldr r0, =resp
        mov r1, #4
        bl outArray

        
        add r4, #1
        bal gameplay
    endGame:
    ldr r0, =loss
    bl printf
    bal end
    endWin:
    ldr r0, =win
    bl printf
    end:
    pop {pc}

input:
    push {r4-r5, lr}
    ldr r5, =hold
    mov r4, #0
    inLoop:
        cmp r4, #4
        bge endIn

        ldr r0, =prompt
        add r1, r4, #1
        bl printf
        
        ldr r0, =inpat
        add r1, r5, r4, lsl #2
        bl scanf

        add r4, #1
        bal inLoop
    endIn:
    pop {r4-r5, pc}

checkGuess:
    push {r4-r9, lr}
    mov r4, #0
    mov r6, r0
    mov r7, r1
    mov r8, r2
    mov r9, #0
    mov r0, #0
    str r0, [r8, #0]
    str r0, [r8, #4]

//commented things out from a different build with a different output solution
    checkForOut:
        cmp r4, #4
        bge endCheck
        @ mov r0, #'-'
        @ add r1, r8, r4, lsl #2
        @ str r0, [r1]  
        mov r5, #0
        checkForIn:
            cmp r5, #4
            bge endCheckOut
            ldr r0, [r6, r5, lsl #2]
            ldr r1, [r7, r4, lsl #2]
            cmp r0, r1
            beq matchColor
            bal endCheckIn
            matchColor:
                cmp r4, r5
                beq matchSpot
                @ add r1, r8, r4, lsl #2
                @ mov r0, #'X'
                @ str r0, [r1]
                ldr r0, [r8, #4]
                add r0, #1
                str r0, [r8, #4]
                bal endCheckIn
            matchSpot:
                @ add r1, r8, r4, lsl #2
                @ mov r0, #'O'
                @ str r0, [r1]
                ldr r0, [r8, #0]
                add r0, #1
                str r0, [r8, #0]
                add r9, #1
                bal endCheckIn
        endCheckIn:
            add r5, #1
            bal checkForIn    
        endCheckOut:
        add r4, #1
        bal checkForOut
        endCheck:
    mov r0, r9
    pop {r4-r9, pc}

setResp:
    push {lr}
    mov r0, #0
    ldr r1, =resp
    filler:
        cmp r0, #4
        bge endFill
        mov r2, #'-'
        str r2, [r1, r0, lsl #2]
        add r0, #1
        bal filler
    endFill:
    pop {pc}

formatFeed:
    push {r4-r7, lr}
    mov r4, r0  //array
    ldr r5, [r4, #0] //matches
    ldr r6, [r4, #4] //wrong spots
    mov r7, #0 //counter
    bl setResp
    loopMatch:
        cmp r7, r5
        bge endMatch
        mov r0, #'O'
        str r0, [r4]
        add r4, #4
        add r7, #1
        bal loopMatch
    endMatch:
    mov r7, #0
    loopSpotMiss:
        cmp r7, r6
        bge endMiss
        mov r0, #'X'
        str r0, [r4]
        add r4, #4
        add r7, #1
        bal loopSpotMiss
    endMiss:

    pop {r4-r7, pc}

outArray:
    stmdb sp!, {r4-r6, lr}
    mov r4, #0
    mov r5, r0
    mov r6, r1
    oaWhile:
        cmp r4, r6
        bge oaEnd

        ldr r1, [r5], #4
        ldr r0, =outNum
        bl printf

        add r4, #1
        bal oaWhile
    oaEnd:
    ldr r0, =newLine
    bl printf
    ldmia sp!, {r4-r6, pc}
