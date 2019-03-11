BITS 64

SECTION .text

GLOBAL memset ; void *memset(void *s, int c, size_t n)

memset:
    PUSH RBP
    MOV RBP, RSP
    XOR RCX, RCX

loop:
    CMP RDX, RCX
    JE end
    MOV [RDI + RCX], SIL
    INC RCX
    JMP loop

end:
    MOV RAX, RDI
    MOV RSP, RBP
    POP RBP
    RET
