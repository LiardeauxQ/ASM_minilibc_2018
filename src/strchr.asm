BITS 64

SECTION .text

GLOBAL strchr ; char *strchr(const char *s, int c)

strchr:
    PUSH RBP
    PUSH RCX
    MOV RBP, RSP
    XOR RCX, RCX

loop: 
    CMP BYTE [RDI + RCX], SIL
    JE matching
    CMP BYTE [RDI + RCX], 0
    JE no_matching
    INC RCX
    JMP loop

no_matching:
    MOV RAX, 0
    JMP end

matching:
    MOV RAX, RDI
    ADD RAX, RCX
    JMP end
    
end:
    MOV RSP, RBP
    POP RCX
    POP RBP
    RET
