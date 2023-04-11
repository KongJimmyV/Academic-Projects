	.equ SWITCHES, 0x10000030 # The base address of the slider switches
	.equ LEDS_RED,0x10000010 # The base address of the RED LEDs

	.equ HEX_BASE,0x10000040 # The base address of the 7-segment display
		.data					# Contains reserved memory locations and pre-intiialized values

		.align 2

	# *** (lookup: contains the correct led light values for a single 7-seg Display from 0-9)
	# The lookup label points to the values that need to be set to the 7-seg display for 0-9
	lookup:	.byte 0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01101111

	.text
	.global main
main:
	movia r10,LEDS_RED

	movi	r6,6
	movi	r7,7
	movi	r8,8
	movi	r9,9

	nop		# INSERT A BREAKPOINT HERE, examine the value of the stack pointer (sp in register list)
			# It may be helpful to examine it in hexadecimal (right-click and Format->Hexadecimal)
			# What is the current value? Why might that be?

			# Go to the memory tab, Click the green plus to add a memory monitor. Put in the address
			# from the stack pointer. Then click on New Renderings on the right and add a signed
			# integer rendering. Step through the next section of pushes and observe the
			# stack pointer as well as the memory values in this region.

	addi	sp,sp,-4
	stw		r6,0(sp)

	addi	sp,sp,-4
	stw		r7,0(sp)

	addi	sp,sp,-4
	stw		r8,0(sp)

	addi	sp,sp,-4
	stw		r9,0(sp)

	nop		# Now we will erase the registers r6 through r9

	mov		r6,r0
	mov		r7,r0
	mov		r8,r0
	mov		r9,r0

	nop		# Now add the code to restore the original values of r6 through r9
			# Be sure to pop in the correct order...

	ldw		r9,0(sp)
	addi	sp,sp,4

	ldw		r8,0(sp)
	addi	sp,sp,4

	ldw		r7,0(sp)
	addi	sp,sp,4

	ldw		r6,0(sp)
	addi	sp,sp,4

loop:
	nop		# Add code here to do the following...
			# 1) Read the slider switches into R4
			# 2) Call the factorial subroutine
			# 3) Put the value from r2 onto the red LEDs
	movia	r23, SWITCHES
	movia	r22, LEDS_RED
	ldw		r4, 0(r23)
	call	factorial
	stw		r2, 0(r22)
	call	displayHex
			# When the program is working, step through and make sure
			# that inside the main loop, r6,r7,r8 and r9 retain the
			# values 6,7,8 and 9.
	br	loop



	# The following subroutine works on its own, but destroys some
	# registers... fix it so all registers return to their original values
	# (except for r2 of course)

	# calculate the factorial of a number
	# Takes the desired number in on r4 (must be positive integer > 1)
	# Returns the factorial of r4 in r2
factorial: nop
	addi	sp,sp,-4		# push r7
	stw		r7,0(sp)		#

	addi	sp,sp,-4		# push r8
	stw		r8,0(sp)		#

	blt		r4,r0,done		# If number is negative, do nothing and branch to done

	movi	r8,1			# if 0!, then set 0! = 1.
	beq		r4,r0,done		# branch to done
	ldw		r8,0(sp)		#

	mov		r8,r4			# Initi r8 and r7 to initial value
	mov		r7,r4			#
	addi 	r7,r7,-1		# decrease r7 by 1
	ble		r7,r0,done		# skips multiplying if r7 is 0

	flp:
		mul		r8,r8,r7		# multiply
		addi	r7,r7,-1		# decrease r7
		bne		r7,r0,flp		# while r7 is not zero, keep multiplying


	done:
		mov		r2,r8			# store result in r2

		ldw		r8,0(sp)
		addi	sp,sp,4

		ldw		r7,0(sp)
		addi	sp,sp,4

	ret

displayHex: nop
	# Here we calculate the 1000's, 100's, 10's, and 1's positions into 4 regs
	movi	r16,1000

	mov		r3,r2

	div		r12,r3,r16		# r12 = result / 1000 (rounded off)
	mul		r17,r12,r16		# r4 = 1000's place * 1000
	sub		r3,r3,r17		# remaining average (remainder of division) = orig avg - 1000's

	movi	r16,100

	div		r13,r3,r16		# r13 = remaining result / 100 (rounded off)
	mul		r17,r13,r16		# r4 = 100's place * 100
	sub		r3,r3,r17		# remaining average (remainder of division) = orig avg - 100's

	movi	r16,10

	div		r14,r3,r16		# r14 = remaining result / 10 (rounded off)
	mul		r17,r14,r16		# r4 = 10's place * 10
	sub		r15,r3,r17		# remaining average (1's place) = orig avg - 10's

nop
	# At this point, each reg now holds a value from 0 to 9:
							# r12 = 1000's place
							# r13 = 100's place
							# r14 = 10's place
							# r15 = 1's place

	# Lookup those values in the lookup table
	movia	r20,lookup		# (1-9) get base lookup address
	add		r12,r20,r12		# ()add lookup base address to r12
	ldbu	r12,0(r12)		# load lookup address into r12

	add		r13,r20,r13		# add lookup base address to r13
	ldbu	r13,0(r13)		# load lookup address into r13

	add		r14,r20,r14		# add lookup base address to r14
	ldbu	r14,0(r14)		# load lookup address into r14

	add		r15,r20,r15		# add lookup base address to r15
	ldbu	r15,0(r15)		# load lookup address into r15

nop
	# The Shift Intermediate operations below (slli) ...															.......
	# ... will shift each bit to the left. 																				...
	# ... ( < symbol means shift 8 bits to the left. )																	...
	# ... 																												...
	# ... 		EXAMPLE 1 (values are in binary form):																	...
	# ... 		|	   				00000000 00000000 00000000 AAAAAAAA		|											...
	# ... 		|	SHIFTED VALUE  	AAAAAAAA <<<<<<<< <<<<<<<< <<<<<<<<		|											...
	# ... 		|	NEW VALUE	  	AAAAAAAA 00000000 00000000 00000000		|											...
	# ... 																												...
	# .....................................................................................................................

	# combine the values into a single register
	# ( < symbol means shift 8 bits to the left. )
	slli	r12,r12,24		# (A<<<) shift r12 24 bits to the left for the 1000's place in the 7-seg display.
	slli	r13,r13,16		# (0B<<) shift r13 16 bits to the left for the 100's place in the 7-seg display.
	slli	r14,r14,8		# (00C<) shift r14 8 bits to the left for the 10's place in the 7-seg display.
	##no need to shift r15 ## (000D) shift r15 0 bits to the left for the 1's place in the 7-seg display.

nop
	# The OR operations below (or) ...
	# ... will logically do a bitwise operation on the shifted 8 unsigned-bits from each register(r15 to r12) 		.......
	# ...... into r5's binary value (0000) which will get (ABCD).														...
	# ... 																												...
	# ... 		EXAMPLE 1 (values are in binary form):																	...
	# ... 		|	   AAAAAAAA BBBBBBBB CCCCCCCC DDDDDDDD		|														...
	# ... 		|	OR 00000000 00000000 00000000 00000000		|														...
	# ... 		|	=  AAAAAAAA BBBBBBBB CCCCCCCC DDDDDDDD		|														...
	# ... 		EXAMPLE 2 (values are in binary form):																	...
	# ... 		|	   ABCD										|														...
	# ... 		|	OR 0000										|														...
	# ... 		|	=  ABCD										|														...
	# ... 																												...
	# .....................................................................................................................
	or		r5,r0,r15		# (000D) copy r15's value into the 7-seg display.
	or		r5,r5,r14		# (00CD) or logic bitwise r14's shifted binary value into the 10's place of the 7-seg display.
	or		r5,r5,r13		# (0BCD) or logic bitwise r13's shifted binary value into the 100's place of the 7-seg display.
	or		r5,r5,r12		# (ABCD) or logic bitwise r12's shifted binary value into the 1000's place of the 7-seg display.

nop
	# write that register to the 32-bit 7-segment display port
	# HEX_BASE represts the 32-bit 7-segment display port
	movia	r21, HEX_BASE	# load r6 value from HEX_BASE base address 			|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...
	stw		r5, 0(r21)		# store r5 value into the r6 HEX_BASE base address 	|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...

	ret

	.end
