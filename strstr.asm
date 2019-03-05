BITS 64

SECTION .text

GLOBAL strstr ; char *strstr(const char *haystack, const char *needle)
EXTERN strncmp
EXTERN strlen

strstr:
    PUSH RBP
    PUSH RBX
    PUSH RDX
    PUSH R8
    PUSH R9
    MOV RBP, RSP
    MOV RBX, RDI
    XOR R8, R8
    MOV RDI, RSI
    CALL strlen wrt ..plt
    MOV RDX, RAX

loop:
    CMP BYTE [RBX + R8], 0
    JE not_find
    MOV RDI, RBX
    ADD RDI, R8
    CALL strncmp wrt ..plt
    CMP RAX, 0
    JE find
    INC R8
    JMP loop

not_find:
    MOV RAX, 0x0
    JMP end

find:
    MOV RAX, RBX
    ADD RAX, R8

end:
    MOV RSP, RBP
    POP R9
    POP R8
    POP RDX
    POP RBX
    POP RBP
    RET
