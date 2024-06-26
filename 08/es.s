.section .data
intarr:
.int 1004, 999, 729, -33, 1002, 1006, 2000
.globl _start
.type _start, @function
_start:
    pushq %rbp
    movq %rsp, %rbp

    // result = 0
    movq $0, %rax

    // i = 0; i = %rsi
    movq $0, %rsi
    jmp .FOR_TEST

    .FOR:
        // body statement
        subq $999, %rsi
        cmpq $7, %rsi

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

        .LDONE:    
            jmp end 

        // update expr (i++)
        incq %rsi
 
        // i <= 6
        .FOR_TEST:
            cmpq $6, %rsi
            jg .FOR

    movq $60, %rax
    xor %rdi, %rdi
    popq %rbp
    syscall

.section .rodata
.align 8
.L1:
    .quad .L2 # Case result = 1
    .quad .L3 # Case result = 2
    .quad .L4 # Case result = 3
    .quad .L5 # Case result = 3
    .quad .L6 # Case default result = 0