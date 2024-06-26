.section .data
.globl st
  .align 16
  .type st, @object,2G
  .size st, 13
st:
# char c;
  .byte 79
  # int n
  .long 100
  #int *pN
  .quad 0

.section .text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $0, %rax
    popq %rbp
    ret
