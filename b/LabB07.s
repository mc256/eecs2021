	.globl	fini
	.globl	mission1
	.globl	mission2
	.text
main:
	#REPLACE	add	$t0,	$zero,	60
	#-------Read Int from user
	addi	$v0,	$zero,	5
	syscall
	add	$t0,	$zero,	$v0
	#-------------------------	

	add	$t1,	$zero,	7


	slt	$t3,	$t0,	$t1	#t3 = () ? 1 : 0
	#use slti for immediate

	#if t3 == 1 -------------
	beq	$t0,	1,	mission1	#if statement branch equal
	#can use immediate as one of the compare params
	#bne	$t0,	$t1,	mission2	#if statement branch not equal

	j	mission2

mission1:
	add	$t2,	$t0,	$t1	#t2 = t0 + t1
	j	fini

mission2:
	sub	$t2,	$t0,	$t1	#t2 = t0 - t1
	j	fini

fini:
	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$t2
	syscall
	jr	$ra
