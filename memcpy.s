.global memcpy

memcpy:
.initialization:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp
    movq    %rdi, -8(%rbp)
    movq    %rsi, -16(%rbp)
    movq    %rdx, -24(%rbp)
    pushq   %rbx
    pushq   %rcx
    movq $0, %rax
    movq $0, %rcx
    jmp .check_parameters

.incrementation:
    addl    $1, %ecx

.loop:
    movq    -8(%rbp), %rbx
    addq    %rcx, %rbx
    movq    -16(%rbp), %rax
    addq    %rcx, %rax
    movzbl  (%rax), %eax
    movl    %eax, (%rbx)
    movq    -24(%rbp), %rax
    cmp     %rax, %rcx
    jl .incrementation
    movq    -8(%rbp), %rax

.deinitialization:
    popq    %rcx
    popq    %rbx
    movq    %rbp, %rsp
    popq    %rbp
    ret

.check_parameters:
    movq -8(%rbp), %rbx
    cmp $0, %rbx
    je .deinitialization
    movq -16(%rbp), %rbx
    cmp $0, %rbx
    je .deinitialization
    movq -24(%rbp), %rbx
    cmp $0, %rbx
    jle .deinitialization
    jmp .loop
