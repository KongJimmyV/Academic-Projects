	.text	
	.globl		main
main:


	li		$v0, 5
	syscall	
	move		$t0, $v0
	sw		$t0, count
	li		$t0, 0
	sw		$t0, i
L1:
	lw		$t0, i
	lw		$t1, count
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L2

	lw		$t0, i

	li		$v0, 5
	syscall	
	move		$t1, $v0
	la		$t3, numbers
	sll		$t0, $t0, 2
	add		$t3, $t3, $t0
	sw		$t1, 0($t3)
	lw		$t0, i
	li		$t1, 1
	add		$t3, $t0, $t1
	sw		$t3, i
	j		L1
L2:
	li		$t0, 2
	add		$t1, $zero, $zero
L3:
	ble		$t0, $zero, L4
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L3
L4:
	li		$t0, 0
	sw		$t0, i
L5:
	lw		$t1, i
	lw		$t2, count
	slt		$t3, $t1, $t2
	beq		$t3, $zero, L8

	lw		$t1, i
	la		$t2, numbers
	sll		$t1, $t1, 2
	add		$t2, $t2, $t1
	lw		$t2, 0($t2)
	li		$v0, 1
	move		$a0, $t2
	syscall	
	li		$t1, 1
	add		$t2, $zero, $zero
L6:
	ble		$t1, $zero, L7
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t2, $t2, 1
	blt		$t2, $t1, L6
L7:
	lw		$t1, i
	li		$t2, 1
	add		$t4, $t1, $t2
	sw		$t4, i
	j		L5
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
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
i:	.word		0
p:	.word		0
s:	.word		0
numbers:	.space		120
temp:	.word		0
count:	.word		0
