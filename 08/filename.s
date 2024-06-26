.section .rodata
intarr:
    .quad 1004, 999, 729, -33, 1002, 1006, 2000

.align 8
.L1:
    .quad .L2 # Case result = 1 // 999
    .quad .L6 # // 1000 
    .quad .L6 # // 1001 
    .quad .L3 # Case result = 2 // 1002
    .quad .L6 # // 1003
    .quad .L4 # Case result = 3 // 1004
    .quad .L6 # // 1005
    .quad .L5 # Case result = 3 // 1006
    .quad .L6 # Case default result = 0
.section .text
.globl _start
.type _start, @function
_start:
    pushq %rbp
    movq %rsp, %rbp

    // i = 0;
    movq (intarr), %rsi
    subq $999, %rsi

    // result = 0
    movq $0, %rax

    jmp .FOR_TEST

    .FOR:
        // Anfangswert in %rsi
        movq intarr(, %rsi, 8), %rsi
        subq $999, %rsi

        // body statement
        cmp $6, %rsi
        ja .L6
        jmp *.L1(,%rsi, 8)

        .L2:
            movq $1, %rax
            jmp .LDONE
        .L3:
            movq $2, %rax
            jmp .LDONE
        .L4:
        .L5:
            movq $3, %rax
            jmp .LDONE
        .L6:   
            jmp .LDONE
        .LDONE:    
            jmp end 

        // update expr (i++)
        incq %rsi
 
        // i <= 6
        .FOR_TEST:
            cmpq $6, %rsi
            jle .FOR

    movq $60, %rax
    xor %rdi, %rdi
    popq %rbp
    syscall