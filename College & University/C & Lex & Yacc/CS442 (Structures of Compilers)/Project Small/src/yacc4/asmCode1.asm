	.text	
	.globl		main
main:
	li		$t0, 7
	sw		$t0, i
	li		$t0, 20
	sw		$t0, jj
	lw		$t0, i
	lw		$t1, jj
	add		$t2, $t0, $t1
	sw		$t2, k

	lw		$t0, k
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
	lw		$t0, i
	lw		$t1, jj
	sub		$t2, $t0, $t1
	sw		$t2, k

	lw		$t0, k
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
	lw		$t0, i
	lw		$t1, jj
	mul		$t2, $t0, $t1
	sw		$t2, k

	lw		$t0, k
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
	lw		$t1, i
	div		$t0, $t1
	mflo		$t2
	sw		$t2, k

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L7:
	ble		$t0, $zero, L8
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L7
L8:
	lw		$t0, jj
	lw		$t1, i
	div		$t0, $t1
	mfhi		$t2
	sw		$t2, k

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L9:
	ble		$t0, $zero, L10
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L9
L10:
	lw		$t0, i
	subu		$t1, $zero, $t0
	sw		$t1, k

	lw		$t0, k
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
	lw		$t0, i
	li		$t1, 2
	add		$t2, $zero, $zero
	add		$t3, $zero, 1
L13:
	blt		$t1, $zero, L14
	mul		$t3, $t3, $t0
	addi		$t2, $t2, 1
	bne		$t2, $t1, L13
L14:
	sw		$t3, k

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L15:
	ble		$t0, $zero, L16
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L15
L16:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
jj:	.word		0
i:	.word		0
k:	.word		0
