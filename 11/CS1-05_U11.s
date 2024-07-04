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

    # prepare fn call
    movq $word, %rdi # pointer for word as first argument
    movq $0, %rsi # length as second argument

    # fn call
    call printReverse

    movq $empty, %rdi
    call puts

    movq $0, %rax
    popq %rbp
    ret

.globl printReverse
.type printReverse, @function
printReverse:
    pushq %rbx
    movq %rsi, %rbx

    # address of word in %rdi
    # length = 3 in %rsi

    // if (length == 0)
    cmpq $3, %rsi
    je .END

    # length - 1
    leaq 1(%rsi), %rsi

    call printReverse

    # prepare printf
    movq $out, %rdi
    movb word(, %rbx, 1), %al
    movzbq %al, %rsi
    call printf

    .END:
        popq %rbx
        ret