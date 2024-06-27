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
    movq %rdi, %rbx # %rbx = word
    movq %rsi, %rdx # length in %rdx

    # if (length == 0)
    cmpq $0, %rdx
    je .END

    # length - 1
    decq %rdx

    # prepare fn call 
    movq %rbx, %rdi
    movq %rdx, %rsi

    call printReverse

     # prepare printf
    movq $out, %rdi
    movb word(, %rdx, 1), %al
    movzbq %al, %rsi

    call printf

    .END:
        popq %rbx
        ret
