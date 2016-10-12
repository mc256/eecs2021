	.globl	printFraction
	.globl	println 

	.text

printFraction:
	#---------------------------------------------------------
	#printFraction
	#Accept Argument: $a0 - address of the object Fraction
	add	$t1,	$zero,	$a0
	lw	$a0,	0($t1)
	addi	$v0,	$zero,	1	#prepare output int
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'/'
	syscall

	lw	$a0,	4($t1)
	addi	$v0,	$zero,	1	#prepare output int
	syscall	

	jr	$ra



println:	
	#---------------------------------------------------------
	#println
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	0xA
	syscall

	jr	$ra