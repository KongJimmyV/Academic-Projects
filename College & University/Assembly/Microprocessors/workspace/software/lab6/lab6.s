		.equ HEX_BASE,0x10000040 # The base address of the 7-segment display

		.data					# Contains reserved memory locations and pre-intiialized values

		.align 2

# *** (array: contains numbers from 0-9)
# The array label points to an array of 32-bit words in memory
array:	.word 5678,1130,7893,9888,56,1450,3337,7542,6453,2793

# *** (lookup: contains the correct led light values for a single 7-seg Display from 0-9)
# The lookup label points to the values that need to be set to the 7-seg display for 0-9
lookup:	.byte 0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01101111

		.text					# Start of instructions
		.global main

main:	movia	r22, HEX_BASE	# Turn off the 7-segment display if any elements were on
		stw		r0, 0(r22)

# The purpose of this source file is to turn on an Altera Cyclone II 32-bit 7-segment display.
#
# This program is for...
# ... a 32-bit 7 segment display ...			|4th display	|3th display	|2th display	|1th display	|...
# ...... represented by a simple ABCD ... 		|A				|B				|C				|D				|...
# ...... or represented by a realistic ...		|AAAAAAAA		|BBBBBBBB		|CCCCCCCC		|DDDDDDDD		|...
# ...... the lookup values are for a single 8-bit 7-segment display is shown in line 13 of the code (using NIOS II).

##################################################################################################################################
		# Calculate the average of the array
		movia	r8, array		# set r8 as array
		mov		r7, r0			# set r7 as counter
		mov		r6, r0			# set r6 as result or sum
		movi	r11, 10			# set r11 as loop max
		movi	r10, 0			# set r10 as sum

avg:	muli	r5, r7, 4		# multiply counter by 4, store result in r5,
		add		r5, r5, r8		# add r5 to array
		ldw		r10, 0(r5)		# ldw from r5 array + offset
		add		r6, r6, r10		# add result to r10 or sum
		addi	r7, r7, 1		# add counter
		blt		r7, r11, avg	# loop back to label avg
		div		r10, r6, r11	# average = sum divided by loop max count

		# when done, r10 should now hold the average

##################################################################################################################################
		# Here we calculate the 1000's, 100's, 10's, and 1's positions into 4 regs
		movi	r9,1000

		div		r12,r10,r9		# r12 = avg / 1000 (rounded off)
		mul		r4,r12,r9		# r4 = 1000's place * 1000
		sub		r10,r10,r4		# remaining average (remainder of division) = orig avg - 1000's

		movi	r9,100

		div		r13,r10,r9		# r13 = remaining avg / 100 (rounded off)
		mul		r4,r13,r9		# r4 = 100's place * 100
		sub		r10,r10,r4		# remaining average (remainder of division) = orig avg - 100's

		movi	r9,10

		div		r14,r10,r9		# r14 = remaining avg / 10 (rounded off)
		mul		r4,r14,r9		# r4 = 10's place * 10
		sub		r15,r10,r4		# remaining average (1's place) = orig avg - 10's
##################################################################################################################################
		# At this point, each reg now holds a value from 0 to 9:
								# r12 = 1000's place
								# r13 = 100's place
								# r14 = 10's place
								# r15 = 1's place

		# Lookup those values in the lookup table
		movia	r8,lookup		# (1-9) get base lookup address
		add		r12,r8,r12		# ()add lookup base address to r12
		ldbu	r12,0(r12)		# load lookup address into r12

		add		r13,r8,r13		# add lookup base address to r13
		ldbu	r13,0(r13)		# load lookup address into r13

		add		r14,r8,r14		# add lookup base address to r14
		ldbu	r14,0(r14)		# load lookup address into r14

		add		r15,r8,r15		# add lookup base address to r15
		ldbu	r15,0(r15)		# load lookup address into r15

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

		# write that register to the 32-bit 7-segment display port
		# HEX_BASE represts the 32-bit 7-segment display port
		movia	r6, HEX_BASE	# load r6 value from HEX_BASE base address 			|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...
		stw		r5, 0(r6)		# store r5 value into the r6 HEX_BASE base address 	|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...



##################################################################################################################################
loop:							# just loop forever at this point
		br		loop			# return to the main loop

		.end
