BITS 64

SECTION .text

GLOBAL memmove ; void *memmove(void *dest, const void *src, size_t n)
EXTERN strlen

memmove:
    PUSH RBP
    PUSH R8
    PUSH R9
    MOV RBP, RSP
    MOV R8, RSI
    MOV R9, RDI
    XOR RCX, RCX 

loop:
    CMP RCX, RDX
    JE next
    PUSH QWORD [R8 + RCX]
    INC RCX
    JMP loop

next:
    DEC RCX

loop2:
    POP R8
    MOV BYTE [R9 + RCX], R8B
    CMP RCX, 0
    JLE end
    DEC RCX
    JMP loop2

end:
    MOV RDI, R9
    MOV RAX, R9
    MOV RSP, RBP
    POP R9
    POP R8
    POP RBP
    RET
