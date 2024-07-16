.section .data
out: .asciz "Result: %ld\n"
.section .text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $1, %r10 # rdi
    movq $2, %r11 # rsi

    subq $24, %rsp
    movq $0, 16(%rsp)    
    movq $8, 8(%rsp)    
    movq $7, (%rsp)
    movq $6, %r9    
    movq $5, %r8    
    movq $4, %rcx    
    movq $3, %rdx   
    movq %r11, %rsi   
    movq %r10, %rdi
    call csm   

    addq $24, %rsi

    movq $0, %rax
    popq %rbp
    ret
.globl csm
.type csm, @function
csm: 
# pSum = 24(%rsp)
    movq 24(%rsp), %rax
    ret
.globl multiply
.type multiply, @function
multiply:
    ret
