%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov ebp, esp; for correct debugging
    mov rax,3
   mov rbx,4
   mov rcx,5
   
   mov rdx,rax
   mov rsi,rbx
   mov rdi,rcx
      
   add rax,rbx
   add rbx,rcx
   add rcx,rdx
   
   cmp rax,rdi
   JNAE	 error
   cmp rbx,rdx
   JNAE error
   cmp rcx, rsi
   JNAE	error
   mov rax,1
   JMP exit
error: mov rax,0xffffffffffffffff
  
exit: 
    ret
