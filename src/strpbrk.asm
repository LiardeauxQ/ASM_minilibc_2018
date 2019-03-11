BITS 64

SECTION .text

GLOBAL strpbrk ; char *strpbrk(const char *s, const char *accept)

strpbrk:
    PUSH RBP
    PUSH RCX
    PUSH R10
    PUSH R9
    PUSH R8

    MOV RBP, RSP
    MOV R9, RSI
    XOR RCX, RCX

loop:
    CMP BYTE [RDI + RCX], 0
    JE not_find
    XOR R8, R8
    XOR R10, R10
    MOV R10, [RDI + RCX]
    JMP strchr

next_loop:
    INC RCX
    JMP loop

not_find:
    MOV RAX, 0
    JMP end

find:
    MOV RAX, RDI
    ADD RAX, RCX

end:
    MOV RSP, RBP
    POP R8
    POP R9
    POP R10
    POP RCX
    POP RBP
    RET

strchr:
    CMP BYTE [R9 + R8], R10B
    JE find
    CMP BYTE [R9 + R8], 0
    JE next_loop
    INC R8
    JMP strchr
