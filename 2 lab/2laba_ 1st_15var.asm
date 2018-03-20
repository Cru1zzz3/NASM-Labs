%include "io64.inc"
section .data
a dq -3,6,9,15,20,1,1,1
ans db 'kol-vo elementov kratnig zadannomy chislu: ', 0
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    xor rax,rax
    xor rsi,rsi
    mov r12,8; perehod na sleduushiy element
    xor rdi,rdi
    xor r10,r10
    mov rcx,3; delitel
    mov r11,8 ;kolichestvo elementov
        lea rsi, [a] ; adress pod massiv copy v esi 
        mov rbx,rsi ;peremesheniye adresa v ebx
next_element:   mov rax,[rbx] ; peremesheniye znacheniye adress v eax
                mov rdi,rax; copy znacheniye elementa v edi
                xor rdx,rdx; obnuleniye ostatka
                cqo
                idiv rcx; delenive elementa na delitel
                cmp rdx,0 ; sravneniye ostatka s 0
                jne skip ;esli ostatok ne raven 0 togda skip 
                    inc r10 
            skip:    
                add rbx,r12; perehod k sleduushemu elementu massiva
                dec r11;shetchik massiva
                cmp r11,0; sravneniye shetchika cicla s 0
                jne next_element; poka shetchik ne raven 0 cicl rabotaet
    
PRINT_STRING ans ; vivod 'sum ravna: '
PRINT_DEC 4, r10 ; vivod znacheniya
     ret