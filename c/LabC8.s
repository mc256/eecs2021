	.globl	MAX
	.globl	SIZE
	.globl	newline
	.globl	getCount
	.globl	setCount
	.globl	println
	.globl	signum
	.globl	isPrime
	.globl	printVertical
	#----------------------------
#	word	32	lw	sw
#	half	16	lh	sh
#	byte	8	lb	sb
	.data
MAX:	.word	2147483647;	#Public	(32 bits)
SIZE:	.byte	-32;		#Public	11111111 (8 bits) [-128,127]
count:	.word	233		#Private

temp1:	.half	-1;		#Private	(16 bits) grid of 32 bits
temp2:	.float	1.0;		#Private	(32 bits) grid of 32 bits
temp3:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp4:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp5:	.double	1.0;		#Private	(64 bits) grid of 64 bits

temp01:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp02:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp03:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp04:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp05:	.word	-1;		#Private	(32 bits) grid of 32 bits
temp06:	.word	-1;		#Private	(32 bits) grid of 32 bits

newline:	.asciiz	"\n";
BEGIN:	.word	0;		#Private	(32 bits) grid of 32 bits
	#----------------------------
	.text
	#----------------------------
getCount:
	lw	$v0,	count($zero)
	jr	$ra
setCount:
	sw	$v0,	count($zero)
	jr	$ra
println:
	addi	$v0,	$zero,	4
	la	$a0,	newline
	syscall
	jr	$ra
signum:
	lw	$v1,	count($zero)
	addi	$v1,	$v1,	1
	sw	$v1,	count($zero)
	blt	$v0,	0,	mission1
	beq	$v0,	0,	mission2
	addi	$v0,	$zero,	1
	jr	$ra
mission1:	addi	$v0,	$zero,	-1
	jr	$ra
mission2:	addi	$v0,	$zero,	0
	jr	$ra





isFactor:
	div	$a1,	$a0
	mfhi	$a3
	#if a3 == 0 then is Factor
	beq	$a3,	$zero,	isF
	jr	$ra
isF:	add	$v0,	$zero,	$zero
	jr	$ra




isPrime:	#INPUT 	store at $a1
	addi	$v0,	$zero,	1	
	addi	$a0,	$zero,	2	#counter
loop:	
	bge	$a0,	$a1,	finish
	beq	$v0,	$zero,	finish
		
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	jal	isFactor
	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------

	addi	$a0,	$a0,	1	# counter ++

	j	loop
finish:

	jr	$ra



printVertical:
	ble	$a0,	$0,	finDeep	#if n <= 0 return
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	addi	$v0	$zero,	10
	div	$a0,	$v0
	mflo	$a0
	mfhi	$a1
	sw	$a1,	BEGIN($sp)
	jal	printVertical
	lw	$a0,	BEGIN($sp)
	addi	$v0,	$zero,	1
	syscall

	jal	println
	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------
finDeep:	jr	$ra