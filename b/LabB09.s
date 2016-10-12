	.globl	fini
	.globl	done
	.text
main:	
	add	$t5,	$zero,	$zero
	add	$s0,	$zero,	$zero

	addi	$v0,	$zero,	5	#read int
	syscall	
	add	$t0,	$zero,	$v0	#save int


loop:	slt	$t9,	$t5,	$t0	#if less than
	beq	$t9,	$zero,	done	#then break;
	
	add	$s0,	$s0,	$t5	#s0 = s0 + t5
	add	$t5,	$t5,	1	#t5 ++
	j	loop			#repeat the loop

done:	
	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$s0	#set output
	syscall				#output

fini:
	jr	$ra
