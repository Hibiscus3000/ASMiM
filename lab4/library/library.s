	.file	"library.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s: %s\n"
	.text
	.globl	check_code
	.type	check_code, @function
check_code:
.LFB4379:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$32, %rsp
	movl	%edi, -8212(%rbp)
	movq	%rsi, -8224(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -8212(%rbp)
	je	.L4
	leaq	-8208(%rbp), %rcx
	movl	-8212(%rbp), %eax
	movl	$8192, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	strerror_r@PLT
	movq	stderr(%rip), %rax
	leaq	-8208(%rbp), %rcx
	movq	-8224(%rbp), %rdx
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L4:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4379:
	.size	check_code, .-check_code
	.section	.rodata
.LC1:
	.string	"%.4f;"
.LC2:
	.string	"write()"
.LC3:
	.string	"write to file error\n"
	.text
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
.LFB4380:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$312, %rsp
	.cfi_offset 3, -24
	movsd	%xmm0, -312(%rbp)
	movl	%edi, -316(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-312(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rbx
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	leaq	-288(%rbp), %rcx
	movl	-316(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	%eax, -292(%rbp)
	movl	-292(%rbp), %eax
	cltq
	cmpq	%rax, %rbx
	jbe	.L9
	cmpl	$0, -292(%rbp)
	jns	.L7
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L9
.L7:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L9:
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4380:
	.size	write_to_file, .-write_to_file
	.section	.rodata
.LC4:
	.string	"posix_memalign"
	.text
	.globl	get_array
	.type	get_array, @function
get_array:
.LFB4381:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$0, -44(%rbp)
	je	.L11
	cmpl	$1, -44(%rbp)
	je	.L12
	jmp	.L18
.L11:
	movq	-40(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	jmp	.L10
.L12:
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	-16(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	posix_memalign@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	check_code
	cmpl	$0, -20(%rbp)
	je	.L15
	movl	$0, %eax
	jmp	.L10
.L15:
	movq	-16(%rbp), %rax
	jmp	.L10
.L18:
.L10:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4381:
	.size	get_array, .-get_array
	.globl	rd
	.type	rd, @function
rd:
.LFB4382:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-52(%rbp), %rax
	movq	%rax, -16(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-16(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	memchr@PLT
	movq	%rax, -40(%rbp)
	leaq	-52(%rbp), %rax
	movq	%rax, -24(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-24(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	subq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4382:
	.size	rd, .-rd
	.globl	wr
	.type	wr, @function
wr:
.LFB4383:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-88(%rbp), %rax
	movq	%rax, -48(%rbp)
	leaq	-52(%rbp), %rax
	movq	%rax, -16(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-16(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	-80(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	movl	%eax, %ecx
	movq	-72(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, -24(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-24(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	subq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4383:
	.size	wr, .-wr
	.globl	cp
	.type	cp, @function
cp:
.LFB4384:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-88(%rbp), %rax
	movl	%eax, %edx
	movq	-80(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	get_array
	movq	%rax, -48(%rbp)
	leaq	-52(%rbp), %rax
	movq	%rax, -16(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-16(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	-80(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, -24(%rbp)
	rdtscp
	movl	%ecx, %esi
	movq	-24(%rbp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	subq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4384:
	.size	cp, .-cp
	.section	.rodata
.LC5:
	.string	"sched_setaffinity"
	.align 8
.LC6:
	.string	"%d: unable to allocate memory for array\n"
	.text
	.globl	test_param
	.type	test_param, @function
test_param:
.LFB4385:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-200(%rbp), %rax
	movq	%rax, -184(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	movq	-184(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	movq	%rax, -176(%rbp)
	cmpq	$1023, -176(%rbp)
	ja	.L36
	movq	-176(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-144(%rbp), %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rsi
	movq	-176(%rbp), %rdx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	leaq	0(,%rax,8), %rcx
	leaq	-144(%rbp), %rax
	addq	%rcx, %rax
	orq	%rsi, %rdx
	movq	%rdx, (%rax)
.L36:
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	movl	%eax, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	check_code
	movq	-184(%rbp), %rax
	movq	24(%rax), %rax
	shrq	$3, %rax
	movq	%rax, -168(%rbp)
	movq	-184(%rbp), %rax
	movl	32(%rax), %edx
	movq	-168(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	get_array
	movq	%rax, -160(%rbp)
	movq	$0, -192(%rbp)
	jmp	.L37
.L38:
	movq	-192(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	addq	$1, -192(%rbp)
.L37:
	movq	-192(%rbp), %rax
	cmpq	-168(%rbp), %rax
	jl	.L38
	cmpq	$0, -160(%rbp)
	jne	.L39
	call	getpid@PLT
	movl	%eax, %edx
	movq	stderr(%rip), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-184(%rbp), %rax
	movq	$-1, 48(%rax)
	movl	$0, %eax
	jmp	.L34
.L39:
	movq	-184(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	pthread_barrier_wait@PLT
	movq	-184(%rbp), %rax
	movq	16(%rax), %r8
	movq	-184(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-168(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*%r8
	movq	-184(%rbp), %rax
	movq	16(%rax), %r8
	movq	-184(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-168(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*%r8
	movq	%rax, -152(%rbp)
	movq	-184(%rbp), %rax
	movq	16(%rax), %r8
	movq	-184(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-168(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*%r8
	movq	-184(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L34:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4385:
	.size	test_param, .-test_param
	.section	.rodata
.LC7:
	.string	"read"
.LC8:
	.string	"write"
.LC9:
	.string	"copy"
.LC10:
	.string	"pthread_create"
.LC11:
	.string	"pthread_join"
.LC14:
	.string	"%ld: %s %.5f GBps\n"
.LC15:
	.string	"\t%s %.5f GBps\n"
	.text
	.globl	test
	.type	test, @function
test:
.LFB4386:
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
	subq	$328, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -312(%rbp)
	movq	%rsi, -320(%rbp)
	movq	%rdx, -328(%rbp)
	movq	%rcx, -336(%rbp)
	movl	%r8d, -340(%rbp)
	movq	%r9, -352(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-312(%rbp), %rax
	subq	$1, %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -240(%rbp)
	movq	%rax, %rdx
	movq	%rdx, -368(%rbp)
	movq	$0, -360(%rbp)
	movq	%rax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L43:
	cmpq	%rdx, %rsp
	je	.L44
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L43
.L44:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L45
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L45:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -232(%rbp)
	movq	-320(%rbp), %rax
	cqto
	idivq	-328(%rbp)
	movl	%eax, -280(%rbp)
	movq	-336(%rbp), %rax
	cqto
	idivq	-312(%rbp)
	movq	%rax, -224(%rbp)
	leaq	rd(%rip), %rax
	movq	%rax, -192(%rbp)
	leaq	wr(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	cp(%rip), %rax
	movq	%rax, -176(%rbp)
	leaq	.LC7(%rip), %rax
	movq	%rax, -160(%rbp)
	leaq	.LC8(%rip), %rax
	movq	%rax, -152(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	$0, -128(%rbp)
	movq	-352(%rbp), %rax
	movq	%rax, -120(%rbp)
	movl	-340(%rbp), %eax
	movq	%rax, -112(%rbp)
	movq	-312(%rbp), %rax
	movl	%eax, %edx
	leaq	-96(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_barrier_init@PLT
	movl	$0, -292(%rbp)
	jmp	.L46
.L61:
	movq	%rsp, %rax
	movq	%rax, -368(%rbp)
	movl	$0, -288(%rbp)
	movl	$0, -284(%rbp)
	movq	-312(%rbp), %rcx
	leaq	-1(%rcx), %rax
	movq	%rax, -216(%rbp)
	movq	%rcx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	imulq	$448, %r13, %rdx
	imulq	$0, %r12, %rax
	leaq	(%rdx,%rax), %rsi
	movl	$448, %eax
	mulq	%r12
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	movq	%rcx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rcx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	imulq	$448, %r15, %rdx
	imulq	$0, %r14, %rax
	leaq	(%rdx,%rax), %rsi
	movl	$448, %eax
	mulq	%r14
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	movq	%rcx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L47:
	cmpq	%rdx, %rsp
	je	.L48
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L47
.L48:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L49
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L49:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -208(%rbp)
	movq	$0, -272(%rbp)
	jmp	.L50
.L54:
	movq	-208(%rbp), %rcx
	movq	-272(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-328(%rbp), %rax
	movl	%eax, %edx
	movl	-288(%rbp), %eax
	imull	%eax, %edx
	movl	-284(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %ecx
	movq	-208(%rbp), %rsi
	movq	-272(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$8, %rax
	movl	%ecx, (%rax)
	movl	-292(%rbp), %eax
	cltq
	movq	-192(%rbp,%rax,8), %rdx
	movq	-208(%rbp), %rsi
	movq	-272(%rbp), %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$16, %rax
	movq	%rdx, (%rax)
	movq	-208(%rbp), %rcx
	movq	-272(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	24(%rax), %rdx
	movq	-224(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-208(%rbp), %rcx
	movq	-272(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	32(%rax), %rdx
	movl	-340(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-292(%rbp), %eax
	cltq
	movq	-128(%rbp,%rax,8), %rdx
	movq	-208(%rbp), %rsi
	movq	-272(%rbp), %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	addq	$40, %rax
	movq	%rdx, (%rax)
	movq	-312(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -272(%rbp)
	je	.L63
	movq	-272(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-208(%rbp), %rax
	addq	%rax, %rdx
	movq	-272(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-232(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rcx
	leaq	test_param(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	%eax, -276(%rbp)
	movl	-276(%rbp), %eax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	check_code
	movl	-288(%rbp), %eax
	addl	$1, %eax
	cltd
	idivl	-280(%rbp)
	movl	%edx, -288(%rbp)
	cmpl	$0, -288(%rbp)
	jne	.L53
	movl	-284(%rbp), %eax
	addl	$1, %eax
	cltq
	cqto
	idivq	-328(%rbp)
	movq	%rdx, %rax
	movl	%eax, -284(%rbp)
.L53:
	addq	$1, -272(%rbp)
.L50:
	movq	-272(%rbp), %rax
	cmpq	-312(%rbp), %rax
	jl	.L54
	jmp	.L52
.L63:
	nop
.L52:
	movq	-312(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	leaq	-56(%rax), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	test_param
	movq	$0, -264(%rbp)
	jmp	.L55
.L56:
	movq	-232(%rbp), %rax
	movq	-264(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movl	%eax, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	check_code
	addq	$1, -264(%rbp)
.L55:
	movq	-312(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -264(%rbp)
	jl	.L56
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -256(%rbp)
	movq	$0, -248(%rbp)
	jmp	.L57
.L60:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	-224(%rbp), %xmm1
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-208(%rbp), %rcx
	movq	-248(%rbp), %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rax
	salq	$30, %rax
	testq	%rax, %rax
	js	.L58
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L59
.L58:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L59:
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -200(%rbp)
	movl	-292(%rbp), %eax
	cltq
	movq	-160(%rbp,%rax,8), %rdx
	movq	-200(%rbp), %rcx
	movq	-248(%rbp), %rax
	movq	%rcx, %xmm0
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	-256(%rbp), %xmm0
	addsd	-200(%rbp), %xmm0
	movsd	%xmm0, -256(%rbp)
	addq	$1, -248(%rbp)
.L57:
	movq	-248(%rbp), %rax
	cmpq	-312(%rbp), %rax
	jl	.L60
	movl	-292(%rbp), %eax
	cltq
	movq	-160(%rbp,%rax,8), %rax
	movq	-256(%rbp), %rdx
	movq	%rdx, %xmm0
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-256(%rbp), %rax
	movl	16(%rbp), %edi
	movq	%rax, %xmm0
	call	write_to_file
	movq	-368(%rbp), %rsp
	addl	$1, -292(%rbp)
.L46:
	cmpl	$2, -292(%rbp)
	jle	.L61
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_barrier_destroy@PLT
	movq	%rbx, %rsp
	nop
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	je	.L62
	call	__stack_chk_fail@PLT
.L62:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4386:
	.size	test, .-test
	.section	.rodata
.LC16:
	.string	"invalid %s\n"
	.text
	.globl	get_arg
	.type	get_arg, @function
get_arg:
.LFB4387:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol@PLT
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jne	.L65
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L65:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L67
	call	__stack_chk_fail@PLT
.L67:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4387:
	.size	get_arg, .-get_arg
	.section	.rodata
	.align 8
.LC17:
	.string	"not enough arguments, number of threads, number of cpus, number of virtual threads, array size, memory allocation type, to write value and file name, where to put results\n"
.LC18:
	.string	"number of threads"
.LC19:
	.string	"number of cpus"
.LC20:
	.string	"number of virual threads"
.LC21:
	.string	"array size"
.LC22:
	.string	"memory allocation type"
.LC23:
	.string	"to write value"
.LC24:
	.string	"open()"
.LC25:
	.string	"getrlimit()"
.LC26:
	.string	"setrlimit()"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4388:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$7, -84(%rbp)
	jg	.L69
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$171, %edx
	movl	$1, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L75
.L69:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movq	%rax, -72(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movq	%rax, -64(%rbp)
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movq	%rax, -56(%rbp)
	movq	-96(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movq	%rax, -48(%rbp)
	movq	-96(%rbp), %rax
	addq	$40, %rax
	movq	(%rax), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movl	%eax, -80(%rbp)
	movq	-96(%rbp), %rax
	addq	$48, %rax
	movq	(%rax), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_arg
	movq	%rax, -40(%rbp)
	movq	-96(%rbp), %rax
	addq	$56, %rax
	movq	(%rax), %rax
	movl	$448, %edx
	movl	$1090, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -76(%rbp)
	cmpl	$-1, -76(%rbp)
	jne	.L71
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L75
.L71:
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$9, %edi
	call	getrlimit@PLT
	testl	%eax, %eax
	je	.L72
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$2, %eax
	jmp	.L75
.L72:
	movq	-48(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	cmpq	%rax, %rdx
	cmovnb	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	setrlimit@PLT
	testl	%eax, %eax
	jne	.L73
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$9, %edi
	call	setrlimit@PLT
	testl	%eax, %eax
	je	.L74
.L73:
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L75
.L74:
	movq	-40(%rbp), %r9
	movl	-80(%rbp), %r8d
	movq	-48(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rsi
	movq	-72(%rbp), %rax
	subq	$8, %rsp
	movl	-76(%rbp), %edi
	pushq	%rdi
	movq	%rax, %rdi
	call	test
	addq	$16, %rsp
	movl	$0, %eax
.L75:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L76
	call	__stack_chk_fail@PLT
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4388:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC13:
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
