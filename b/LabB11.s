	.globl	fini
	.text
main:	
	add	$t0,	$zero,	-4
	
	addi	$v0,	$zero,	1	#prepare output int
	srl	$a0,	$t0,	1	# >>>
	syscall				#output
	
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	' '
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	sll	$a0,	$t0,	1	# <<
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	' '
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	sra	$a0,	$t0,	1	# >>
	syscall				#output



	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'\n'
	syscall

fini:
	jr	$ra
