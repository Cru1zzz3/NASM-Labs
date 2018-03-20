%include "io64.inc"
section .data
a times 100 dd 0
ans db 'massiv: ', 0
space db ' ', 0
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor rax,rax
    xor rsi,rsi; adress massiva
    mov r12,4; perehod na sleduushiy element
    xor rdi,rdi 
    mov r11,5 ; kolichestvo elementov
    mov r10,1 ; nachalnoe znachenie 1
        lea rsi, [a] ; adress pod massiv copy v rsi 
        mov rbx,rsi ; peremesheniye adresa v rbx
        PRINT_STRING ans 
        
next_element:  mov [rbx], r10; v 1 element massiva kiday nachal'noe znacheniye 
               cmp r10,0 ; sravnivay element s 0
               jl less ; esli men'he  to perehod na less
               inc r10 ; uvelicheniye na 1
               neg r10 ; ivertirovaniye elementa 
               jmp skip ; metka  dlya perehoda k sled elementu massiva  
               
          less: neg r10 ; invertirovaniye
                inc r10 ; uvelicheniye na 1
                
              
        skip:   PRINT_DEC 4, [rbx]
                PRINT_STRING space
                add rbx,r12; perehod k sleduushemu elementu massiva
                dec r11; shetchik massiva -1
                cmp r11,0; sravneniye shetchika cicla s 0
                jne next_element; poka shetchik ne raven 0 cicl rabotaet






      ret