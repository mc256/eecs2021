	.globl	fini
	.data
stri:	.asciiz	"check bit #10 ?"
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

	andi	$a0,	$t0,	1024	#mask
	#andi	$a0,	$t0,	0x400	#can be written in {16}


	addi	$v0,	$zero,	1	#prepare output int
	syscall				#output

fini:
	jr	$ra
