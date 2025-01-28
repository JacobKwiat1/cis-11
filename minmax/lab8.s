.global main

.section .data //Initialized Variables
    largest: .word 2,147,483,647 
    smallest: .word -2,147,483,648
    current: .word 0
.section .rodata //Readonly Data
    inPat: .asciz "%d"
    prmpt: .asciz "Enter number: "
    outRslt: .asciz "largest number: %d\nsmallest number: %d\n"

.section .bss //Uninitialized Variables

.text
main:
    push {lr}
    ldr r4, =smallest
    ldr r5, =largest
    ldr r4, [r4]
    ldr r5, [r5]
primary:
    //Prompt1
    ldr r0, =prmpt
    bl printf
    //user input
    ldr r0, =inPat
    ldr r1, =current
    bl scanf
    //Load variables into registers
    ldr r2, =current //address
    ldr r2, [r2]   //value
    cmp r2, #99
    beq end
    ldr r0, =outRslt
    cmp r2, r4
    bgt ismax
    cmp r2, r5
    blt ismin
    bal primary

ismin:
    mov r5, r2
    bal primary
ismax:
    mov r4, r2
    bal primary
    cmp r2, r5
    blt ismin
end:
    ldr r0, =outRslt
    mov r1, r4
    mov r2, r5
    bl printf
    mov r0, #0

    //Resume where I left off
    pop {pc}
