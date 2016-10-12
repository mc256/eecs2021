	.text
main:
	addi $t0,	$0,		30
	addi $t1,	$0,		10
	and	 $t2,	$t1,	$t0
	or	 $t3,	$t1,	$t1
	add	 $t4,	$t1,	$t1
	sub	 $t5,	$t4,	$t0
	slt	 $t6,   $t3,	$t2
	slt	 $t7,	$t3,	$t4
