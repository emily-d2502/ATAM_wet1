.global _start

.section .text
_start:
    movq $root, %rax
    cmpq $0, (%rax)
    je set_node
    movq (%rax), %rax
compare_key:
    movq (%rax), %rbx
    cmpq %rbx, (new_node)
    jl insert_left
    je end    
insert_right:
    addq $8, %rax
insert_left:
    addq $8, %rax
insert_node:
    cmpq $0, (%rax)
    je set_node
    movq (%rax), %rax
    jmp compare_key
set_node:
    movq $new_node, (%rax)
end:
