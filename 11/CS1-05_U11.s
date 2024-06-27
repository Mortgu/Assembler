.section .rodata
	word: .byte 'A', 'B', 'C'
	out: .ascii "%c"
    empty: .ascii ""
.section .text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $word, %rdi
    movq $3, %rsi
    call printReverse

    movq $empty, %rdi
    call puts

    movq $0, %rax
    popq %rbp
    ret

.globl printReverse
.type printReverse, @function
printReverse:
    pushq %rbx # %rbx auf stack
    movq %rsi, %rdx # 