.section .rodata
out:
    .asciz "Hex: %#lx\nDez: %ld\n"

.section .text
.globl main
.type main, @function

main:
    pushq %rbp
    movq %rsp, %rbp

    movq $888888888888, %rax
    movq %rax, %rcx
    sarq $32, %rcx
    salq $32, %rcx    

    movl $777777, %eax
    orq %rcx, %rax

    movb $30, %al
    movb $31, %ah

    movq $out, %rdi
    movq %rax, %rsi
    movq %rax, %rdx

    movq $0, %rax
    call printf

    movq $0, %rax
    popq %rbp
    ret