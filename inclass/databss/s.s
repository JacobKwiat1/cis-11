.global main

.section .bss //un-init variable space is smaller storagewise
    .align 4
    a: .space 10485760 //10 mb of space

.text
main:
    push {lr}

    pop {pc}
