.global _start

.section .text
_start:
    xor %rax, %rax
    xor %rbx, %rbx
    xor %rcx, %rcx
    movq $mergedArray, %r8
    jmp _L4_ex3
_L1_ex3:
    movl array1(, %rax, 4), %edx
    cmpl array2(, %rbx, 4), %edx
    jl _L2_ex3
    incq %rax
    jmp _L3_ex3
_L2_ex3:
    movl array2(, %rbx, 4), %edx
    incq %rbx
_L3_ex3:
    cmpl %edx, -4(%r8, %rcx, 4)
    je _L4_ex3
    movl %edx, (%r8, %rcx, 4)
    incq %rcx
_L4_ex3:
    cmpl $0, array1(, %rax, 4)
    jne _L1_ex3
    cmpl $0, array2(, %rbx, 4)
    jne _L1_ex3
    movl $0, (%r8, %rcx, 4)
