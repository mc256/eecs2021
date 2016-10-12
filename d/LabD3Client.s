	.text
adding:
	#-----------------------------------
	#Accept Argument: $a1, $a2 for two Fraction address
	#return $v0, new address of Fraction object

	#allocate room for variables
	addi	$v0,	$0,	9	#allocate address service
	addi	$a0,	$0,	8	#allocate 8 bytes for two words
	syscall				#--> Return address in $v0

	lw	$t1,	0($a1)
	lw	$t2,	0($a2)
	mult	$t1,	$t2
	mflo	$t0
	sw	$t0,	0($v0)

	lw	$t1,	4($a1)
	lw	$t2,	4($a2)
	mult	$t1,	$t2
	mflo	$t0
	sw	$t0,	4($v0)

	jr	$ra

main:
	#-----------------------------------
	sw	$ra,	0($sp)
	addi	$sp,	$sp,	-4	#push one to stack
	#-----------------------------------
	#Fraction a = new Fraction(3,8); 
	addi	$a0,	$0,	58
	addi	$a1,	$0,	48
	jal	Fraction			#v0 = new Fraction($a0, $a1)
	add	$s0,	$0,	$v0	#save v0 ---> s0


	#Fraction b = new Fraction(1,2); 
	addi	$a0,	$0,	25
	addi	$a1,	$0,	233
	jal	Fraction			#v0 = new Fraction($a0, $a1)
	add	$s1,	$0,	$v0	#save v0 ---> s0


	#println(s0);
	add	$a0,	$0,	$s0
	jal	printFraction
	jal	println

	#println(s1);
	add	$a0,	$0,	$s1
	jal	printFraction
	jal	println

	#s2 = adding(s1, s2)
	add	$a1,	$0,	$s0
	add	$a2,	$0,	$s1
	jal	adding
	add	$s2,	$0,	$v0

	#println(s2);
	add	$a0,	$0,	$s2
	jal	printFraction
	jal	println


	#-----------------------------------
	addi	$sp,	$sp,	4	#pop one from stack
	lw	$ra,	0($sp)
	#-----------------------------------
	jr	$ra