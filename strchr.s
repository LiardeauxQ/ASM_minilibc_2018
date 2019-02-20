.global strchr

strchr:
.initialization:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $20, %rsp
    movl    $0, -4(%rbp)
    movq    %rdi, -12(%rbp)
    movq    %rsi, -20(%rbp)
    pushq   %rbx
    movq -12(%rbp), %rbx
    cmp $0, %rbx
    je .deinitialization
    jmp .loop

.incrementation:
    addl    $1, -4(%rbp)

.loop:
    movq    -12(%rbp), %rbx
    movl    -4(%rbp), %eax
    addq    %rax, %rbx
    movzbl  (%rbx), %ebx
    cmp %bl, -20(%rbp)
    je .end_loop
    cmp     $0, %bl
    jne .incrementation
    movq $0, %rax
    jmp .deinitialization
.end_loop:
    movq    $0, %rax
    movl    -4(%rbp), %ebx
    movq    -12(%rbp), %rax
    addq    %rbx, %rax
.deinitialization:
    popq    %rbx
    movq    %rbp, %rsp
    popq    %rbp
    ret
