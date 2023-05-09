.global _start

.section .text
_start:
    cmpq $0, (root)
    movq $root, %rax
    je set_node
    movq (root), %rax
    jmp compare_key    
insert_right:
    addq 8, %rax
insert_left:
    addq 8, %rax
insert_node:
    cmpq $0, (%rax)
    jne compare_key
set_node:
    movq $new_node, (%rax)
    jmp end
compare_key:
    movq (%rax), %rbx
    cmpq %rbx, (new_node)
    jg insert_right
    jl insert_left
end: