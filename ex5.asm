.global _start

.section .text
_start:
    movq $root, %rax
    cmpq $0, (%rax)
    je set_node_hw1
    movq (%rax), %rax
compare_key_hw1:
    movq (%rax), %rbx
    cmpq %rbx, (new_node)
    jl insert_left_hw1
    je end_hw1
insert_right_hw1:
    addq $8, %rax
insert_left_hw1:
    addq $8, %rax
insert_node_hw1:
    cmpq $0, (%rax)
    je set_node_hw1
    movq (%rax), %rax
    jmp compare_key_hw1
set_node_hw1:
    movq $new_node, (%rax)
end_hw1:
