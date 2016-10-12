# Program: Quiz 1		Programmer: Jun Lin CHEN
# Due Date: June 1, 2016	Course: EECS
# Functional Description: DoSomething
#####################################################################
# Register Usage:
#	$t0 is used to store the result of comparison
#	$t1 the loop counter, counts down to zero
#
#	all other variables from $t2 - t7
#	$t2	input number
#	$t3	output number, reversed
#	$t5	the limit of the loop
#	$t6	temp
#####################################################################
# Algorithmic Description in Pseudocode:
# main:
#	result = 0;
#	for (i = 0, i < 8, i ++){
#		result = result << 4;
#		temp = input & 15;
#		result = result + temp;
#		input = input >>> 4;
#	}
#
# output:
#	print
#
# finish:
#	return to main
#####################################################################


	.globl	main
	.globl	loop
	.globl	output
	.globl	finish


	.text
main:
	#---------------------------------------------------------
	#readln Integer
	addi	$v0,	$zero,	5	#v0 = 5 readln Integer
	syscall
	add	$t2,	$zero,	$v0	#copy $v0 to $t2


	#---------------------------------------------------------
	#Initial variables
	add	$t3,	$zero,	$zero	#result = 0
	add	$t1	$zero,	$zero	#i = 0
	
	
loop:
	#---------------------------------------------------------
	#LOOP BEGIN===============================================
	#if !(t1 < 8) then break;
	slti	$t0,	$t1,	8	#t0 = (t1 < 8)? 1 : 0
	beq	$t0,	$zero,	output

	
	sll	$t3,	$t3,	4	#result = result << 4
	add	$t6,	$zero,	$zero	#initial temp
	andi	$t6,	$t2,	15	#temp = input & 15
	add	$t3,	$t3,	$t6	#result = result + temp
	srl	$t2,	$t2,	4	#input = input >>> 4

	

	addi	$t1,	$t1,	1	#i = i + 1
	j	loop			#goto <loop>
	#LOOP END=================================================
	#---------------------------------------------------------


output:
	#---------------------------------------------------------
	#print Integer
	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$t3
	syscall


finish:
	#---------------------------------------------------------
	#Finished. Return to $ra
	jr	$ra			#goto <$ra>










	
