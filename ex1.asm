.global _start

.section .text
_start:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rcx, -8(%rbp)            # saving rcx
    movq %rax, -16(%rbp)            # saving rax
    movq $0, %rcx
    movb $0, Bool
    jmp _L2_ex1
_L1_ex1:
    movq num, %rax
    shrq %cl, %rax
    andq $1, %rax              # lsb
    addb %al, Bool            # Bool += num[i]
    addq $1, %rcx                   # ++i
_L2_ex1:
    cmpq $64, %rcx 
    jl _L1_ex1                      # if i < 64 GOTO L1_ex1
    movq -8(%rbp), %rcx             # recovering rcx
    movq -16(%rbp), %rax            # recovering rax
    leave 
