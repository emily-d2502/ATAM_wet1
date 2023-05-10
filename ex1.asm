.global _start

.section .text
_start:
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
