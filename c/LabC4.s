	.globl	MAX
	.globl	SIZE
	.globl	newline
	.globl	getCount
	.globl	setCount
	.globl	println
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