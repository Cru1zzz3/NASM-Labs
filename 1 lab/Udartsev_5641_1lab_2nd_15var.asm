%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    fld dword [A]
    fld dword [x]
    fsub
    fld dword [B]
    fdiv ;vichislennaya 1 skobka
    fld dword [A]
    fld dword [y]
    fadd
    fld dword [B]
    fmul ;vicheslennaya 2 skobka
    fadd
    fst dword [itog]
    ret
section .data
A dd 0xc4f9c000
x dd 0x40000000
B dd 0x41880000
y dd 0x40000000
itog dd 0 
