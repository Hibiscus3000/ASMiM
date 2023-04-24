	.file	"sample.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld\n"
	.text
	.globl	rd
	.type	rd, @function
rd:
.LFB5739:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	rdtscp
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %r15
	testq	%rsi, %rsi
	jle	.L2
	movq	%rdi, %r13
	movq	%rsi, %r12
	movl	$0, %ebx
	movl	$0, %ebp
	leaq	.LC0(%rip), %r14
.L3:
	addq	0(%r13,%rbx,8), %rdx
	addq	8(%r13,%rbx,8), %rdx
	movq	%r14, %rsi
	addq	$2, %rbx
	cmpq	%rbx, %r12
	jne	.L3
.L2:
	rdtscp
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%r15, %rax
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5739:
	.size	rd, .-rd
	.globl	wr
	.type	wr, @function
wr:
.LFB5740:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	rdtscp
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %r15
	testq	%rsi, %rsi
	jle	.L9
	movq	%rdi, %r13
	movq	%rsi, %r12
	movl	$0, %ebx
	leaq	.LC0(%rip), %r14
.L10:
	movq	%rbp, 0(%r13,%rbx,8)
	movq	%rbp, 8(%r13,%rbx,8)
	movq	%rbp, %rdx
	movq	%r14, %rsi
	addq	$2, %rbx
	cmpq	%rbx, %r12
	jne	.L10
.L9:
	rdtscp
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%r15, %rax
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L14
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5740:
	.size	wr, .-wr
	.section	.rodata.str1.1
.LC1:
	.string	"%s: %s\n"
	.text
	.globl	check_code
	.type	check_code, @function
check_code:
.LFB5736:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jne	.L21
	ret
.L21:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rbx
	call	strerror@PLT
	movq	%rax, %r8
	movq	%rbx, %rcx
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5736:
	.size	check_code, .-check_code
	.section	.rodata.str1.1
.LC2:
	.string	"%.4f;"
.LC3:
	.string	"write()"
.LC4:
	.string	"write to file error\n"
	.text
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
.LFB5737:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$272, %rsp
	.cfi_def_cfa_offset 304
	movl	%edi, %ebp
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r12
	leaq	.LC2(%rip), %rcx
	movl	$256, %edx
	movl	$1, %esi
	movq	%r12, %rdi
	movl	$1, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rbx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movl	%ebp, %edi
	call	write@PLT
	movslq	%eax, %rdx
	cmpq	%rdx, %rbx
	jbe	.L22
	testl	%eax, %eax
	js	.L27
	movq	stderr(%rip), %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
.L22:
	movq	264(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L28
	addq	$272, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	jmp	.L22
.L28:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5737:
	.size	write_to_file, .-write_to_file
	.section	.rodata.str1.1
.LC5:
	.string	"posix_memalign"
	.text
	.globl	get_array
	.type	get_array, @function
get_array:
.LFB5738:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	je	.L30
	cmpl	$1, %esi
	je	.L31
.L29:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L38
	movq	%rbx, %rax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L30:
	.cfi_restore_state
	salq	$3, %rdi
	call	malloc@PLT
	movq	%rax, %rbx
	jmp	.L29
.L31:
	leaq	0(,%rdi,8), %rdx
	movq	%rsp, %rdi
	movl	$8, %esi
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L34
	movq	(%rsp), %rbx
	leaq	.LC5(%rip), %rsi
	movl	$0, %edi
	call	check_code
	jmp	.L29
.L34:
	leaq	.LC5(%rip), %rsi
	movl	%eax, %edi
	call	check_code
	movl	$0, %ebx
	jmp	.L29
.L38:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5738:
	.size	get_array, .-get_array
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"unable to allocate memory for new array for copying\n"
	.text
	.globl	cp
	.type	cp, @function
cp:
.LFB5741:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, %r13
	movq	%rsi, %r12
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	%edx, %esi
	movq	%r12, %rdi
	call	get_array
	testq	%rax, %rax
	je	.L47
	movq	%rax, %rbp
	rdtscp
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %r15
	testq	%r12, %r12
	jle	.L42
	movl	$0, %ebx
	leaq	.LC0(%rip), %r14
.L43:
	movq	0(%r13,%rbx,8), %rdx
	movq	%rdx, 0(%rbp,%rbx,8)
	movq	8(%r13,%rbx,8), %rdx
	movq	%rdx, 8(%rbp,%rbx,8)
	movq	%r14, %rsi
	addq	$2, %rbx
	cmpq	%rbx, %r12
	jne	.L43
.L42:
	rdtscp
	movq	%rax, %rbx
	movl	%ecx, 4(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rbx
	movq	%rbp, %rdi
	call	free@PLT
	movq	%rbx, %rax
	subq	%r15, %rax
.L39:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L48
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L47:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
	movq	$-1, %rax
	jmp	.L39
.L48:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5741:
	.size	cp, .-cp
	.section	.rodata.str1.1
.LC7:
	.string	"sched_setaffinity"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"%d: unable to allocate memory for array\n"
	.text
	.globl	test_param
	.type	test_param, @function
test_param:
.LFB5742:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdx
	movl	$16, %ecx
	movq	%rdx, %rdi
	rep stosq
	movl	8(%rbx), %ecx
	movslq	%ecx, %rax
	cmpq	$1023, %rax
	ja	.L50
	shrq	$6, %rax
	movl	$1, %edx
	salq	%cl, %rdx
	orq	%rdx, (%rsp,%rax,8)
.L50:
	movq	%rsp, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	movl	%eax, %edi
	leaq	.LC7(%rip), %rsi
	call	check_code
	movq	24(%rbx), %r12
	shrq	$3, %r12
	movl	32(%rbx), %esi
	movq	%r12, %rdi
	call	get_array
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L54
	movq	(%rbx), %rdi
	call	pthread_barrier_wait@PLT
	movq	40(%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*16(%rbx)
	movq	40(%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*16(%rbx)
	movq	%rax, %r13
	movq	40(%rbx), %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	*16(%rbx)
	movq	%r13, 48(%rbx)
	movq	%rbp, %rdi
	call	free@PLT
.L49:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L55
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L54:
	.cfi_restore_state
	call	getpid@PLT
	movl	%eax, %ecx
	leaq	.LC8(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	$-1, 48(%rbx)
	movl	$0, %eax
	jmp	.L49
.L55:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5742:
	.size	test_param, .-test_param
	.section	.rodata.str1.1
.LC10:
	.string	"read"
.LC11:
	.string	"write"
.LC12:
	.string	"copy"
.LC13:
	.string	"pthread_create"
.LC14:
	.string	"pthread_join"
.LC16:
	.string	"%ld: %s %.5f GBps\n"
.LC17:
	.string	"\t%s %.5f GBps\n"
	.text
	.globl	test
	.type	test, @function
test:
.LFB5743:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$312, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -224(%rbp)
	movq	%rsi, %rax
	movq	%rdx, -280(%rbp)
	movl	%r8d, -236(%rbp)
	movq	%fs:40, %rdx
	movq	%rdx, -56(%rbp)
	xorl	%edx, %edx
	leaq	-1(%rdi), %rdx
	movq	%rdx, -216(%rbp)
	leaq	7(,%rdi,8), %rdx
	movq	%rdx, %rdi
	andq	$-16, %rdi
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
.L57:
	cmpq	%rsi, %rsp
	je	.L58
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L57
.L58:
	movq	%rdi, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	je	.L59
	orq	$0, -8(%rsp,%rdx)
.L59:
	movq	%rsp, %r15
	cqto
	idivq	-280(%rbp)
	movq	%rax, -272(%rbp)
	movq	%rcx, %rax
	movq	-224(%rbp), %rbx
	cqto
	idivq	%rbx
	movq	%rax, -232(%rbp)
	leaq	rd(%rip), %rax
	movq	%rax, -192(%rbp)
	leaq	wr(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	cp(%rip), %rax
	movq	%rax, -176(%rbp)
	leaq	.LC10(%rip), %rax
	movq	%rax, -160(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -152(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	$0, -128(%rbp)
	movq	%r9, -120(%rbp)
	movl	-236(%rbp), %eax
	movq	%rax, -112(%rbp)
	leaq	-96(%rbp), %rdi
	movl	%ebx, %edx
	movl	$0, %esi
	call	pthread_barrier_init@PLT
	leaq	0(,%rbx,8), %rax
	subq	%rbx, %rax
	salq	$3, %rax
	leaq	-56(%rax), %rdx
	movq	%rdx, -336(%rbp)
	leaq	-160(%rbp), %rdx
	movq	%rdx, -296(%rbp)
	movq	$0, -288(%rbp)
	addq	$15, %rax
	movq	%rax, %rdx
	andq	$-16, %rdx
	movq	%rdx, -344(%rbp)
	andq	$-4096, %rax
	movq	%rax, -328(%rbp)
	jmp	.L74
.L61:
	movq	-344(%rbp), %rdx
	movq	%rdx, %rax
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L62
	movq	%rdx, %rax
	andl	$4095, %eax
	orq	$0, -8(%rsp,%rax)
.L62:
	leaq	7(%rsp), %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	andq	$-8, %rdx
	movq	%rdx, %r13
	movq	%rdx, -304(%rbp)
	cmpq	$0, -224(%rbp)
	jle	.L63
	leaq	-96(%rbp), %rdx
	movq	%rdx, 0(,%rax,8)
	movl	-280(%rbp), %edx
	movl	%edx, -208(%rbp)
	movl	$0, 8(,%rax,8)
	movq	-288(%rbp), %rdx
	movq	-192(%rbp,%rdx), %rsi
	movq	%rsi, -248(%rbp)
	movq	%rsi, 16(,%rax,8)
	movq	-232(%rbp), %rsi
	movq	%rsi, 24(,%rax,8)
	movl	-236(%rbp), %esi
	movl	%esi, 32(,%rax,8)
	movq	-128(%rbp,%rdx), %rdx
	movq	%rdx, -256(%rbp)
	movq	%rdx, 40(,%rax,8)
	cmpq	$0, -216(%rbp)
	je	.L64
	movq	%r15, %r14
	movl	$0, %r12d
	movl	$0, -200(%rbp)
	movl	$0, %edx
	leaq	-96(%rbp), %rax
	movq	%rax, -264(%rbp)
	movq	%r15, -320(%rbp)
	movl	%edx, %r15d
	jmp	.L65
.L67:
	addq	$1, %r12
	cmpq	%r12, -224(%rbp)
	je	.L85
	movq	-264(%rbp), %rax
	movq	%rax, 56(%rbx)
	imull	-208(%rbp), %ecx
	addl	-200(%rbp), %ecx
	movl	%ecx, 64(%rbx)
	movq	-248(%rbp), %rax
	movq	%rax, 72(%rbx)
	movq	-232(%rbp), %rax
	movq	%rax, 80(%rbx)
	movl	-236(%rbp), %eax
	movl	%eax, 88(%rbx)
	movq	-256(%rbp), %rax
	movq	%rax, 96(%rbx)
	addq	$8, %r14
	addq	$56, %r13
	cmpq	%r12, -216(%rbp)
	je	.L83
.L65:
	movq	%r13, %rbx
	movq	%r13, %rcx
	leaq	test_param(%rip), %rdx
	movl	$0, %esi
	movq	%r14, %rdi
	call	pthread_create@PLT
	movl	%eax, %edi
	leaq	.LC13(%rip), %rsi
	call	check_code
	leal	1(%r15), %eax
	cltd
	idivl	-272(%rbp)
	movl	%edx, %ecx
	movl	%edx, %r15d
	testl	%edx, %edx
	jne	.L67
	movl	-200(%rbp), %eax
	addl	$1, %eax
	cltq
	cqto
	idivq	-280(%rbp)
	movl	%edx, -200(%rbp)
	jmp	.L67
.L85:
	movq	-320(%rbp), %r15
.L66:
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	cmpq	$0, -216(%rbp)
	jle	.L75
.L76:
	movl	$0, %ebx
	leaq	.LC14(%rip), %r12
	movq	-216(%rbp), %r13
.L69:
	movq	(%r15,%rbx,8), %rdi
	movl	$0, %esi
	call	pthread_join@PLT
	movl	%eax, %edi
	movq	%r12, %rsi
	call	check_code
	addq	$1, %rbx
	cmpq	%rbx, %r13
	jg	.L69
	cmpq	$0, -224(%rbp)
	jle	.L78
.L75:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	-232(%rbp), %xmm0
	mulsd	.LC15(%rip), %xmm0
	movq	-304(%rbp), %r12
	addq	$48, %r12
	movl	$0, %ebx
	pxor	%xmm3, %xmm3
	movsd	%xmm3, -200(%rbp)
	leaq	.LC16(%rip), %r14
	movsd	%xmm0, -248(%rbp)
	movq	-224(%rbp), %r13
	movq	%r15, -256(%rbp)
	movq	-296(%rbp), %r15
	jmp	.L73
.L71:
	shrq	%rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
.L72:
	movsd	-248(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -208(%rbp)
	movapd	%xmm1, %xmm0
	movq	(%r15), %rcx
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	16(%rbp), %edi
	movsd	-200(%rbp), %xmm0
	call	write_to_file
	movsd	-200(%rbp), %xmm2
	addsd	-208(%rbp), %xmm2
	movsd	%xmm2, -200(%rbp)
	addq	$1, %rbx
	addq	$56, %r12
	cmpq	%rbx, %r13
	jle	.L86
.L73:
	movq	(%r12), %rax
	salq	$30, %rax
	js	.L71
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L72
.L86:
	movq	-256(%rbp), %r15
.L70:
	movsd	-200(%rbp), %xmm0
	movq	-296(%rbp), %rbx
	movq	(%rbx), %rdx
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	16(%rbp), %edi
	movsd	-200(%rbp), %xmm0
	call	write_to_file
	movq	-312(%rbp), %rsp
	addq	$8, %rbx
	movq	%rbx, -296(%rbp)
	addq	$8, -288(%rbp)
	movq	-288(%rbp), %rax
	cmpq	$24, %rax
	je	.L87
.L74:
	movq	%rsp, -312(%rbp)
	movq	%rsp, %rax
	subq	-328(%rbp), %rax
.L60:
	cmpq	%rax, %rsp
	je	.L61
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L60
.L78:
	pxor	%xmm4, %xmm4
	movsd	%xmm4, -200(%rbp)
	jmp	.L70
.L87:
	leaq	-96(%rbp), %rdi
	call	pthread_barrier_destroy@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L88
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L64:
	.cfi_restore_state
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	jmp	.L75
.L83:
	movq	-320(%rbp), %r15
	jmp	.L66
.L63:
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	cmpq	$0, -216(%rbp)
	jg	.L76
	pxor	%xmm5, %xmm5
	movsd	%xmm5, -200(%rbp)
	jmp	.L70
.L88:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5743:
	.size	test, .-test
	.section	.rodata.str1.1
.LC18:
	.string	"invalid %s\n"
	.text
	.globl	get_arg
	.type	get_arg, @function
get_arg:
.LFB5744:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	movl	$10, %edx
	call	strtoll@PLT
	cmpq	%rbx, (%rsp)
	je	.L93
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L94
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L93:
	.cfi_restore_state
	movq	%rbp, %rcx
	leaq	.LC18(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$-1, %edi
	call	exit@PLT
.L94:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5744:
	.size	get_arg, .-get_arg
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"not enough arguments, number of threads, number of cpus, number of virtual threads, array size, memory allocation type, to write value and file name, where to put results\n"
	.section	.rodata.str1.1
.LC20:
	.string	"number of threads"
.LC21:
	.string	"number of cpus"
.LC22:
	.string	"number of virual threads"
.LC23:
	.string	"array size"
.LC24:
	.string	"memory allocation type"
.LC25:
	.string	"to write value"
.LC26:
	.string	"open()"
.LC27:
	.string	"getrlimit()"
.LC28:
	.string	"setrlimit()"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5745:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$7, %edi
	jle	.L104
	movq	%rsi, %rbx
	movq	8(%rsi), %rdi
	leaq	.LC20(%rip), %rsi
	call	get_arg
	movq	%rax, (%rsp)
	movq	16(%rbx), %rdi
	leaq	.LC21(%rip), %rsi
	call	get_arg
	movq	%rax, 8(%rsp)
	movq	24(%rbx), %rdi
	leaq	.LC22(%rip), %rsi
	call	get_arg
	movq	%rax, %r13
	movq	32(%rbx), %rdi
	leaq	.LC23(%rip), %rsi
	call	get_arg
	movq	%rax, %r12
	movq	40(%rbx), %rdi
	leaq	.LC24(%rip), %rsi
	call	get_arg
	movq	%rax, %r14
	movq	48(%rbx), %rdi
	leaq	.LC25(%rip), %rsi
	call	get_arg
	movq	%rax, %r15
	movq	56(%rbx), %rdi
	movl	$448, %edx
	movl	$1090, %esi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, %ebp
	cmpl	$-1, %eax
	je	.L105
	leaq	16(%rsp), %rsi
	movl	$9, %edi
	call	getrlimit@PLT
	testl	%eax, %eax
	jne	.L106
	imulq	$3, %r12, %rax
	movq	16(%rsp), %rdx
	cmpq	%rdx, %rax
	cmovb	%rdx, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, 24(%rsp)
	leaq	16(%rsp), %rsi
	movl	$2, %edi
	call	setrlimit@PLT
	testl	%eax, %eax
	jne	.L100
	leaq	16(%rsp), %rsi
	movl	$9, %edi
	call	setrlimit@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L101
.L100:
	leaq	.LC28(%rip), %rdi
	call	perror@PLT
	movl	$1, %ebx
	jmp	.L95
.L104:
	movq	stderr(%rip), %rcx
	movl	$171, %edx
	movl	$1, %esi
	leaq	.LC19(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %ebx
.L95:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L107
	movl	%ebx, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L105:
	.cfi_restore_state
	leaq	.LC26(%rip), %rdi
	call	perror@PLT
	movl	$1, %ebx
	jmp	.L95
.L106:
	leaq	.LC27(%rip), %rdi
	call	perror@PLT
	movl	$2, %ebx
	jmp	.L95
.L101:
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	%rbp
	.cfi_def_cfa_offset 128
	movq	%r15, %r9
	movl	%r14d, %r8d
	movq	%r12, %rcx
	movq	%r13, %rdx
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	call	test
	addq	$16, %rsp
	.cfi_def_cfa_offset 112
	jmp	.L95
.L107:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5745:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC15:
	.long	0
	.long	1105322403
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
