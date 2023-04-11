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
	beq		$t2, $zero, L26


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
	slt		$t3, $t0, $t1
L3:
	lw		$t0, mid
	lw		$t1, high
	sgt		$t4, $t0, $t1
	and		$t0, $t3, $t4
	beq		$t0, $zero, L7
	lw		$t1, mid
	sw		$t1, temp
	lw		$t1, high
	sw		$t1, mid
	lw		$t1, temp
	sw		$t1, high
L4:
	lw		$t1, low
	lw		$t3, mid
	sgt		$t4, $t1, $t3
	beq		$t4, $zero, L5
	lw		$t1, low
	sw		$t1, temp
	lw		$t1, mid
	sw		$t1, low
	lw		$t1, temp
	sw		$t1, mid
L5:
	j		L19
L7:
L8:
	lw		$t1, low
	lw		$t3, mid
	sgt		$t4, $t1, $t3
L9:
	lw		$t1, mid
	lw		$t3, high
	slt		$t5, $t1, $t3
	and		$t1, $t4, $t5
	beq		$t1, $zero, L13
	lw		$t3, low
	sw		$t3, temp
	lw		$t3, mid
	sw		$t3, low
	lw		$t3, temp
	sw		$t3, mid
L10:
	lw		$t3, mid
	lw		$t4, high
	sgt		$t5, $t3, $t4
	beq		$t5, $zero, L11
	lw		$t3, mid
	sw		$t3, temp
	lw		$t3, high
	sw		$t3, mid
	lw		$t3, temp
	sw		$t3, high
L11:
	j		L18
L13:
L14:
	lw		$t3, low
	lw		$t4, mid
	sgt		$t5, $t3, $t4
L15:
	lw		$t3, mid
	lw		$t4, high
	sgt		$t6, $t3, $t4
	and		$t3, $t5, $t6
	beq		$t3, $zero, L16
	lw		$t4, low
	sw		$t4, temp
	lw		$t4, high
	sw		$t4, low
	lw		$t4, temp
	sw		$t4, high
L16:
L18:
L19:

	lw		$t0, low
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L20:
	ble		$t0, $zero, L21
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L20
L21:

	lw		$t0, mid
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L22:
	ble		$t0, $zero, L23
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L22
L23:

	lw		$t0, high
	li		$v0, 1
	move		$a0, $t0
	syscall	
	li		$t0, 1
	add		$t1, $zero, $zero
L24:
	ble		$t0, $zero, L25
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L24
L25:
	lw		$t0, count
	li		$t1, 1
	sub		$t3, $t0, $t1
	sw		$t3, count
	j		L1
L26:
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
