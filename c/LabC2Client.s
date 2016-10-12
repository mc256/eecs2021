	#load and store 
	#	words (lw and sw), 
	#	half words (lh and sh), 
	#	and bytes (lb and sb).
	#
	#0x10010004 address counted by byte(8 bits)
	
	.text
main:
	lw	$a0,	0x10010000($zero)
	addi	$v0,	$zero,	1
	syscall

	addi	$v0,	$zero,	4
	la	$a0,	newline
	syscall

	lbu	$a0,	0x10010004($zero)
	addi	$v0,	$zero,	1
	syscall

	addi	$v0,	$zero,	4
	la	$a0,	newline
	syscall

	li	$t2,	4
	lbu	$a0,	0x10010000($t2)
	addi	$v0,	$zero,	1
	syscall

	jr	$ra