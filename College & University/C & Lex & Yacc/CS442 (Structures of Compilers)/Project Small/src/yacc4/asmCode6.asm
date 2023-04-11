	.text	
	.globl		main
main:


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, count
L1:
	lw		$t0, count
	li		$t1, 0
	sgt		$t2, $t0, $t1
	beq		$t2, $zero, L17


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, low

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, mid

	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, high
L2:
	lw		$t0, low
	lw		$t1, mid
	sgt		$t3, $t0, $t1
	beq		$t3, $zero, L3
	lw		$t0, low
	sw		$t0, temp
	lw		$t0, mid
	sw		$t0, low
	lw		$t0, temp
	sw		$t0, mid
L3:
L5:
	lw		$t0, low
	lw		$t1, high
	sgt		$t3, $t0, $t1
	beq		$t3, $zero, L6
	lw		$t0, low
	sw		$t0, temp
	lw		$t0, high
	sw		$t0, low
	lw		$t0, temp
	sw		$t0, high
L6:
L8:
	lw		$t0, mid
	lw		$t1, high
	sgt		$t3, $t0, $t1
	beq		$t3, $zero, L9
	lw		$t0, mid
	sw		$t0, temp
	lw		$t0, high
	sw		$t0, mid
	lw		$t0, temp
	sw		$t0, high
L9:

	lw		$t0, low
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L11:
	ble		$t0, $zero, L12
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L11
L12:

	lw		$t0, mid
	li		$v0, 1
	move		$a0, $t0
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

	lw		$t0, high
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
	lw		$t0, count
	li		$t1, 1
	sub		$t3, $t0, $t1
	sw		$t3, count
	j		L1
L17:
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
high:	.word		0
low:	.word		0
temp:	.word		0
mid:	.word		0
count:	.word		0
