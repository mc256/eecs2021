	.text
main:
	add	$t0,	$zero,	90
	add	$t1,	$zero,	7
	add	$t2,	$t0,	$t1

	addi	$v0,	$zero,	1	#set v to output integer
	add	$a0,	$zero,	$t2	#output $t2 via $a0
	syscall

	jr	$ra
