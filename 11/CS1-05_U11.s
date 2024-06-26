.section .rodata
	word: .asciz "A", "B", "C"
	out: .asciz "%c"
.section .text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $3, %rsi
    mov $word, %rdi
    call printReverse
    call puts

    movq $0, %rax
    popq %rbp
    ret

.globl printReverse
.type printReverse, @function
printReverse:
	# word in %rdi
	# length in %rsi

    # if (length == 0)
    cmpq $0, %rsi
    je .END
    
    decq %rsi
    # printf
    subq $16, %rsp
    movq %rdi, (%rsp) # save word in stack at rsp+8
    movq %rsi, 8(%rsp) # save length in stack at rsp+16
    
    movq $out, %rdi
    movq (%rsp), %rsi
    movq 8(%rsp), %rdx
    
    movl word(, %rdx, 2), %eax
    
    # call
    
    
    .END:
    	ret
