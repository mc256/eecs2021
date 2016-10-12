
	.data
stri:
	.asciiz	"answer is:"
#--------------------MAIN PROGRAM
	.text
main:
	addi	$v0,	$zero,	4
	la	$a0,	stri	#OUTPUT STRING
	syscall
	jr	$ra
