BITS 64

SECTION .text

GLOBAL strcspn ; size_t strcspn(const char *s, const char *reject)

strcspn:
    PUSH RBP
    PUSH RCX
    PUSH R10
    PUSH R9
    PUSH R8

    MOV RBP, RSP
    MOV R9, RSI
    XOR RCX, RCX
    XOR RAX, RAX

loop:
    CMP BYTE [RDI + RCX], 0
    JE end
    XOR R8, R8
    XOR R10, R10
    MOV R10, [RDI + RCX]
    JMP strchr

next_loop:
    INC RCX
    JMP loop

increment:
    INC RAX
    JMP next_loop

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
    JE end
    CMP BYTE [R9 + R8], 0
    JE increment
    INC R8
    JMP strchr

