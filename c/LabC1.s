	.globl	MAX
	.globl	SIZE
	.globl	newline
	#----------------------------
	.data
MAX:	.word	2147483647;	#Public	(32 bits)
SIZE:	.byte	32;		#Public	11111111 (8 bits) [-128,127]
count:	.word	0		#Private

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

test11:		.asciiz "something";
test12:		.asciiz "here00";
aa:		.half 0xaaff;
bb:		.half 0xccdd;
kk:		.word 0xaaffccdd;
	#----------------------------

	.text
main:
	lbu $t1, aa($0)
	addi	$a0, $0, 1
	lbu	$t2, aa($a0)
	jr	$ra


