	.text	
	.globl		main
main:
	j		L15
aa:
	addi		$sp, $sp, -20
	sw		$ra, 4($sp)
	lw		$t0, 20($sp)
	lw		$t1, 24($sp)
	add		$t2, $t0, $t1
	sw		$t2, 12($sp)
	lw		$t0, 20($sp)
	lw		$t1, 24($sp)
	mul		$t2, $t0, $t1
	sw		$t2, 16($sp)

	lw		$t0, 20($sp)
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

	lw		$t0, 24($sp)
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

	lw		$t0, 20($sp)
	lw		$t1, 24($sp)
	add		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
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

	lw		$t0, 12($sp)
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

	lw		$t0, 16($sp)
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

	lw		$t0, x
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

	lw		$t0, y
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L13:
	ble		$t0, $zero, L14
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L13
L14:
	lw		$t0, 12($sp)
	sw		$t0, x
	li		$t0, 2000
	sw		$t0, 28($sp)
	lw		$ra, 4($sp)
	addi		$sp, $sp, 20
	jr		$ra
    
	lw		$ra, ($sp)
	addi		$sp, $sp, 16
	jr		$ra
L15:
	li		$t0, 10
	sw		$t0, x
	li		$t0, 20
	sw		$t0, y


	lw		$t0, x
	lw		$t1, y
	subu		$sp, $sp, 8
	sw		$t0, 0($sp)
	sw		$t1, 4($sp)
	jal		aa
	addi		$sp, $sp, 8
	lw		$t0, 0($sp)
	li		$t1, 2
	mul		$t2, $t0, $t1
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L16:
	ble		$t0, $zero, L17
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L16
L17:

	lw		$t0, x
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L18:
	ble		$t0, $zero, L19
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L18
L19:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
x:	.word		0
y:	.word		0
