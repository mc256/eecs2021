	#二进制乘法
	#18{10} = 10010{2}
	.globl	fini
	.data
stri:	.asciiz	" * 18 = "
	.text
main:	
	#input
	addi	$v0,	$zero,	5
	syscall
	add	$t0,	$zero,	$v0
	
	sll	$t1,	$t0,	4
	sll	$t2,	$t0,	1

	addi	$v0,	$zero,	4
	la	$a0,	stri	#OUTPUT STRING
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$t1,	$t2
	syscall				#output

fini:
	jr	$ra
