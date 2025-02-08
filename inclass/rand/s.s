.extern time
.extern srand
.extern rand
.extern divMod
.global initRandom
.global getRand
//sets up 
initRandom:
    stmdb sp!, {lr}

    mov r0, #0
    bl time
    bl srand

    ldmia sp!, {pc}


getRand:
    stmdb sp!, {r4, r5, lr}
    //move modby and addby to "safe" registers
    mov r4, r0 //modby
    mov r5, r1 //addby
    bl rand

    lsr r0, #1 //make r0 not negative
    mov r1, r4
    bl divMod

    add r0, r1, r5

    ldmia sp!, {r4, r5, pc}
    