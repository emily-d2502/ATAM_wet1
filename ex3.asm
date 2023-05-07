.global _start

.section .text
_start:
    xor r1, r1
    xor r2, r2
    xor r3, r3
    jmp L1
L4:
    movl array1(,r1, 4), eax
    cmpl array2(,r2, 4), eax
    jge L2
    movl eax, merged(,r3,4)
    incq r1
    jmp L3
L2:
    movl array2(,r2, 4), eax
    movl eax, merged(,r3,4)
    incq r2
L3:
    incq r3
L1:
    cmpl array1(,r1, 4), 0
    jne L4
    cmpl array2(,r2, 4), 0
    jne L4