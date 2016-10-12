	.text
main:
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------


	#read Next Int
	addi	$v0,	$0,	5
	syscall	

	#isPrime
	add	$a0,	$zero,	$v0
	jal	isPrime
	add	$a0,	$zero,	$v0	#a0 = isPrime()
	addi	$v0,	$0,	1	#service	
	syscall

	jal	println


	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------



	jr	$ra
