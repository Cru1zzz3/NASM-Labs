%include "io64.inc"
section .data
a dq 3,-2,9,15,20,3,-1,2
ans db 'naimenshee po modulu znacheniye ravno: ', 0
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor rax,rax
    xor rsi,rsi; adress massiva
    mov r12,8; perehod na sleduushiy element
    xor rdi,rdi ; min znachenie po modulu
    mov r11,8 ; kolichestvo elementov
        lea rsi, [a] ; adress pod massiv copy v rsi 
        mov rbx,rsi ; peremesheniye adresa v rbx
        mov r10,[rbx]; 1 element massiva sdelaem minimal'nim 
next_element:   mov rax,[rbx] ; peremesheniye znacheniye adress  v rax
                mov rdi,rax; copy znacheniye elementa v rdi iz rax
                cmp rdi,0; sravneniye elementa s 0
                jg bigger ; esli boli'se to ne neg
                neg rdi ; esli men'she to neg ( poluchaem znachenie po modulu)
        bigger: cmp rdi,r10 ; sravneniye elementa s min znacheniyem
                jg skip ; esli element bol'she to perehod k sled elementu massiva
     min_znach: mov r10,rdi ; esli element men'she togda zapisivaem element v min znacheniye
          skip: add rbx,r12; perehod k sleduushemu elementu massiva
                dec r11; shetchik massiva -1
                cmp r11,0; sravneniye shetchika cicla s 0
                jne next_element; poka shetchik ne raven 0 cicl rabotaet
PRINT_STRING ans ; vivod 'naimenshee po modulu znacheniye ravno: '
PRINT_DEC 4,r10 ; vivod minimal'nogo znacheniya
     ret