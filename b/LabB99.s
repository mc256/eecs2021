# Program: Quiz 1		Programmer: Jun Lin CHEN
# Due Date: June 1, 2016	Course: EECS
# Functional Description: DoSomething
#####################################################################
# Register Usage:
#	$t0 is used to store the result of comparison
#	$t1 the loop counter, counts down to zero
#	all other variables from $t2 - t7
#####################################################################
# Algorithmic Description in Pseudocode:
# main:
#
#
#
#
#
#####################################################################

	.data
prompt:	.asciiz	"Test Information \n"
result:	.asciiz	"-->"

	.globl	main
	.globl	fini

	.globl	missionA1
	.globl	missionA2
	.globl	continueA

	.globl	missionB1
	.globl	missionB2
	.globl	continueB

	.globl	loop
	.globl	continueC

	.text
main:
	#---------------------------------------------------------
	#print String
	li	$v0,	4		#v0 = 4 print String
	la	$a0,	prompt
	syscall


	#---------------------------------------------------------
	#print Integer
	addi	$v0,	$zero,	1
	addi	$a0,	$zero,	23333
	syscall

	#---------------------------------------------------------
	#print Char
	addi	$v0,	$zero,	11
	addi	$a0,	$zero,	'>'
	syscall

	#---------------------------------------------------------
	#readln Integer
	addi	$v0,	$zero,	5	#v0 = 5 readln Integer
	syscall
	add	$t2,	$zero,	$v0	#copy $v0 to $t2

	#---------------------------------------------------------
	#compare and save result to $t0
	slt	$t0,	$t2,	$t3	#t0 = (t2 < t3) ? 1 : 0
	slti	$t0,	$t2,	-100	#t0 = (t2 < 100) ? 1 : 0	immediate
	sltu	$t0,	$t2,	$t3	#t0 = (t2 < t3) ? 1 : 0	unsigned
	sltiu	$t0,	$t2,	-100	#t0 = (t2 < 100) ? 1 : 0	immediate unsigned
	#WARNING: for "unsigned" , the second and thrid param were all considerd as unsigned

	#---------------------------------------------------------
	#Dividing and Multipiling (Cannot use immediate)
	#Dividing
	addi	$t5,	$zero,	5
	div	$t2,	$t5
	mflo	$t3
	mfhi	$t4

	#Multipiling
	mult	$t2,	$t5
	mflo	$t3
	mfhi	$t4

	#---------------------------------------------------------
	#if statement
	
	#if t0 == t2 then goto missionA1, else missionA2
	beq	$t0,	$t2,	missionA1
	j	missionA2
missionA1:
	#do something
	j	continueA
missionA2:
	#do something else
	j	continueA
continueA:
	#back to main stream


	#if t0 != t2 then goto missionB1, else missionB2
	bne	$t0,	$t2,	missionB1
	j	missionB2
missionB1:
	#do something
	j	continueB
missionB2:
	#do something else
	j	continueB
continueB:
	#back to main stream


	#---------------------------------------------------------
	#for loop

	#initial
	add	$t1,	$zero,	$zero
loop:
	#while (true) do {

	#if !(t1 < 5) then break;
	slti	$t0,	$t1,	5
	beq	$t0,	$zero,	continueC

	#do something
	addi	$t1,	$t1,	1	#t1 = t1 + 1

	j	loop			#goto loop
	#}
continueC:



	#---------------------------------------------------------
	#shift and logic
	sll	$t3,	$t2,	6	# t3 = t2 << 6
	srl	$t4,	$t2,	6	# t4 = t2 >>> 6
	sra	$t5,	$t2,	6	# t5 = t2 >> 6

	#use "and" for variables
	andi	$t3,	$t2,	1024	# t3 = t2 & 1024
	
	#use "or" for variables (load unsigned)
	ori	$t4,	$t2,	1024	# t4 = t2 | 1024



	#11111111111111111110101001001101	a
	#00000000000000000000001111111111	b
	#11111111111111111110101111111111	a | b
	#00000000000000000001010000000000	~(a | b)	#nor
	#11111111111111111110100110110010	#xor
	nor	$t5,	$t2,	1023	# t5 = ~ (t2 | 1023)
	xor	$t6,	$t2,	1023	# t6 = (t2 | 1023) different then true
	


	add	$t6,	$zero,	$zero	# clear for next text


	#load immediate
	li	$t6,	0xffff
	#load upper immediate
	lui	$t7,	0xffff
	#attach together
	or	$t6,	$t6,	$t7


	#---------------------------------------------------------
	j	fini			#goto fini

fini:	
	#Finished. Return to $ra
	jr	$ra
