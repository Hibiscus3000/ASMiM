	.file	"main.c"
	.text
	.globl	n
	.section	.rodata
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	9502720
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	swap, .-swap
	.globl	prepare_random_access_array
	.type	prepare_random_access_array, @function
prepare_random_access_array:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	rand@PLT
	movl	$9502720, %edx
	leal	-2(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	$1, -12(%rbp)
	jmp	.L3
.L4:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L3:
	movl	$9502720, %eax
	subl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L4
	movl	$9502720, %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	subl	$1, %edx
	movl	%edx, (%rax)
	movl	$9502720, %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	$1, -8(%rbp)
	jmp	.L5
.L6:
	call	rand@PLT
	movl	$9502720, %edx
	subl	-8(%rbp), %edx
	leal	-2(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	addl	$1, -8(%rbp)
.L5:
	movl	$9502720, %eax
	subl	$2, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L6
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	prepare_random_access_array, .-prepare_random_access_array
	.globl	get_ticks
	.type	get_ticks, @function
get_ticks:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 37 "main.c" 1
	rdtscp

# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$32, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movl	%eax, %eax
	orq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_ticks, .-get_ticks
	.section	.rodata
	.align 8
.LC0:
	.string	"Unable to allocate memory for random access array"
.LC1:
	.string	"average ticks: %lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$9502720, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L10
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L11
.L10:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	prepare_random_access_array
	movl	$0, -32(%rbp)
	movl	$0, %eax
	call	get_ticks
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L12
.L13:
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -32(%rbp)