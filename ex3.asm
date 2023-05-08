.global _start

.section .text
_start:
    xor %rax, %rax
    xor %rbx, %rbx
    xor %rcx, %rcx
    jmp _L1_ex3
_L4_ex3:
    movl array1(, %rax, 4), %edx
    cmpl array2(, %rbx, 4), %edx
    jge _L2_ex3
    movl %edx, mergedArray(, %rcx, 4)
    incq %rax
    jmp _L3_ex3
_L2_ex3:
    movl array2(, %rbx, 4), %edx
    movl %edx, mergedArray(, %rcx, 4)
    incq %rbx
_L3_ex3:
    incq %rcx
_L1_ex3:
    cmpl array1(, %rax, 4), $0
    jne _L4_ex3
    cmpl array2(, %rbx, 4), $0
    jne _L4_ex3