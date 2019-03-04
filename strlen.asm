BITS 64

SECTION .text

GLOBAL strlen ; size_t strlen(const char *s)

strlen:
    PUSH RBP
    MOV RBP, RSP
    XOR RCX, RCX

loop:
    CMP BYTE [RDI + RCX], 0
    JE end
    INC RCX
    JMP loop

end:
    MOV RAX, RCX
    MOV RSP, RBP
    POP RBP
    RET

