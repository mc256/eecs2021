	.data
STR:	.asciiz	"a1b2c3d4e5f6g7h8i9"
MAX:	.word	0x44556677;
SIZE1:	.byte	0x56;
SIZE2:	.byte	0x34;
SIZE3:	.byte	0x12;
count1:	.word	0;
count2:	.word	1;
count3:	.word	2;
	.text
main:
	la	$t0,	STR
	lw	$t1,	24($t0)
	lh	$t2,	24($t0)

	lw	$s0,	20($t0)
	sw	$s0,	0($sp)
	lb	$t4,	0($sp)
	lb	$t5,	1($sp)
	lb	$t6,	2($sp)
	lb	$t7,	3($sp)
	jr	$ra
