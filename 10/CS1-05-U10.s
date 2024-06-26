.section .rodata
result: .asciz "Result: %ld\n"

.section .text

.globl calculateSumAndMultiply
.type calculateSumAndMultiply, @function
calculateSumAndMultiply:
    # arg1 = %rdi, 
    # arg2 = %rsi, 
    # arg3 = %rdx, 
    # arg4 = %rcx, 
    # arg5 = %r8, 
    # arg6 = %r9, 
    # arg7 = %rsp+8, 
    # arg8 = %rsp+16  
    # arg9 = %rsp+24

    //pushq %rax
    //pushq %rdi
    //pushq %rsi

    movq $0, %rax
    addq %rdi, %rax
    addq %rsi, %rax
    addq %rdx, %rax
    addq %rcx, %rax
    addq %r8, %rax
    addq %r9, %rax
    addq 8(%rsp), %rax
    addq 16(%rsp), %rax

    movq %rax, 32(%rsp)

    movq $2, %rdi
    movq $3, %rsi
    movq 24(%rsp), %rdx

    call multiply

    //popq %rsi
    //popq %rdi
    //popq %rax
    ret

.globl multiply
.type multiply, @function
multiply:
    # arg1 = %rdi
    # arg2 = %rsi
    # arg3 = %rdx

    imulq (%rdx), %rdi
    imulq %rdi, %rsi
    movq %rsi, %rax
    ret


.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    subq $48, %rsp # Allocate 24-Byte

    // Lokale Variablen rdi & rsi auf dem Stack sichern
    movq $1, 40(%rsp)
    movq $2, 32(%rsp)

    // Lokale Variable sum auf dem Stack sichern
    movq $0, 24(%rsp) # sum

    // Addresse von sum in %rax
    leaq 24(%rsp), %rax

    // Addresse als 9tes Argument an %rsp
    movq %rax, 16(%rsp) # 9th argument
    
    movq $8, 8(%rsp) # 8th argument
    movq $7, (%rsp) # 7th argument
  
    movq $6, %r9 # 6th argument
    movq $5, %r8 # 5th argument
    movq $4, %rcx # 4th argument
    movq $3, %rdx # 3th argument
    movq $2, %rsi # 2th argument
    movq $1, %rdi # 1th argument

    call calculateSumAndMultiply

    addq $48, %rsp

    movq $result, %rdi
    movq %rax, %rsi
    movq $0, %rax
    call printf

    movq $0, %rax
    popq %rbp
    ret
