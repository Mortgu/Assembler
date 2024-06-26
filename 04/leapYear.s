.section .bss
.lcomm yearText, 5
.lcomm year, 2
.section .rodata
promptText:
.ascii "Enter a year >= 1700 && year <= 9999: "
outTrue:
.asciz "%d is leap year\n"
outFalse:
.asciz "%d is no leap year\n"
.section .text
.globl _start
.type _start, @function
_start:
    pushq %rbp
    movq %rsp, %rbp

    # print promptText
    movq $1, %rax
    movq $1, %rdi
    leaq promptText, %rsi
    movq $38, %rdx
    syscall

    # read year as text
    movq $0, %rax
    movq $0, %rdi
    leaq yearText, %rsi
    movq $5, %rdx
    syscall

    #####

    # ascii to integer
    # thousands
    leaq yearText, %rbx
    movb (%rbx), %al
    subb $48, %al
    movzbw %al, %ax
    imulw $1000, %ax

    # hundreds
    movb 1(%rbx), %cl
    subb $48, %cl
    movzbw %cl, %cx
    imulw $100, %cx
    addw %cx, %ax

    # tens
    movb 2(%rbx), %cl
    subb $48, %cl
    movzbw %cl, %cx
    imulw $10, %cx
    addw %cx, %ax
    
    # ones
    movb 3(%rbx), %cl
    subb $48, %cl
    movzbw %cl, %cx
    addw %cx, %ax
    movw %ax, year # year as a number
    
    #####

    # year % 4
    movq $4, %rcx
    movzwq year, %rax
    cqto # convert quat to octal -> %rdx
    divq %rcx
    movq %rdx, %r8 # new

    # year % 100
    movq $100, %rcx
    movzwq year, %rax
    cqto # convert quat to octal -> %rdx
    divq %rcx
    movq %rdx, %r9

    # year % 400
    movq $400, %rcx
    movzwq year, %rax
    cqto
    divq %rcx

    ### COMPARE
    # year % 4 == 0
    movq $0, %rax
    cmpq $0, %r8
    setz %al

    # year % 100 != 0
    movq $0, %rbx
    cmpq $0, %r9
    setnz %bl

    # (year % 4 == 0) && (year % 100 != 0)
    testq %rax, %rbx
    movq $0, %rax
    setnz %al

    movq $0, %rbx
    cmpq $0, %rdx
    setz %bl

    movq year, %ecx
    # (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
    orq %rax, %rbx
    jne yearTrue
    je yearFalse

yearTrue:
    # print
    movq $1, %rax
    movq $1, %rdi
    leaq outTrue, %rsi
    movq $10, %rdx
    syscall
    jmp end
yearFalse:
    # print
    movq $1, %rax
    movq $1, %rdi
    leaq outFalse, %rsi
    movq $13, %rdx
    syscall
end:
    movq $60, %rax
    movq $0, %rdi
    popq %rbp
    syscall