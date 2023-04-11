	.text	
	.globl		main
main:


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, i

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, jj

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, k

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, m

	lw		$t0, i
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L1:
	ble		$t0, $zero, L2
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L1
L2:

	lw		$t0, jj
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L3:
	ble		$t0, $zero, L4
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L3
L4:

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L5:
	ble		$t0, $zero, L6
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L5
L6:

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L7:
	ble		$t0, $zero, L8
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L7
L8:
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
	lw		$t1, jj
	add		$t2, $zero, $zero
	add		$t3, $zero, 1
L11:
	blt		$t1, $zero, L12
	mul		$t3, $t3, $t0
	addi		$t2, $t2, 1
	bne		$t2, $t1, L11
L12:
	lw		$t0, k
	mul		$t1, $t3, $t0
	lw		$t0, m
	add		$t2, $t1, $t0
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L13:
	ble		$t0, $zero, L14
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L13
L14:

	lw		$t0, m
	lw		$t1, k
	lw		$t2, i
	lw		$t3, jj
	add		$t4, $zero, $zero
	add		$t5, $zero, 1
L15:
	blt		$t3, $zero, L16
	mul		$t5, $t5, $t2
	addi		$t4, $t4, 1
	bne		$t4, $t3, L15
L16:
	mul		$t2, $t1, $t5
	add		$t1, $t0, $t2
	li		$v0, 1
	move		$a0, $t1
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L17:
	ble		$t0, $zero, L18
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L17
L18:
	li		$t0, 8
	add		$t1, $zero, $zero
L19:
	ble		$t0, $zero, L20
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L19
L20:

	lw		$t0, i
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L21:
	ble		$t0, $zero, L22
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L21
L22:

	lw		$t0, jj
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L23:
	ble		$t0, $zero, L24
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L23
L24:

	lw		$t0, k
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L25:
	ble		$t0, $zero, L26
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L25
L26:

	lw		$t0, m
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L27:
	ble		$t0, $zero, L28
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L27
L28:
	li		$t0, 1
	add		$t1, $zero, $zero
L29:
	ble		$t0, $zero, L30
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L29
L30:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
jj:	.word		0
i:	.word		0
k:	.word		0
m:	.word		0
