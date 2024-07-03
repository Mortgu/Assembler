.section .rodata
format:
.asciz "Sum = %ld\n"
.section .bss
.lcomm results 16
.section .data
.align 16
farr1:
.float 13.99, 17.4, 2.0, 3.0
.align 16
farr2:
.float -214.0, 0.75, 5.5, 30.52
.section .text
.globl main
.type main, @function
main:
# ...
# calc 1. expression
# ...
# calc 2. expression
# ...
# calc 3. expression
# ...
# calc 4. expression
# …
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
# …
ret