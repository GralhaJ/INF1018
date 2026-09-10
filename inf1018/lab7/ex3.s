.data
Sf: .string "%d\n"

.text
.globl main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

    movl $1, %ebx        /* ebx = i = 1  (registrador callee-saved!) */

L1:
    cmpl $11, %ebx
    je L2

    movl %ebx, %eax       /* eax = i */
    imull %ebx, %eax      /* eax = i * i */

    /*************************************************************/
    /* este trecho imprime o valor de %eax (estraga %eax)  */
    movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
    movl    %eax, %esi   /* segundo parametro  (inteiro) */
    movl  $0, %eax
    call  printf       /* chama a funcao da biblioteca */
    /*************************************************************/

    addl  $1, %ebx        /* i++;  (ebx sobrevive ao call, sem problema) */
    jmp  L1         /* goto L1; */

L2:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/