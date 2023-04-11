	.text	
	.globl		main
main:
	j		L3
readNums:
	addi		$sp, $sp, -8
	sw		$ra, 0($sp)


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

	lw		$ra, ($sp)
	addi		$sp, $sp, 8
	jr		$ra
L3:
	j		L9
sort:
	addi		$sp, $sp, -8
	sw		$ra, 0($sp)
	li		$t0, 1
	sw		$t0, i
L4:
	lw		$t0, i
	lw		$t1, count
	slt		$t2, $t0, $t1
	beq		$t2, $zero, L8
	lw		$t0, i
	li		$t1, 1
	sub		$t3, $t0, $t1
	sw		$t3, jj
	lw		$t0, i
	la		$t1, numbers
	sll		$t0, $t0, 2
	add		$t1, $t1, $t0
	lw		$t1, 0($t1)
	sw		$t1, temp
L5:
	lw		$t0, jj
	li		$t1, 0
	sge		$t3, $t0, $t1
L6:
	lw		$t0, jj
	la		$t1, numbers
	sll		$t0, $t0, 2
	add		$t1, $t1, $t0
	lw		$t1, 0($t1)
	lw		$t0, temp
	slt		$t4, $t1, $t0
	and		$t0, $t3, $t4
	beq		$t0, $zero, L7
	lw		$t1, jj
	li		$t3, 1
	add		$t4, $t1, $t3
	lw		$t1, jj
	la		$t3, numbers
	sll		$t1, $t1, 2
	add		$t3, $t3, $t1
	lw		$t3, 0($t3)
	la		$t1, numbers
	sll		$t4, $t4, 2
	add		$t1, $t1, $t4
	sw		$t3, 0($t1)
	lw		$t1, jj
	li		$t3, 1
	sub		$t4, $t1, $t3
	sw		$t4, jj
	j		L5
L7:
	lw		$t0, jj
	li		$t1, 1
	add		$t3, $t0, $t1
	lw		$t0, temp
	la		$t1, numbers
	sll		$t3, $t3, 2
	add		$t1, $t1, $t3
	sw		$t0, 0($t1)
	lw		$t0, i
	li		$t1, 1
	add		$t3, $t0, $t1
	sw		$t3, i
	j		L4
L8:

	lw		$ra, ($sp)
	addi		$sp, $sp, 8
	jr		$ra
L9:
	j		L18
printNums:
	addi		$sp, $sp, -8
	sw		$ra, 0($sp)
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

	lw		$ra, ($sp)
	addi		$sp, $sp, 8
	jr		$ra
L18:

	jal		readNums
	lw		$t0, 0($sp)

	jal		sort
	lw		$t0, 0($sp)

	jal		printNums
	lw		$t0, 0($sp)
	li		$v0, 10
	syscall	
	.data	
	.align		4
_nl:	.asciiz		"\n"
jj:	.word		0
i:	.word		0
numbers:	.space		120
temp:	.word		0
count:	.word		0
