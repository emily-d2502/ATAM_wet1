.global_start

.section .text 
_start:
	movq source, %rsi
	movq destination, %rdi
	movl num, %eax
	testl %eax, %eax 
	jl Negitive 
	jmp Positive 

Positive:
	sub %rsi, %rdi
	cmp num, %rdi
	jb Backwards
	jmp Forwards
Forwards:
	movl $0, %eax
	jmp Forwards_loop
Forwards_loop:
	movb source(%eax), %cl
	movb %cl, destination(%eax)
	inc %eax
	cmp num, %eax
	jne Forwards_loop
	jmp end
Backwards:
	movl num, %eax 
	jmp Backwards_loop
Backwards_loop:
	movb source-1(%eax), %cl
	movb %cl, destination-1(%eax)
	dec %eax
	jge Backwards_loop
	jmp end
Negative:
	movl num, %ecx
	movl %ecx, destination 
	jmp end
end: