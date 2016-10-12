	.globl	func1
	.globl	func2
	.globl	func3
	.text
	
main:
	add	$t0,	$zero,	90	
	jr	func1

func2:
	add	$t2,	$t0,	$t1

	addi	$v0,	$zero,	1
	add	$a0,	$zero,	$t2
	jr	func3
	
func1:
	add	$t1,	$zero,	7
	jr	func2

func3:
	syscall

	jr	$ra