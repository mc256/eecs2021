	.globl	fini
	.data
stri:	.asciiz	"-->"
	.text
main:	
	#input
	addi	$v0,	$zero,	5
	syscall
	add	$t0,	$zero,	$v0

	#commet
	addi	$v0,	$zero,	4
	la	$a0,	stri	#OUTPUT STRING
	syscall

	#ori	$t5,	$zero,	0xffff
	#sll	$t5,	$t5,	16
	lui	$t5,	0xffff
	ori	$t5,	$t5,	0xfbff

	addi	$t6,	$zero,	1024
	nor	$t6,	$zero,	$t6	#equals to $t5

	xor	$a0,	$t0,	$t5	# a = b ^ c different then true
	#example: 1011 ^ 0101 = 1110

	addi	$v0,	$zero,	1	#prepare output int
	syscall				#output

fini:
	jr	$ra
