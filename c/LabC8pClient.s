	#load and store 
	#	words (lw and sw), 
	#	half words (lh and sh), 
	#	and bytes (lb and sb).
	#
	#0x10010004 address counted by byte(8 bits)
	
	.text
main:


	#read Next Int
	addi	$v0,	$zero,	5
	syscall	
	add	$a0,	$zero,	$v0


	#printVertical
	
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	jal	printVertical
	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------


	jr	$ra
