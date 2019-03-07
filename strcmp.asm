BITS 64

SECTION .text

GLOBAL strcmp ; int strcmp(const char *s1, const char *s2)

strcmp:
    PUSH RBP
    PUSH RBX
    MOV RBP, RSP
    XOR RCX, RCX

loop:
    MOV RBX, [RSI + RCX]
    CMP BYTE [RDI + RCX], 0
    JE less
    CMP BL, 0
    JE compute
    CMP [RDI + RCX], BL
    JNE compute
    INC RCX
    JMP loop

compute:
    XOR RAX, RAX
    XOR RBX, RBX
    MOV AL, [RDI + RCX]
    MOV BL, [RSI + RCX]
    SUB EAX, EBX
    JMP end

less:
    CMP BYTE [RSI + RCX], 0
    JE equal
    JMP compute

equal:
    MOV RAX, 0
    JMP end

end:
    MOV RSP, RBP
    POP RBX
    POP RBP
    RET
