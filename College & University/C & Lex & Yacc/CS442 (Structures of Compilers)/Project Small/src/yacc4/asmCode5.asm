	.text	
	.globl		main
main:


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, start

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, end

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, inc
	lw		$t0, start
	sw		$t0, current
	lw		$t0, start
	sw		$t0, current
L1:
	lw		$t1, current
	lw		$t2, end
	sle		$t3, $t1, $t2
	beq		$t3, $zero, L8
	lw		$t1, current
	li		$t2, 32
	sub		$t5, $t1, $t2
	li		$t1, 5
	mul		$t2, $t5, $t1
	li		$t1, 9
	div		$t2, $t1
	mflo		$t5
	sw		$t5, c
	lw		$t1, current
	li		$t2, 460
	add		$t5, $t1, $t2
	li		$t1, 5
	mul		$t2, $t5, $t1
	li		$t1, 9
	div		$t2, $t1
	mflo		$t5
	sw		$t5, k

	lw		$t1, current
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	add		$t2, $zero, $zero
L2:
	ble		$t1, $zero, L3
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t2, $t2, 1
	blt		$t2, $t1, L2
L3:

	lw		$t1, c
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	add		$t2, $zero, $zero
L4:
	ble		$t1, $zero, L5
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t2, $t2, 1
	blt		$t2, $t1, L4
L5:

	lw		$t1, k
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t1, 1
	add		$t2, $zero, $zero
L6:
	ble		$t1, $zero, L7
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t2, $t2, 1
	blt		$t2, $t1, L6
L7:
	lw		$t1, current
	lw		$t2, inc
	add		$t4, $t1, $t2
	sw		$t4, current
	j		L1
L8:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
c:	.word		0
inc:	.word		0
k:	.word		0
end:	.word		0
current:	.word		0
start:	.word		0
