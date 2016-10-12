	.globl	isFactor
	.globl	isPrime
	.globl	println
	
	.data
#---------------------------------------------
newline:	.asciiz	"\n";

	.text
println:
#	addi	$v0,	$zero,	4
#	la	$a0,	newline
#	syscall
#	jr	$ra

	addi	$v0,	$zero,	11
	addi	$a0,	$0,	0xA
	syscall
	jr	$ra

#---------------------------------------------
isPrime:
	addi	$v0,	$zero,	1
	addi	$a1,	$zero,	2
loop:	
	bne	$v0,	1,	finish
	bge	$a1,	$a0,	finish


	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	jal	isFactor
	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------

	addi	$a1,	$a1,	1
	j	loop
finish:
	jr	$ra


#---------------------------------------------
isFactor:
	#if a0 mod a1 == 0 then v0 = 0
	div	$a0,	$a1
	mfhi	$v1
	bne	$v1,	$zero,	notFactor
	add	$v0,	$zero,	$zero
notFactor:
	jr	$ra
	
