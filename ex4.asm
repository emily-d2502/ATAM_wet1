.global_start

.section .text
_start:
	movq head, %rdi
	movl Value, %eax
	movq Source, %rsi
	cmpl (%rsi), %eax
	je end
.L1: 
	movl (%rdi), %ecx
	cmpl %eax, %ecx
	je find_Src
	movq %rdi, %r9
	movq 4(%rdi), %rdi
	testq %rdi, %rdi
	jne .L1
	jmp end
find_Src:
	movq head, %rsi
	cmp %rsi, Source 
	je src_is_first
loop:
	movq 4(%rsi), %r12
	cmp %r12, Source 
	je save_prev
	movq 4(5rsi), %rsi
	testq %rsi, %rsi
	jne loop 
	jmp end 
save_prev:
	movq %rsi, %r8
	movq head, %r15
	cmpl (%r15), %eax
	je val_is_first
	jmp swap_nodes
src_is_first:
	movq Source, %rsi
	movq 4(%rsi), %r13
	movq 4(%rdi), %r14
	cmp %r13, %rdi
	je val_after_src_and
	movq %rdi, head
	movq %r14, 4(%rsi)
	movq %rsi, 4(%r9)
	movq %r13, 4(%rdi)
	jmp end
val_is_first:
	movq Source, %rsi
	movq 4(%rsi), %r13
	movq 4(%rdi), %r14
	cmp %rsi, 4(%rdi)
	je src_after_val_and
	movq %rdi, 4(%r8)
	movq %r14, 4(%rsi)
	movq %rsi, head
	movq %r13, 4(%rdi)
	jmp end
swap_nodes:
	movq Source, %rsi
	movq 4(%rsi), %r13
	movq 4(%rdi), %r14
	cmp %r13, %rdi
	je val_after_src
	movq %rsi, 4(%r9)
	movq %14, 4(%rsi)
	movq %rdi, 4(%r8)
	movq %r13, 4(%rdi)
	jmp end
src_after_val:
	movq %rsi, 4(%r9)
	movq %rdi, 4(%rsi)
	movq %r13, 4(%rsi)
	jmp end
val_after_src:
	movq %rsi, 4(%rdi)
	movq %rdi, 4(%r8)
	movq %r14, 4(%rsi)
	jmp end
val_after_src_and:
	movq %rsi, 4(%rdi)
	movq %rdi, head
	movq %r14, r(%rsi)
	jmp end
src_after_val_and:
	movq %rsi, head
	movq %rdi, 4(%rsi)
	movq %r13, 4(%rdi)
	jmp end

end: