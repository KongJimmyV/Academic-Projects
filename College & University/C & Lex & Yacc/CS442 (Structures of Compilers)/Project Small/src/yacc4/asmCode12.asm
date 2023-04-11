	.text	
	.globl		main
main:
	j		L4
fact:
	addi		$sp, $sp, -12
	sw		$ra, 4($sp)
L1:
	lw		$t0, n
	li		$t1, 1
	sle		$t2, $t0, $t1
	beq		$t2, $zero, L2
	li		$t0, 1
	sw		$t0, 12($sp)
	lw		$ra, 4($sp)
	addi		$sp, $sp, 12
	jr		$ra
L2:
	lw		$t0, n
	li		$t1, 1
	sub		$t2, $t0, $t1
	sw		$t2, n
	lw		$t0, n
	li		$t1, 1
	add		$t2, $t0, $t1

	subu		$sp, $sp, 4
	sw		$t2, 4($sp)
	jal		fact
	lw		$t2, 4($sp)
	addu		$sp, $sp, 4
	lw		$t0, -4($sp)
	mul		$t1, $t2, $t0
	sw		$t1, 12($sp)
	lw		$ra, 4($sp)
	addi		$sp, $sp, 12
	jr		$ra
L4:


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, n


	jal		fact
	lw		$t0, 0($sp)
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
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
n:	.word		0
