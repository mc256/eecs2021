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

	ori	$t5,	$zero,	0xffff
	sll	$t5,	$t5,	16
	ori	$t5,	$t5,	0xfbff

	and	$a0,	$t0,	$t5

	addi	$v0,	$zero,	1	#prepare output int
	syscall				#output

fini:
	jr	$ra
