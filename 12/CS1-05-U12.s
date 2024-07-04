.section .rodata
    format:
    .asciz "Sum = %ld\n"
.section .bss
.lcomm results 16
.section .data
    .align 16
    farr1: .float 13.99, 17.4, 2.0, 3.0
    .align 16
    farr2: .float -214.0, 0.75, 5.5, 30.52
.section .text
.globl main
.type main, @function
main:
    # move farr1 into %xmm0
    vmovaps farr1, %xmm0
    leaq farr1, %r9 # move array address of farr1 to %r9

    # move farr2 into %xmm1
    vmovaps farr2, %xmm1
    leaq farr2, %r10 # move array address of farr2 into %10
    
    # calc 1. expression
    vmovss (%r9), %xmm3
    vsubps 4(%r9), %xmm3, %xmm0

    # calc 2. expression

    # calc 3. expression

    # calc 4. expression

    # call truncDec
    leaq results, %rdi
    call truncDec

    # call printf
    leaq format, %rdi
    movq %rax, %rsi
    movq $0, %rax
    call printf

    # exit main
    movq $0, %rax
    popq %rbp
    ret
.globl truncDec
.type truncDec, @function
truncDec:
    ret