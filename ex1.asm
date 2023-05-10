.global _start

.section .text
_start:
    movq $0, %rcx
    movb $0, Bool
    jmp _L2_hw1
_L1_hw1:
    movq num, %rax
    shrq %cl, %rax
    andq $1, %rax              
    addb %al, Bool            
    addq $1, %rcx                   
_L2_hw1:
    cmpq $64, %rcx 
    jl _L1_hw1                      
