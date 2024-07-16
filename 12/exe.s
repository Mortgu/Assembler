.section .rodata
format: .asciz "Sum = %ld\n"
.section .bss
.lcomm result 16
.section .data
.align 16
farr1: .float 13.99, 17.4, 2.0, 3.0
.align 16
farr2: .float -214.0, 0.75, 5.5, 30.52
.section .text
.globl main
.type main, @function
main:
    pushq %rbp
    movq %rsp, %rbp

    leaq result, %r10

    vmovaps farr2, %xmm2

     /*
     *   Source 2, Source 1, Destination
     *   => Addiert jedes einzelne Element in Source 2 mit Source 1 und schreibt
     *      das Ergebnis in Destination
     *   => Source_2[0] + Source_1[0]
     */
    # vaddps %xmm0, %xmm0, %xmm0

    /*
     *   Source 2, Source 1, Destination
     *   => Multipliziert die ersten beiden Elemente aus den Registern Source 2 und Source 1
     *      und schreibt sie anschließend in Destination
     *   => Source_2[0] * Source_1[0]
     */
    # vmulss %xmm0, %xmm0, %xmm0

        /*
     *   Source 2, Source 1, Destination
     *   => Multipliziert die ersten beiden Elemente aus den Registern Source 2 und Source 1
     *      und schreibt sie anschließend in Destination
     *   => Source_2[0] * Source_1[0]
     */
    # vsubss %xmm0, %xmm0, %xmm0

    /*
     *   Source 2, Source 1, Destination
     *   => Addiert die ersten beiden Elemente aus den Registern Source 2 und Source 1
     *      und schreibt sie anschließend in Destination
     */
    # vaddss %xmm0, %xmm0, %xmm0

    /*
     *  Source 2, Source 1, Destination
     *  => Nimmt immer den "lower part" (Linke Seite) vom Source 2 und schreibt diesen entwender in den "higher part" (Rechte Seite) -> vmovhps
     *     oder in den "lower part" (Linke Seite) -> vmovlps von Source 1. Das Ergebnis steht anschließend in Destination
     */
    #vmovlps farr1, %xmm2, %xmm0

    movq $0, %rax
    popq %rbp
    ret
