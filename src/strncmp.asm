BITS 64

SECTION .text

GLOBAL strncmp ; int strncmp(const char *s1, const char *s2, size_t n)

strncmp:
    PUSH RBP
    PUSH RBX
    MOV RBP, RSP
    XOR RCX, RCX

loop:
    CMP RDX, RCX
    JE equal
    MOV RBX, [RSI + RCX]
    CMP BYTE [RDI + RCX], 0
    JE less
    CMP BL, 0
    JE greater
    CMP [RDI + RCX], BL
    JNE not_equal
    INC RCX
    JMP loop

end:
    MOV RSP, RBP
    POP RBX
    POP RBP
    RET

not_equal:
    XOR RAX, RAX
    XOR RBX, RBX
    MOV AL, [RDI + RCX]
    MOV BL, [RSI + RCX]
    SUB EAX, EBX
    JMP end

greater:
    XOR RAX, RAX
    XOR RBX, RBX
    MOV AL, [RDI + RCX]
    MOV BL, [RSI + RCX]
    SUB EAX, EBX
    JMP end

less:
    CMP BYTE [RSI + RCX], 0
    JE equal
    JMP not_equal

equal:
    MOV RAX, 0
    JMP end
