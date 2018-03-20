%include "io64.inc"
section .data
tree dq 1,7,2,-2,-2, 2,10,4,1,3, 3,13,2,-2,-2, 4,15,-1,2,5, 5,20,4,-2,-2

amount db 'vvedite kol-vo elementov dereva: ',0
choice db 'vvedite nomer deystviya: 1-poisk elementa, 2-vstavka elementa, 3- pryamoy (pre-order) perebor, 4-poperechniy (in-order)',0
which_element_find db 'kakoe chislo nuzhno naiti v dereve:  ',0
which_element_input db 'kakoe chislo nuzhno vstavit v derevo:  ',0
number_of_element db 'nomer elementa raven:  ',0
element_not_exist  db 'takogo elementa v dereve net ',0
parent_element db 'nomer roditelskogo elementa: ',0
parent_root  db 'etot element yavlayetsa kornem dereva',0
child_element db 'nomer dochernego elementa: ',0
no_child db 'etot element ne imeet dochernih elementov',0
root_element db 'tekushiy element: ',0
right_wing db 'praviy element: ',0
left_wing db 'praviy element: ',0
input_success_1 db 'element so znacheniem ',0
input_success_2 db ' vstavlen v derevo ',0
string_exit db 'press any number to exit ',0

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov r15,40; jump to next element in array
    mov r11,-1;root element
    mov r12,-2; no child
    PRINT_STRING amount
    GET_DEC 8,rcx
    PRINT_DEC 8,rcx
    NEWLINE
    lea rax,[tree]
    push rax
    mov rbx,rax;rbx- first element in array
    mov r14,rax
    mov rax,r15
    mul rcx
    add r14,rax; r14- new element in array
    pop rax
    call find_root
    PUSH rdi
    push rsi
    
vibor: NEWLINE 
       
       NEWLINE
       pop rsi
       pop rdi
       PUSH rdi
       push rsi

       mov rbx,rax
       PRINT_STRING choice
       GET_DEC 8, rdx
       PRINT_DEC 8,rdx
       NEWLINE
       cmp rdx,1
       je find
       cmp rdx,2
       je input
       cmp rdx,3
       je direct
       cmp rdx,4
       je sym
       cmp rdx,1
       jl vibor
       cmp rdx,4
       jg vibor
       ret
       
find: call f_find
      jmp vibor
      
input: call f_input
    PRINT_STRING input_success_1
    PRINT_DEC 8,r8
    PRINT_STRING input_success_2
    NEWLINE  
    
    jmp vibor
 
direct: 
        call print_f_direct
        NEWLINE
    PRINT_STRING string_exit
    GET_DEC 8,rax
    ret    
        
sym:xor rdx,rdx
    xor rcx,rcx
    call f_sym
    NEWLINE
    PRINT_STRING string_exit
    GET_DEC 8,rax
    ret        
                    
    
    
    

   
f_find:
      push rcx
      PRINT_STRING which_element_find
      GET_DEC 8,r8
      PRINT_DEC 8,r8
      NEWLINE
      add rbx,8
      sub rbx,r15
repeat_find:
          add rbx,r15
          cmp [rbx],r8
          je print_element
          dec rcx
          cmp rcx,0
          jne repeat_find
          PRINT_STRING element_not_exist
          NEWLINE
          jmp vibor
print_element: pop rcx   
               sub rbx,8
               PRINT_STRING  number_of_element
               PRINT_DEC 8,[rbx]
               NEWLINE
               add rbx,16
               PRINT_STRING parent_element
               cmp [rbx],r11
               jne exist_parent_element
               PRINT_STRING parent_root
               NEWLINE
               jmp left_child               
exist_parent_element: PRINT_DEC 8,[rbx]
                      NEWLINE
left_child: add rbx,8
            PRINT_STRING child_element    
            cmp [rbx],r12
            jne exist_left_child
            PRINT_STRING no_child
            NEWLINE
            jmp right_child
exist_left_child: PRINT_DEC 8,[rbx] 
                  NEWLINE     
right_child: add rbx,8
            PRINT_STRING child_element 
            cmp [rbx],r12
            jne exist_right_child
            PRINT_STRING no_child
            NEWLINE
            jmp exit_f_find
exist_right_child: PRINT_DEC 8,[rbx]
                   NEWLINE
exit_f_find: ret





      
                  
f_input: inc rcx
         PRINT_STRING which_element_input
         GET_DEC 8,r8
         PRINT_DEC 8,r8
         NEWLINE
         add rbx,8
recursion: mov rbx,rax
                
         cmp r8,rsi
         jl left_side
right_side:
           add rdi,24
           mov rsi,[rdi] 
           cmp [rdi],r12
           jne next_step
           call new_element   
           ret      
                  
left_side: 
           add rdi,16
           mov rsi,[rdi] 
           cmp [rdi],r12
           jne next_step
           call new_element
           ret
new_element:
           mov [rdi],rcx
           mov [r14],rcx
           add r14,8
           mov [r14],r8
           add r14,8
           mov [r14],r10
           add r14,8
           mov [r14],r12
           add r14,8
           mov [r14],r12
           add r14,8
           ret                    
next_step: 
           sub rbx,r15
find_child_element:add rbx,r15
           cmp [rbx],rsi
           jne find_child_element
           mov r10,[rbx]
           add rbx,8
           mov rsi,[rbx]
           mov rdi,rbx
           call recursion
           ret                                                                                                                          
        ret
        
        
        
print_f_direct: PRINT_DEC 8,[rdi]
                 NEWLINE

                      
f_direct: mov rbx,rax
          add rdi,16
          cmp [rdi],r12
          jne next_step_f_direct
          
          add rdi,8
          cmp [rdi],r12
          jne next_step_f_direct
          
          sub rdi,16
          mov rsi,[rdi]
          sub rbx,r15
 prev_step_f_direct:add rbx,r15
          cmp [rbx],rsi
          jne prev_step_f_direct
          add rbx,8
          mov rdi,rbx
          mov rsi,[rdi]
          
          add rbx,16
          cmp [rbx],r12
          je delete_element_from_print
          mov [rbx],r12
          jmp not_delete_element_from_print
delete_element_from_print: add rbx,8
                           mov [rbx],r12
not_delete_element_from_print:                                     
                              call f_direct
                              ret
              
              
next_step_f_direct: mov rsi,[rdi]
                    sub rbx,r15
repeat_next_step_f_direct:add rbx,r15
                    cmp [rbx],rsi
                    jne repeat_next_step_f_direct 
                    add rbx,8
                    mov rdi,rbx
                    
                    call print_f_direct       
                    ret
        
 
       
f_sym_root_check: add rdi,8
                  cmp [rdi],r12
                  jne exit_f_sym_root_check1
                  cmp r14,0
                  je skip_exit_f_sym_root_check1
                  NEWLINE
                  PRINT_DEC 8,[rdi-16]
                  xor r14,r14 
 skip_exit_f_sym_root_check1:                            
                  add rdi,8
                  cmp [rdi],r12
                  jne  exit_f_sym_root_check2
                  mov rdx,r11
                  ret
 exit_f_sym_root_check1: sub rdi,16
                         ret                        
 exit_f_sym_root_check2: sub rdi,24
                         ret                                       
      
f_sym:    
          mov rbx,rax
          mov rsi,[rdi]
          add rdi,8
          cmp [rdi],r11
          jne skip_f_sym_root_check
          call f_sym_root_check 
          cmp rdx,r11
          jne skip_f_sym_root_check1
          ret
skip_f_sym_root_check:
          sub rdi,8
 skip_f_sym_root_check1: add rdi,16
          cmp [rdi],r12
          jne next_step_f_sym1
          add rdi,8
          cmp [rdi],r12
          jne next_step_f_sym2
          
          cmp r8,rsi
          jg skip0
          
          
         cmp rcx,1
         jne print_2
         NEWLINE        
          PRINT_DEC 8,r8 
          
print_2:   cmp rcx,2
           jne   print_3     
           NEWLINE
          PRINT_DEC 8,r9   
print_3:           
         
          jmp skip
          
          
skip0:      
            
            NEWLINE
            PRINT_DEC 8,rsi
            
skip:     
         
         
                
prev_step_f_sym: sub rdi,16 
                 mov rsi,[rdi]
                 sub rbx,r15
repeat_prev_step_f_sym: add rbx,r15            
                 cmp rsi,[rbx]
                 jne repeat_prev_step_f_sym
                 add rbx,8
                 mov rdi,rbx
                 mov rsi,[rdi]                 
                 add rdi,16
                 cmp [rdi],r12
                 jne left_element_delete_f_sym
                 add rdi,8
                 cmp [rdi],r12
                 jne right_element_delete_f_sym                
left_element_delete_f_sym: mov rcx,1
                            mov [rdi],r12
                           sub rdi,16
                           call f_sym
                           ret             
right_element_delete_f_sym: mov rcx,2
                            
                            mov [rdi],r12
                           sub rdi,24
                           call f_sym
                           ret                                                                                                
next_step_f_sym1: sub rdi,16
                  mov r8,[rdi]
                  add rdi,16
                  jmp next_step_f_sym3
next_step_f_sym2:  sub rdi,24
                  mov r8,[rdi]
                  add rdi,24                 
next_step_f_sym3:                  
                  
                  mov rsi,[rdi]
                
                sub rbx,r15
find_number_f_sym:
                add rbx,r15
                cmp rsi,[rbx]
                jne find_number_f_sym
                add rbx,8
                mov rdi,rbx
                mov rsi,[rdi]
                mov rdx,rsi
                mov r9,rsi
                
                call f_sym 
                ret      
        
        
        
        
        
        
        
        
        
        
        
        

find_root:  add rbx,16
      sub rbx,r15
repeat_find_root:
          add rbx,r15
          cmp [rbx],r11
          jne not_root
          sub rbx,8
          mov r13,[rbx]; r13- root element
          mov rdi,rbx
          mov rsi,[rbx]
          
          jmp exit_find_root
not_root: jmp repeat_find_root
exit_find_root: ret           
      
      
      