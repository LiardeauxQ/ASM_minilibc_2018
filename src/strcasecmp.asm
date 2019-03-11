BITS 64

SECTION .text

GLOBAL strcasecmp ; int strcasecmp(const char *s1, const char *s2)

strcasecmp:
    PUSH RBP
    PUSH RBX
    PUSH R8
    PUSH R9
    XOR R8, R8
    XOR R9, R9
    MOV RBP, RSP
    XOR RCX, RCX

loop:
    MOV R8B, [RDI + RCX]
    MOV R9B, [RSI + RCX]
    CMP R8B, 0
    JE less
    CMP R9B, 0
    JE compute
    JMP to_lower1

loop1:
    JMP to_lower2

loop2:
    CMP R8B, R9B
    JNE compute
    INC RCX
    JMP loop

compute:
    XOR RAX, RAX
    XOR RBX, RBX
    MOV AL, R8B
    MOV BL, R9B
    SUB EAX, EBX
    JMP end

less:
    CMP R9B, 0
    JE equal
    JMP compute

equal:
    MOV RAX, 0
    JMP end

end:
    MOV RSP, RBP
    POP R9
    POP R8 
    POP RBX
    POP RBP
    RET

to_lower1:
    CMP R8B, 65
    JGE check_upper1
    JE end1

check_upper1:
    CMP R8B, 90
    JLE convert1
    JMP end1

convert1:
    XOR R8B, 32
    JMP end1

end1:
    JMP loop1

to_lower2:
    CMP R9B, 65
    JGE check_upper2
    JE end2

check_upper2:
    CMP R9B, 90
    JLE convert2
    JMP end2

convert2:
    XOR R9B, 32
    JMP end2

end2:
    JMP loop2
