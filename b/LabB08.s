	.globl	fini
	.text
main:
	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$zero

loop:	slti	$t9,	$a0,	5	#if less than
	beq	$t9,	$zero,	fini	#then break;
	syscall				#else output
	add	$a0,	$a0,	1
	j	loop			#repeat the loop

fini:
	jr	$ra
