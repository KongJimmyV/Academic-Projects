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
L1:
	lw		$t0, current
	lw		$t1, end
	sle		$t2, $t0, $t1
	beq		$t2, $zero, L8
	lw		$t0, current
	li		$t1, 32
	sub		$t3, $t0, $t1
	li		$t0, 5
	mul		$t1, $t3, $t0
	li		$t0, 9
	div		$t1, $t0
	mflo		$t3
	sw		$t3, c
	lw		$t0, current
	li		$t1, 460
	add		$t3, $t0, $t1
	li		$t0, 5
	mul		$t1, $t3, $t0
	li		$t0, 9
	div		$t1, $t0
	mflo		$t3
	sw		$t3, k

	lw		$t0, current
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L2:
	ble		$t0, $zero, L3
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L2
L3:

	lw		$t0, c
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L4:
	ble		$t0, $zero, L5
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L4
L5:

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L6:
	ble		$t0, $zero, L7
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L6
L7:
	lw		$t0, current
	lw		$t1, inc
	add		$t3, $t0, $t1
	sw		$t3, current
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
