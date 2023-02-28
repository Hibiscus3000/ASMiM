	.file	"main.c"
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
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
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
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L4
	movl	$0, -8(%rbp)
	jmp	.L5
.L6:
	call	rand@PLT
	movl	-28(%rbp), %edx
	subl	-8(%rbp), %edx
	leal	-1(%rdx), %ecx
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
	movl	-28(%rbp), %eax
	subl	$1, %eax
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
# 33 "main.c" 1
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
	.string	"Expected 2 arguments:\n\tarray size\n\t.csv file, where to place results\n"
.LC1:
	.string	"Invalid array size\n"
.LC2:
	.string	"open()"
	.align 8
.LC3:
	.string	"Unable to allocate memory for random access array"
.LC4:
	.string	"time = %lld "
.LC5:
	.string	"%lld;"
.LC6:
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
	subq	$352, %rsp
	movl	%edi, -340(%rbp)
	movq	%rsi, -352(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -340(%rbp)
	je	.L10
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L17
.L10:
	movq	-352(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -320(%rbp)
	cmpl	$0, -320(%rbp)
	jg	.L12
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$19, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$2, %eax
	jmp	.L17
.L12:
	movq	-352(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$448, %edx
	movl	$1090, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -316(%rbp)
	cmpl	$-1, -316(%rbp)
	jne	.L13
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$3, %eax
	jmp	.L17
.L13:
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	-320(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -312(%rbp)
	cmpq	$0, -312(%rbp)
	jne	.L14
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L17
.L14:
	movl	-320(%rbp), %edx
	movq	-312(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	prepare_random_access_array
	movl	$0, -328(%rbp)
	movl	$0, %eax
	call	get_ticks
	movq	%rax, -304(%rbp)
	movl	$0, -324(%rbp)
	jmp	.L15
.L16:
	movl	-328(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-312(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -328(%rbp)