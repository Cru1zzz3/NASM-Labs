%include "io64.inc"
section .data
pole times 1000 dq 0
pole2 times 500 dq 0
x db 'vvedite x ( !nomer stolbca! ): ',0
y db 'vvedite y( nomer strochki !!sverhu vniz!!): ',0
razmer db 'vvedite dliny kvadratnogo polya: ',0
kolvo db 'vvedite kol-vo bomb: ',0
checkk db 'postavte flag: ',0 
lose db 'YOU LOSE ',0
vibor db'vibor deystviya: 1-proverka zoni vokrug bombi 2-ustanovka flaga',0
won db 'CONGRATULATION! YOU WON!!!', 0
first db '1-proverka zoni vokrug bombi',0
second db '2-ustanovka flaga',0
bmbs db 'kol-vo bomb vokrug: ',0
err db 'oshibka vvoda ', 0
restart db 'press 0 to restart ', 0
massiv db 'vvedite v massiv ',0
massiv2 db ' element (0=pusto or (-1)=bomba): ',0
bombanotthere db 'VI POSTAVILI FLAG NE V TOM MESTE', 0
bombanotthere2 db 'BOMBI ZDES NET! ' ,0
author db '(c) UDARTSEV STANISLAV SUAI 5641 :)',0
again_bombs db 'oshibka vvoda polya (net bomb)',0

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
 
    mov rbp, rsp; for correct debugging
begin:  
vvod_again:
       xor rbx,rdx
       
       xor rdx,rdx
       xor rsi,rsi
       xor rdi,rdi
      
       
       mov r10,8 ; razmernost' (v moem sluchae qword)
       xor r11,r11
       
       xor r13,r13; kol-vo bomb ryadom
       
       

   
zanovo0: NEWLINE   
    PRINT_STRING razmer
    GET_DEC 8, rax ; dlina shirina polya
    
    PRINT_DEC 8, rax 
    NEWLINE
    cmp rax,0
    jg access0
    PRINT_STRING err
    jmp zanovo0  
access0:

    add rax,2
    mov rcx,rax ; rax= dlina
    mul r10 ; rax*r10=perehod na sledushuu stroku
    mov r15,rax; rax=dlina polya r10= razmernost' rax*r10=perehod na sledushuu stroku
    
   
    
    sub rcx,2; dlina igrovogo polya bez 0
    
    mov rax,rcx ;rcx= dlina polya
    mov r12,rax; r12= dlina polya
    mul rax ; rax = kol-vo elementov igrovogo polya
    mov r14,rax ; duplicate kol-vo elementov igrovogo polya v r14
    add rcx,2; dlina polnogo polya
     
 
    
    lea r9,[pole]
    mov r11,r9
    
    lea r9,[pole2]
    
    
    
     
    

     
 add r11,r10 ;smesheniye nachala polya po x
 mov rax,r10 ; v rax 8
 mul rcx ;smesheniye nachala polya po y
 add r11,rax ; smesheniye nachala polya x and y
 
 mov rbx,r11; duplicate smesheniye r11=nachalo poiska 
 
 mov rsi,r11; duplicate smesheniye r11=nachalo poiska 
 
     
     mov rdx,1 ;kakoy element vvoditsya
vvod:   
        mov r13 ,r12
         
zanovo1:NEWLINE 
        PRINT_STRING massiv 
         PRINT_DEC 8,rdx; "element N"
         PRINT_STRING massiv2

        GET_DEC 8, [rbx]; vvod elementa massiva
        PRINT_DEC 8,[rbx]; vivod na ekran
        
        
        NEWLINE
        mov r8,[rbx]
        cmp r8,-1
        jne not_bomb
        inc rdi
not_bomb:cmp r8,0
         jle access1
         NEWLINE
          PRINT_STRING err
          NEWLINE
          jmp zanovo1
access1:
zanovo2:cmp r8,-1
        jge access2
        NEWLINE
         PRINT_STRING err
        NEWLINE
         jmp zanovo1
access2:inc rdx       
        add rbx,r10
        dec r14
        dec r13
        cmp r14,0
        je exit_vvod
          cmp r13,0
        jne zanovo1
            add rbx,r10
            add rbx,r10
          
      
         jmp vvod
 exit_vvod:
        cmp rdi,0
        jne yes_bombs
       PRINT_STRING again_bombs 
       NEWLINE
       jmp vvod_again
yes_bombs: mov r8,rdi; perenos kol-va bomb v r8
        NEWLINE
        mov rbx,rsi; vozvrat
        
        
        NEWLINE 

choice: 
        lea r9,[pole2]
        push r9
            
        sub rcx,2
   mov rdi,rcx;rdi=3
   mov rax,rcx
   mul rcx;rax=9
   
   
vivod2:       
PRINT_DEC 8,[r9]
    add r9,r10
    dec rdi
    dec rax
    cmp rdi,0
    jne vivod2
  mov rdi,rcx
  NEWLINE
  add r9,r10
  add r9,r10
  
  cmp rax,0 
  jne vivod2
  
  add rcx,2
  POP r9
  PUSH r9














xor r13,r13
        xor r14,r14; obnulenie r14

cmp r8,0; esli bombi zakonhilis' to pobeda
        je win
    NEWLINE
    PRINT_STRING vibor
    NEWLINE
    
    GET_DEC 8, r14 ;na vhod libo 1/  `libo 2 
    NEWLINE
    cmp r14,1
    je find ; esli na vhod postupaet 1 to perehodit k proverke zoni vokruug
    cmp r14,2
        je check ; esli na vhod postupaet 1 to perehodit k proverke zoni vokruug
    
    PRINT_STRING err ; esli drugoe znachenie pishet oshibka vvoda
    NEWLINE
    jmp choice
    
    
    
    
find: xor r13,r13
PRINT_STRING first 
    NEWLINE
    
    
    
    

vvod_x_find:
   PRINT_STRING x
   GET_DEC 8, rsi ; koordinata x
   sub rcx,2
        cmp rsi,rcx
        jg errfind1
   add rcx,2
   cmp rsi,0
   jg vivod_x_find
errfind1:NEWLINE 
         PRINT_STRING err
         NEWLINE
         add rcx,2 
         jmp vvod_x_find
vivod_x_find:
     mov rax,r10 ; r10=8
     mul rsi
     sub rax,r10
     add r11,rax ; sdvig po x
     
     add r9,rax; sdvig polya2 po x
     
     
     NEWLINE




vvod_y_find:
     PRINT_STRING y
     GET_DEC 8, rdi ; koordinata y mov rax,rcx
     sub rcx,2
     cmp rdi,rcx
     jg errfind2
     add rcx,2
     cmp rdi,0
     jg vivod_y_find
errfind2:NEWLINE
     PRINT_STRING err
     NEWLINE
     add rcx,2
     jmp vvod_y_find
     
vivod_y_find:
    NEWLINE
     mov rax,r15
     mul rdi
     sub rax,r15
     add r11,rax; sdvig po y
     add r9,rax; sdvig polya2 po x
     
     
     
     mov r12,[r11]
     
     cmp r12,-1
     je loser 
 
plus56:add r11,r15; r15=56 perehod na sled strochky
 mov r12,[r11]
 cmp r12,-1
 jne plus8
 inc r13
plus8: add r11,r10
 mov r12,[r11] 
 cmp r12,-1
 jne minus561
 inc r13
minus561: sub r11,r15
 mov r12,[r11]
 cmp r12,-1 
 jne minus562
 inc r13
minus562: sub r11,r15
 mov r12,[r11]
 cmp r12,-1
 jne minus81
 inc r13
minus81: sub r11,r10
  mov r12,[r11]
  cmp r12,-1
  jne minus82
  inc r13
minus82: sub r11,r10
  mov r12,[r11]
  cmp r12,-1
  jne plus561
  inc r13
plus561: add r11,r15
    mov r12,[r11]
    cmp r12,-1
   jne plus562
   inc r13
plus562: add r11,r15
    mov r12,[r11]
    cmp r12,-1
    jne exit    
   inc r13
exit: mov r11,rbx
 PRINT_STRING bmbs 
 PRINT_DEC 8,r13
 mov [r9],r13
; mov [r11],r13 ;!!! STAVIT SKOL'KO RYADOM BOMB!!!
 NEWLINE
 NEWLINE
 xor r13,r13
 xor rsi,rsi
 xor rdi,rdi
 pop r9
 
 
 jmp choice

   
check:
PRINT_STRING second
NEWLINE
PRINT_STRING checkk
NEWLINE
 mov r11,rbx
 
vvod_x_check: PRINT_STRING x
        GET_DEC 8, rsi ; koordinata x
        sub rcx,2
        cmp rsi,rcx;rsi=1 rcx=2
        jg errcheck1
        add rcx,2
        cmp rsi,0
       
         jg vivod_x_check
         
errcheck1:NEWLINE
        PRINT_STRING err
        NEWLINE
        add rcx,2
        jmp vvod_x_check
         
vivod_x_check:
 mov rax,r10 ; r10=8
 mul rsi
 sub rax,r10
 add r11,rax ; sdvig po x
 add r9,rax
 NEWLINE
 
vvod_y_check:PRINT_STRING y
 GET_DEC 8, rdi ; koordinata y 
     sub rcx,2
     cmp rdi,rcx
     jg errcheck2
     cmp rdi,0
     add rcx,2
     jg vivod_y_check
 
 errcheck2:NEWLINE
           PRINT_STRING err
           NEWLINE
           add rcx,2
            jmp vvod_y_check
vivod_y_check:  
mov rax,rcx ; rcx=7
 mul r10 ;rax=56
 mul rdi ;sdvig na rdi raz 
 sub rax,r15
 add r11,rax ; sdvig po y
 add r9,rax
 mov r12,[r11]
 cmp r12,-1
 NEWLINE
 PUSH rcx
 mov rcx,-1
   mov [r9],rcx
    POP rcx
 jne loser_check
 
 pop r9
 push r9
 dec r8 
 cmp r8,0
 je win
 ;mov r14,1;!!!!
 ;mov [r11], r14;!!!!
 mov r11,rbx
 xor rsi,rsi
 xor rdi,rdi
 NEWLINE
 
 jmp choice
loser_check: 
PUSH rcx
 mov rcx,-1
   mov [r9],rcx
    POP rcx
PRINT_STRING bombanotthere 
             NEWLINE
                PRINT_STRING bombanotthere2
loser:
 NEWLINE
 PRINT_STRING lose
 NEWLINE
 NEWLINE
 pop r9
  mov r8, r9
       push rcx 
       push rcx
       
        sub rcx,2
   mov rdi,rcx;rdi=3
   mov rax,rcx
   mul rcx;rax=9
 
lose_print:
 PRINT_DEC 8,[rbx]
    add rbx,r10
    dec rdi
    dec rax
    cmp rdi,0
    jne lose_print
  mov rdi,rcx
  NEWLINE
  add rbx,r10
  add rbx,r10
  
  cmp rax,0 
  jne lose_print
  pop rcx
  PRINT_STRING restart
NEWLINE 
NEWLINE
   
GET_DEC 8,rax
cmp rax,0
je begin_restart


PRINT_STRING author
NEWLINE 

  ret
   
win:
 NEWLINE
 PRINT_STRING won  
  NEWLINE
  pop r9
  
  mov r8, r9
  push rcx
sub rcx,2
   mov rdi,rcx;rdi=3
   mov rax,rcx
   mul rcx;rax=9
   
   
 
vivod_win:   
                                    
PRINT_DEC 8,[r8]
    add r8,r10
    dec rdi
    dec rax
    cmp rdi,0
    jne vivod_win
    mov rdi,rcx
    NEWLINE
  add r8,r10
  add r8,r10
  
  cmp rax,0 
  jne vivod_win
  
  PRINT_STRING restart
NEWLINE 
NEWLINE
PRINT_STRING author
NEWLINE 
GET_DEC 8,rax
    cmp rax,0
    je begin_restart
    ret
   
begin_restart:
mov r8, r9
pop rcx
sub rcx,2
   mov rdi,rcx;rdi=3
   mov rax,rcx
   mul rcx;rax=9
   
   
begin_restart_sub:   
   
   xor rbx,rbx
   mov [r8],rbx                                

    add r8,r10
    dec rdi
    dec rax
    cmp rdi,0
    jne begin_restart_sub
    mov rdi,rcx
    NEWLINE
  add r8,r10
  add r8,r10
  
  cmp rax,0 
  jne begin_restart_sub
  
mov r8, r9  
  jmp begin
    
 
   

        
       
        
        

        
    
    
    
    