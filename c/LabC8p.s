	.globl	printVertical
	.globl	println
	
	.data
newline:	.asciiz	"\n";

	.text
println:
	addi	$v0,	$zero,	4
	la	$a0,	newline
	syscall
	jr	$ra

printVertical:
		
	ble	$a0,	$zero,	fini	

	#-----------------------------------
	sw	$ra,	0($sp)
	sw	$a0	-4($sp)
	addi	$sp,	$sp,	-8	#push one to stack
	#-----------------------------------
	
	addi	$a1,	$zero,	10
	div	$a0,	$a1
	mflo	$a0
	
	jal	printVertical		#jump to next step
		

	#-----------------------------------
	addi	$sp,	$sp,	8	#pop one from stack
	lw	$a0,	-4($sp)
	lw	$ra,	0($sp)
	#-----------------------------------

	
	addi	$a1,	$zero,	10
	div	$a0,	$a1
	addi	$v0,	$zero,	1
	mfhi	$a0
	syscall
	


	#-----------------------------------
	sw	$ra,	0($sp)
	sw	$a0	-4($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	jal	println
	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$a0,	-4($sp)
	lw	$ra,	0($sp)
	#-----------------------------------


fini:
	jr	$ra			#return
