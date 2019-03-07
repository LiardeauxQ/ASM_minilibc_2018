BITS 64

SECTION .text

GLOBAL strpbrk ; char *strpbrk(const char *s, const char *accept)
EXTERN strchr

strpbrk:
    PUSH RBP
    PUSH RCX
    PUSH RDX
    MOV RBP, RSP
    MOV RDX, RDI
    MOV RDI, RSI
    XOR RCX, RCX

loop:
    CMP BYTE [RDX + RCX], 0
    JE not_find
    XOR RSI, RSI
    MOV SIL, [RDX + RCX]
    CALL strchr wrt ..plt
    CMP RAX, 0
    JNE find
    INC RCX
    JMP loop

not_find:
    MOV RAX, 0
    JMP end

find:
    MOV RAX, RDX
    ADD RAX, RCX

end:
    MOV RSP, RBP
    POP RDX
    POP RCX
    POP RBP
    RET
