%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov ebp, esp; for correct debugging
     xor rax,rax;peremennaya k
     xor rbx,rbx;peremennaya m
     xor rcx,rcx;vihodnoye znacheniye k
     mov rdx, 27; vhodnoe znacheniye N
     
 
repeat: mov rcx,rax
        inc rbx
        add rax,rbx
        cmp rax,rdx
        JBE repeat
        mov rax,rcx; v yacheiku eax zapisivaetsya vihodnoye znachenie k
   ret
