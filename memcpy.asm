BITS 64

SECTION .text

GLOBAL memcpy ; void *memcpy(void *dest, const void *src, size_t n)

memcpy:
    PUSH RBP
    PUSH RBX
    MOV RBP, RSP
    XOR RCX, RCX
    ;MOV RBX, RSI

loop:
    CMP RDX, RCX
    JE end
    MOV RBX, [RSI + RCX]
    MOV BYTE [RDI + RCX], BL
    ;ADD RSI, 1
    INC RCX
    JMP loop

end:
    MOV RAX, RDI
    MOV RSP, RBP
    POP RBX
    POP RBP
    RET
