	.file	"vectorized_to_scalar.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s: %s\n"
	.text
	.globl	check_code
	.type	check_code, @function
check_code:
.LFB5736:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	testl	%edi, %edi
	jne	.L4
.L2:
	movl	%ebx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movq	%rsi, %rbp
	call	strerror@PLT
	movq	%rax, %r8
	movq	%rbp, %rcx
	leaq	.LC0(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	jmp	.L2
	.cfi_endproc
.LFE5736:
	.size	check_code, .-check_code
	.section	.rodata.str1.1
.LC2:
	.string	"posix_memalign()"
.LC3:
	.string	"%f\n"
	.text
	.globl	rd
	.type	rd, @function
rd:
.LFB5739:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$64, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %r14
	movq	%rsi, %r13
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-64(%rbp), %rdi
	movl	$128, %edx
	movl	$32, %esi
	call	posix_memalign@PLT
	movl	%eax, %edi
	leaq	.LC2(%rip), %rsi
	call	check_code
	movl	%eax, %edx
	movq	$-1, %rax
	testl	%edx, %edx
	jne	.L5
	rdtscp
	movl	%ecx, -68(%rbp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -88(%rbp)
	testq	%r13, %r13
	jle	.L7
	movl	$0, %ebx
	movq	.LC1(%rip), %xmm2
	leaq	.LC3(%rip), %r15
	movq	%r15, %rsi
.L8:
	movq	%rbx, %rax
	salq	$5, %rax
	vaddsd	16(%r14,%rax), %xmm2, %xmm2
	vaddsd	48(%r14,%rax), %xmm2, %xmm2
	vaddsd	80(%r14,%rax), %xmm2, %xmm2
	vaddsd	112(%r14,%rax), %xmm2, %xmm2
	vaddsd	144(%r14,%rax), %xmm2, %xmm2
	vaddsd	176(%r14,%rax), %xmm2, %xmm2
	vaddsd	208(%r14,%rax), %xmm2, %xmm2
	vaddsd	240(%r14,%rax), %xmm2, %xmm2
	addq	$8, %rbx
	cmpq	%rbx, %r13 
	jg	.L8
.L7:
	rdtscp
	movl	%ecx, -68(%rbp)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	-88(%rbp), %rax
.L5:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L13
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L13:
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	%rsi, %r13
	movq	%rdx, %r14
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rdi
	movl	$128, %edx
	movl	$32, %esi
	call	posix_memalign@PLT
	movl	%eax, %edi
	testl	%eax, %eax
	movl	$0, %r12d
	cmove	16(%rsp), %r12
	leaq	.LC2(%rip), %rsi
	call	check_code
	movl	%eax, %edx
	movq	$-1, %rax
	testl	%edx, %edx
	jne	.L14
	movsbl	%r14b, %r14d
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r12)
	vmovsd	%xmm0, 16(%r12)
	vmovsd	%xmm0, 8(%r12)
	vmovsd	%xmm0, (%r12)
	rdtscp
	movl	%ecx, 12(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %rdi
	testq	%r13, %r13
	jle	.L17
	vmovntdqa	(%r12), %ymm0
	movq	%rbx, %rcx
	salq	$5, %r13
	leaq	(%rbx,%r13), %rsi
.L18:
	vmovntdq	%ymm0, (%rcx)
	vmovntdq	%ymm0, 32(%rcx)
	vmovntdq	%ymm0, 64(%rcx)
	vmovntdq	%ymm0, 96(%rcx)
	vmovntdq	%ymm0, 128(%rcx)
	vmovntdq	%ymm0, 160(%rcx)
	vmovntdq	%ymm0, 192(%rcx)
	vmovntdq	%ymm0, 224(%rcx)
	addq	$256, %rcx
	cmpq	%rsi, %rcx
	jl	.L18
.L17:
	rdtscp
	movl	%ecx, 12(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%rdi, %rax
.L14:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L23
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L23:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5740:
	.size	wr, .-wr
	.section	.rodata.str1.1
.LC4:
	.string	"%.4f;"
.LC5:
	.string	"write()"
.LC6:
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
	leaq	.LC4(%rip), %rcx
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
	jbe	.L24
	testl	%eax, %eax
	js	.L29
	movq	stderr(%rip), %rcx
	movl	$20, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdi
	call	fwrite@PLT
.L24:
	movq	264(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L30
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
.L29:
	.cfi_restore_state
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	jmp	.L24
.L30:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5737:
	.size	write_to_file, .-write_to_file
	.section	.rodata.str1.1
.LC7:
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
	movq	%rdi, %rdx
	salq	$5, %rdx
	movq	%rsp, %rdi
	movl	$32, %esi
	call	posix_memalign@PLT
	movl	%eax, %edi
	testl	%eax, %eax
	movl	$0, %ebx
	cmove	(%rsp), %rbx
	leaq	.LC7(%rip), %rsi
	call	check_code
	testl	%eax, %eax
	movl	$0, %eax
	cmovne	%rax, %rbx
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	movq	%rbx, %rax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L36:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5738:
	.size	get_array, .-get_array
	.globl	cp
	.type	cp, @function
cp:
.LFB5741:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	%edx, %esi
	movq	%rbx, %rdi
	call	get_array
	movq	%rax, %rdi
	rdtscp
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, %r8
	testq	%rbx, %rbx
	jle	.L38
	salq	$5, %rbx
	movq	%rbx, %rsi
	movl	$0, %ecx
.L39:
	vmovntdqa	(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, (%rdi,%rcx)
	vmovntdqa	32(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 32(%rdi,%rcx)
	vmovntdqa	64(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 64(%rdi,%rcx)
	vmovntdqa	96(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 96(%rdi,%rcx)
	vmovntdqa	128(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 128(%rdi,%rcx)
	vmovntdqa	160(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 160(%rdi,%rcx)
	vmovntdqa	192(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 192(%rdi,%rcx)
	vmovntdqa	224(%r12,%rcx), %ymm0
	vmovntdq	%ymm0, 224(%rdi,%rcx)
	addq	$256, %rcx
	cmpq	%rsi, %rcx
	jl	.L39
.L38:
	rdtscp
	movl	%ecx, 20(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%r8, %rax
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L43
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L43:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5741:
	.size	cp, .-cp
	.section	.rodata.str1.1
.LC8:
	.string	"sched_setaffinity"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
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
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 112(%rsp)
	movq	$0, 120(%rsp)
	movl	8(%rdi), %edx
	movslq	%edx, %rax
	cmpq	$1023, %rax
	ja	.L45
	shrq	$6, %rax
	movl	$1, %ecx
	shlx	%rdx, %rcx, %rdx
	orq	%rdx, (%rsp,%rax,8)
.L45:
	movq	%rsp, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	movl	%eax, %edi
	leaq	.LC8(%rip), %rsi
	call	check_code
	movl	$5, %eax
	shrx	%rax, 24(%rbx), %r12
	movl	32(%rbx), %esi
	movq	%r12, %rdi
	call	get_array
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L49
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
.L44:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L50
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
.L49:
	.cfi_restore_state
	call	getpid@PLT
	movl	%eax, %ecx
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	$-1, 48(%rbx)
	movl	$0, %eax
	jmp	.L44
.L50:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5742:
	.size	test_param, .-test_param
	.section	.rodata.str1.1
.LC11:
	.string	"read"
.LC12:
	.string	"write"
.LC13:
	.string	"copy"
.LC14:
	.string	"pthread_create"
.LC15:
	.string	"pthread_join"
.LC17:
	.string	"%ld: %s %.5f GBps\n"
.LC18:
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
	movq	%rdi, -200(%rbp)
	movq	%rsi, %rax
	movq	%rdx, -280(%rbp)
	movl	%r8d, -228(%rbp)
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
.L52:
	cmpq	%rsi, %rsp
	je	.L53
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L52
.L53:
	movq	%rdi, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	je	.L54
	orq	$0, -8(%rsp,%rdx)
.L54:
	movq	%rsp, %r15
	cqto
	idivq	-280(%rbp)
	movq	%rax, -272(%rbp)
	movq	%rcx, %rax
	movq	-200(%rbp), %rbx
	cqto
	idivq	%rbx
	movq	%rax, -224(%rbp)
	leaq	rd(%rip), %rax
	movq	%rax, -192(%rbp)
	leaq	wr(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	cp(%rip), %rax
	movq	%rax, -176(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -160(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -152(%rbp)
	leaq	.LC13(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	$0, -128(%rbp)
	movq	%r9, -120(%rbp)
	movl	-228(%rbp), %eax
	movq	%rax, -112(%rbp)
	leaq	-96(%rbp), %rdi
	movl	%ebx, %edx
	movl	$0, %esi
	call	pthread_barrier_init@PLT
	imulq	$56, %rbx, %rax
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
	jmp	.L69
.L56:
	movq	-344(%rbp), %rdx
	movq	%rdx, %rax
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L57
	movq	%rdx, %rax
	andl	$4095, %eax
	orq	$0, -8(%rsp,%rax)
.L57:
	movl	$3, %eax
	shrx	%rax, %rsp, %rax
	movq	%rsp, %r13
	movq	%r13, -304(%rbp)
	cmpq	$0, -200(%rbp)
	jle	.L58
	leaq	-96(%rbp), %rdx
	movq	%rdx, 0(,%rax,8)
	movl	-280(%rbp), %edx
	movl	%edx, -240(%rbp)
	movl	$0, 8(,%rax,8)
	movq	-288(%rbp), %rdx
	movq	-192(%rbp,%rdx), %rsi
	movq	%rsi, -248(%rbp)
	movq	%rsi, 16(,%rax,8)
	movq	-224(%rbp), %rsi
	movq	%rsi, 24(,%rax,8)
	movl	-228(%rbp), %esi
	movl	%esi, 32(,%rax,8)
	movq	-128(%rbp,%rdx), %rdx
	movq	%rdx, -256(%rbp)
	movq	%rdx, 40(,%rax,8)
	cmpq	$0, -216(%rbp)
	je	.L59
	movq	%r15, %r14
	movl	$0, %r12d
	movl	$0, -208(%rbp)
	movl	$0, %edx
	leaq	-96(%rbp), %rax
	movq	%rax, -264(%rbp)
	movq	%r15, -320(%rbp)
	movl	%edx, %r15d
	jmp	.L60
.L62:
	incq	%r12
	cmpq	%r12, -200(%rbp)
	je	.L80
	movq	-264(%rbp), %rax
	movq	%rax, 56(%rbx)
	imull	-240(%rbp), %ecx
	addl	-208(%rbp), %ecx
	movl	%ecx, 64(%rbx)
	movq	-248(%rbp), %rax
	movq	%rax, 72(%rbx)
	movq	-224(%rbp), %rax
	movq	%rax, 80(%rbx)
	movl	-228(%rbp), %eax
	movl	%eax, 88(%rbx)
	movq	-256(%rbp), %rax
	movq	%rax, 96(%rbx)
	addq	$8, %r14
	addq	$56, %r13
	cmpq	%r12, -216(%rbp)
	je	.L78
.L60:
	movq	%r13, %rbx
	movq	%r13, %rcx
	leaq	test_param(%rip), %rdx
	movl	$0, %esi
	movq	%r14, %rdi
	call	pthread_create@PLT
	movl	%eax, %edi
	leaq	.LC14(%rip), %rsi
	call	check_code
	leal	1(%r15), %eax
	cltd
	idivl	-272(%rbp)
	movl	%edx, %ecx
	movl	%edx, %r15d
	testl	%edx, %edx
	jne	.L62
	movl	-208(%rbp), %eax
	incl	%eax
	cltq
	cqto
	idivq	-280(%rbp)
	movl	%edx, -208(%rbp)
	jmp	.L62
.L80:
	movq	-320(%rbp), %r15
.L61:
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	cmpq	$0, -216(%rbp)
	jle	.L70
.L71:
	movl	$0, %ebx
	leaq	.LC15(%rip), %r12
	movq	-216(%rbp), %r13
.L64:
	movq	(%r15,%rbx,8), %rdi
	movl	$0, %esi
	call	pthread_join@PLT
	movl	%eax, %edi
	movq	%r12, %rsi
	call	check_code
	incq	%rbx
	cmpq	%rbx, %r13
	jg	.L64
	cmpq	$0, -200(%rbp)
	jle	.L73
.L70:
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	-224(%rbp), %xmm7, %xmm0
	vmulsd	.LC16(%rip), %xmm0, %xmm7
	vmovsd	%xmm7, -240(%rbp)
	movq	-304(%rbp), %r13
	addq	$48, %r13
	movl	$0, %r12d
	movq	.LC10(%rip), %rbx
	leaq	.LC17(%rip), %r14
	movq	%r15, -248(%rbp)
	movq	-296(%rbp), %r15
	jmp	.L68
.L66:
	shrq	%rax
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
.L67:
	vmovsd	-240(%rbp), %xmm2
	vdivsd	%xmm0, %xmm2, %xmm1
	vmovsd	%xmm1, -208(%rbp)
	vmovsd	%xmm1, %xmm1, %xmm0
	movq	(%r15), %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	16(%rbp), %edi
	vmovq	%rbx, %xmm0
	call	write_to_file
	vmovq	%rbx, %xmm4
	vaddsd	-208(%rbp), %xmm4, %xmm3
	vmovq	%xmm3, %rbx
	incq	%r12
	addq	$56, %r13
	cmpq	%r12, -200(%rbp)
	jle	.L81
.L68:
	movq	0(%r13), %rax
	salq	$30, %rax
	js	.L66
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	jmp	.L67
.L81:
	movq	-248(%rbp), %r15
.L65:
	vmovq	%rbx, %xmm0
	movq	-296(%rbp), %r14
	movq	(%r14), %rdx
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	16(%rbp), %edi
	vmovq	%rbx, %xmm0
	call	write_to_file
	movq	-312(%rbp), %rsp
	addq	$8, %r14
	movq	%r14, -296(%rbp)
	addq	$8, -288(%rbp)
	movq	-288(%rbp), %rax
	cmpq	$24, %rax
	je	.L82
.L69:
	movq	%rsp, -312(%rbp)
	movq	%rsp, %rax
	subq	-328(%rbp), %rax
.L55:
	cmpq	%rax, %rsp
	je	.L56
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L55
.L73:
	movq	.LC10(%rip), %rbx
	jmp	.L65
.L82:
	leaq	-96(%rbp), %rdi
	call	pthread_barrier_destroy@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L83
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
.L59:
	.cfi_restore_state
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	jmp	.L70
.L78:
	movq	-320(%rbp), %r15
	jmp	.L61
.L58:
	movq	-304(%rbp), %rdi
	addq	-336(%rbp), %rdi
	call	test_param
	movq	.LC10(%rip), %rbx
	cmpq	$0, -216(%rbp)
	jg	.L71
	jmp	.L65
.L83:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5743:
	.size	test, .-test
	.section	.rodata.str1.1
.LC19:
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
	je	.L88
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L89
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L88:
	.cfi_restore_state
	movq	%rbp, %rcx
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$-1, %edi
	call	exit@PLT
.L89:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5744:
	.size	get_arg, .-get_arg
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"not enough arguments, number of threads, number of cpus, number of virtual threads, array size, memory allocation type, to write value and file name, where to put results\n"
	.section	.rodata.str1.1
.LC21:
	.string	"number of threads"
.LC22:
	.string	"number of cpus"
.LC23:
	.string	"number of virual threads"
.LC24:
	.string	"array size"
.LC25:
	.string	"memory allocation type"
.LC26:
	.string	"to write value"
.LC27:
	.string	"open()"
.LC28:
	.string	"getrlimit()"
.LC29:
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
	jle	.L99
	movq	%rsi, %rbx
	movq	8(%rsi), %rdi
	leaq	.LC21(%rip), %rsi
	call	get_arg
	movq	%rax, (%rsp)
	movq	16(%rbx), %rdi
	leaq	.LC22(%rip), %rsi
	call	get_arg
	movq	%rax, 8(%rsp)
	movq	24(%rbx), %rdi
	leaq	.LC23(%rip), %rsi
	call	get_arg
	movq	%rax, %r13
	movq	32(%rbx), %rdi
	leaq	.LC24(%rip), %rsi
	call	get_arg
	movq	%rax, %r12
	movq	40(%rbx), %rdi
	leaq	.LC25(%rip), %rsi
	call	get_arg
	movq	%rax, %r14
	movq	48(%rbx), %rdi
	leaq	.LC26(%rip), %rsi
	call	get_arg
	movq	%rax, %r15
	movq	56(%rbx), %rdi
	movl	$448, %edx
	movl	$1090, %esi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, %ebp
	cmpl	$-1, %eax
	je	.L100
	leaq	16(%rsp), %rsi
	movl	$9, %edi
	call	getrlimit@PLT
	testl	%eax, %eax
	jne	.L101
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
	jne	.L95
	leaq	16(%rsp), %rsi
	movl	$9, %edi
	call	setrlimit@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L96
.L95:
	leaq	.LC29(%rip), %rdi
	call	perror@PLT
	movl	$1, %ebx
	jmp	.L90
.L99:
	movq	stderr(%rip), %rcx
	movl	$171, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %ebx
.L90:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L102
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
.L100:
	.cfi_restore_state
	leaq	.LC27(%rip), %rdi
	call	perror@PLT
	movl	$1, %ebx
	jmp	.L90
.L101:
	leaq	.LC28(%rip), %rdi
	call	perror@PLT
	movl	$2, %ebx
	jmp	.L90
.L96:
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
	jmp	.L90
.L102:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5745:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1073217536
	.align 8
.LC10:
	.long	0
	.long	0
	.align 8
.LC16:
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
