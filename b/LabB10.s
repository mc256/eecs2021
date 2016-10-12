	.globl	fini
	.text
main:	
	add	$t0,	$zero,	102400
	add	$t1,	$zero,	10240
	div	$t0,	$t1		#div
	mflo	$t2			#quotient
	mfhi	$t3			#remainder

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t0	#set output
	syscall				#output
	
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'/'
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t1	#set output
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'='
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t2	#set output
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'('
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t3	#set output
	syscall				#output


	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'\n'
	syscall


	mult	$t0,	$t1		#div
	mflo	$t2			#quotient
	mfhi	$t3			#remainder



	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t0	#set output
	syscall				#output
	
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'*'
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t1	#set output
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'='
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t2	#set output
	syscall				#output

	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	' '
	syscall

	addi	$v0,	$zero,	1	#prepare output int
	add	$a0,	$zero,	$t3	#set output
	syscall				#output


	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'\n'
	syscall

fini:
	jr	$ra
