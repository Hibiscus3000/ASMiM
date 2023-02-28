	movl	-336(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -336(%rbp)