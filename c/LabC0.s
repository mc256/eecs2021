
	.text
main:
	lui	$t1,	0xffff
	lui	$t2,	0xffff
	add	$t3,	$t1,	$t2



	#read Next Int
	addi	$v0,	$0,	5
	syscall	
	add	$t0,	$zero,	$v0
	sub	$t0,	$zero,	$t0

	jr	$ra
