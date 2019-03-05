BITS 64

SECTION .text

GLOBAL rindex ; char *rindex(const char *s, int c)

rindex:
    PUSH RBP
    MOV RBP, RSP
    XOR RCX, RCX

iter_loop:
    CMP BYTE [RDI + RCX], 0
    JE find_loop
    INC RCX
    JMP iter_loop

find_loop:
    CMP BYTE [RDI + RCX], SIL
    JE find
    CMP RCX, 0
    JE not_find
    DEC RCX
    JMP find_loop

not_find:
    MOV RAX, 0
    JMP end

find:
    MOV RAX, RDI
    ADD RAX, RCX
    JMP end

end:
    MOV RSP, RBP
    POP RBP
    RET
