	#load and store 
	#	words (lw and sw), 
	#	half words (lh and sh), 
	#	and bytes (lb and sb).
	#
	#0x10010004 address counted by byte(8 bits)
	
	.text
main:
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------


	#Print
	jal	getCount
	add	$a0,	$zero,	$v0	#a0 = getCount()
	addi	$v0,	$0,	1	#service	
	syscall

	jal	println


	#read Next Int
	addi	$v0,	$0,	5
	syscall	

	#signum
	jal	signum
	add	$a0,	$zero,	$v0	#a0 = signum()
	addi	$v0,	$0,	1	#service	
	syscall

	jal	println
	
	#Print
	jal	getCount
	add	$a0,	$zero,	$v0	#a0 = getCount()
	addi	$v0,	$0,	1	#service	
	syscall

	jal	println



	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------



	jr	$ra