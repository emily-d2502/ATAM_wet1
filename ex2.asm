.global_start

.section .text
_start:
    movl $num, %eax
    cdqe 
    js Negitive
    
Positive:
    mov $destination, %eax
    sub $source, %eax
    cmp $num, %eax
    jb Backwards

Forward:
    mov $0, %eax
Forward_loop:
    movb source(%eax), %cl
    movb %cl, destinantion(%eax)
    inc %eax
    cmp num, %eax
    jne Forward_loop
    jmp end

Backwards:
    mov num, %eax
Backwards_loop:
    movb source-1(%eax), %cl
    movb %cl, destination-1(%eax)
    dec %eax 
    jnz Backwards_loop    

Negitive:
    mov $0, %eax
    movl destination(%eax), $num

end:
