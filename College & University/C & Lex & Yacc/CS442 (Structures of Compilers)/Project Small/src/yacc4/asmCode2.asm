	.text	
	.globl		main
main:
	li		$t0, 3
	sw		$t0, i
	li		$t0, 8
	sw		$t0, jj
	li		$t0, 2
	sw		$t0, k
	lw		$t0, i
	lw		$t1, jj
	lw		$t2, k
	mul		$t3, $t1, $t2
	add		$t1, $t0, $t3
	sw		$t1, m

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L1:
	ble		$t0, $zero, L2
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L1
L2:
	lw		$t0, jj
	lw		$t1, i
	div		$t0, $t1
	mflo		$t2
	lw		$t0, k
	add		$t1, $t2, $t0
	sw		$t1, m

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L3:
	ble		$t0, $zero, L4
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L3
L4:
	lw		$t0, k
	lw		$t1, jj
	mul		$t2, $t0, $t1
	lw		$t0, i
	div		$t2, $t0
	mfhi		$t1
	sw		$t1, m

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L5:
	ble		$t0, $zero, L6
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L5
L6:
	lw		$t0, jj
	lw		$t1, k
	lw		$t2, i
	add		$t3, $zero, $zero
	add		$t4, $zero, 1
L7:
	blt		$t2, $zero, L8
	mul		$t4, $t4, $t1
	addi		$t3, $t3, 1
	bne		$t3, $t2, L7
L8:
	add		$t1, $zero, $zero
	add		$t2, $zero, 1
L9:
	blt		$t4, $zero, L10
	mul		$t2, $t2, $t0
	addi		$t1, $t1, 1
	bne		$t1, $t4, L9
L10:
	sw		$t2, m

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L11:
	ble		$t0, $zero, L12
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L11
L12:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
jj:	.word		0
i:	.word		0
k:	.word		0
m:	.word		0
