.section .data
.align 16
.globl st
  .type st, @object
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
