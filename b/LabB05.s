	.globl	fini
	.text
main:
	#REPLACE	add	$t0,	$zero,	60
	#-------Read Int from user
	addi	$v0,	$zero,	5
	syscall
	add	$t0,	$zero,	$v0
	#-------------------------	

	add	$t1,	$zero,	7
	add	$t2,	$t0,	$t1	#t2 = t0 + t1

	sub	$t3,	$t0,	$t1	#t3 = t0 - t1

	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$t2
	syscall
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	' '
	syscall
	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$t3
	syscall

fini:
	jr	$ra
