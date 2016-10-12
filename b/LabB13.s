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

	sll	$a0,	$t0,	21
	srl	$a0,	$a0,	31

	addi	$v0,	$zero,	1	#prepare output int
	syscall				#output

fini:
	jr	$ra
