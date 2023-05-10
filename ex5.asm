.global _start

.section .text
_start:
    cmpq $0, (root)
    movq $root, %rax
    je set_node_hw1
    movq (root), %rax
    jmp compare_key_hw1
insert_right_hw1:
    addq 8, %rax
insert_left_hw1:
    addq 8, %rax
insert_node_hw1:
    cmpq $0, (%rax)
    jne compare_key_hw1
set_node_hw1:
    movq $new_node, (%rax)
    jmp end_hw1
compare_key_hw1:
    movq (%rax), %rbx
    cmpq %rbx, (new_node)
    jg insert_right_hw1
    jl insert_left_hw1
end_hw1:
