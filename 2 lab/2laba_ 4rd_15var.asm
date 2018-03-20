%include "io64.inc"
section .data
a dq 1,2,3,4,-5
ans1 db 'massiv sostoit iz odinakovih elementov', 0
ans2 db 'massiv ne sostoit iz odinakovih elementov', 0
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor rax,rax
    xor rsi,rsi; adress massiva
    mov r12,8; perehod na sleduushiy element
    xor rdi,rdi 
    mov r11,5 ; kolichestvo elementov
    xor rdx,rdx 
    xor r10,r10
    
        lea rsi, [a] ; adress pod massiv copy v rsi 
        mov rbx,rsi ; peremesheniye adresa v rbx
        mov r10, [rbx]
        add rbx,r12
        
next_element:  mov rdi,[rbx]
               cmp r10,rdi
               je answer1
               
               add rbx,r12; perehod k sleduushemu elementu massiva
                dec r11; shetchik massiva -1
                cmp r11,0; sravneniye shetchika cicla s 0
                jne next_element; poka shetchik ne raven 0 cicl rabotaet
answer2: mov rax,-1
          PRINT_STRING ans2 ; ne sostoit iz odinakovih elementov
                jmp exit
                
                
                
answer1: mov rax,1
         PRINT_STRING ans1; sostoit iz odinakovih elementov
exit:
    




      ret