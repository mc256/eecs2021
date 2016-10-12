	#load and store 
	#	words (lw and sw), 
	#	half words (lh and sh), 
	#	and bytes (lb and sb).
	
	.text
main:
	lw	$a0,	MAX($zero)
	addi	$v0,	$zero,	1
	syscall

	addi	$v0,	$zero,	4
	la	$a0,	newline
	syscall

	lbu	$a0,	SIZE($zero)
	addi	$v0,	$zero,	1
	syscall

	jr	$ra