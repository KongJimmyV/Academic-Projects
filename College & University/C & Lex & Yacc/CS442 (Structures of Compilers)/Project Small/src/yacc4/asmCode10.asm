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
	li		$t0, 0
	sw		$t0, p
L3:
	lw		$t1, p
	lw		$t2, count
	li		$t3, 1
	sub		$t4, $t2, $t3
	slt		$t2, $t1, $t4
	beq		$t2, $zero, L9
	lw		$t1, p
	sw		$t1, s
	lw		$t1, p
	li		$t3, 1
	add		$t5, $t1, $t3
	sw		$t5, i
L4:
	lw		$t1, i
	lw		$t3, count
	slt		$t6, $t1, $t3
	beq		$t6, $zero, L8
L5:
	lw		$t1, i
	la		$t3, numbers
	sll		$t1, $t1, 2
	add		$t3, $t3, $t1
	lw		$t3, 0($t3)
	lw		$t1, s
	la		$t8, numbers
	sll		$t1, $t1, 2
	add		$t8, $t8, $t1
	lw		$t8, 0($t8)
	slt		$t1, $t3, $t8
	beq		$t1, $zero, L6
	lw		$t3, i
	sw		$t3, s
L6:
	lw		$t1, i
	li		$t3, 1
	add		$t7, $t1, $t3
	sw		$t7, i
	j		L4
L8:
	lw		$t1, p
	la		$t3, numbers
	sll		$t1, $t1, 2
	add		$t3, $t3, $t1
	lw		$t3, 0($t3)
	sw		$t3, temp
	lw		$t1, p
	lw		$t3, s
	la		$t5, numbers
	sll		$t3, $t3, 2
	add		$t5, $t5, $t3
	lw		$t5, 0($t5)
	la		$t3, numbers
	sll		$t1, $t1, 2
	add		$t3, $t3, $t1
	sw		$t5, 0($t3)
	lw		$t1, s
	lw		$t3, temp
	la		$t5, numbers
	sll		$t1, $t1, 2
	add		$t5, $t5, $t1
	sw		$t3, 0($t5)
	lw		$t1, p
	li		$t3, 1
	add		$t4, $t1, $t3
	sw		$t4, p
	j		L3
L9:
	li		$t0, 2
	add		$t1, $zero, $zero
L10:
	ble		$t0, $zero, L11
	li		$v0, 4
	la		$a0, _nl
	syscall	
	addi		$t1, $t1, 1
	blt		$t1, $t0, L10
L11:
	li		$t0, 0
	sw		$t0, i
L12:
	lw		$t1, i
	lw		$t2, count
	slt		$t3, $t1, $t2
	beq		$t3, $zero, L15

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
L13:
	ble		$t1, $zero, L14
	li		$v0, 11
	li		$a0, 32
	syscall	
	addi		$t2, $t2, 1
	blt		$t2, $t1, L13
L14:
	lw		$t1, i
	li		$t2, 1
	add		$t4, $t1, $t2
	sw		$t4, i
	j		L12
L15:
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
