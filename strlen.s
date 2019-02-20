.global strlen

strlen:
.initialization:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $12, %rsp
    movl    $0, -4(%rbp)
    movq    %rdi, -12(%rbp)
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
    testb   %bl, %bl
    jne .incrementation
    movq    $0, %rax
    movl    -4(%rbp), %eax 

.deinitialization:
    popq    %rbx
    movq    %rbp, %rsp
    popq    %rbp
    ret
