	.equ SWITCHES, 		0x10000030 	# The base address of the slider switches
	.equ BUTTONS,		0x10000020	# The bass address of the push buttons
	.equ GREEN_LEDS,	0x10000000 	# The base address of the GREEN LEDs
	.equ HEX_BASE,		0x10000040 	# The base address of the 7-segment display

##########################################################################
	.data							# Contains reserved memory locations and pre-intiialized values

.align 2
array: 	.word 2,4,6

		# *** (lookup: contains the correct led light values for a single 7-seg Display from 0-9)
		# The lookup label points to the values that need to be set to the 7-seg display for 0-9
lookup: .byte 0b00111111,0b00000110,0b01011011,0b01001111,0b01100110,0b01101101,0b01111101,0b00000111,0b01111111,0b01101111


##########################################################################

	.text
	.global main

##########################################################################
#
#	Infomation about the program.
#
#		FILE NAME:		exam1_1
#		TITLE:			Exam1 - Question #1
#		CREATED BY:		Jimmy Vang
#		DATE:			11/3/2016
#
#		DESCRIPTION:
#			- This program was designed to read from a switch and add the switch values to an array.
#				The board model used is a "Altera Cyclone II".
#
#			- A 7-segment display will show the switch value in decimal form with a range of "0 - 9999".
#			- An array called "array" has 3 indexes.
#
#			- The following will occur in order from top to bottom...
#				...	After a push button is pressed, the 1st switch value will be added to the 1st index of "array".
#				...		LEDG7 should light up.
#				...	After a push button is pressed, the 2nd switch value will be added to the 2nd index of "array".
#				...		LEDG6 should light up.
#				...	After a push button is pressed, the 3rd switch value will be added to the 3rd index of "array".
#				...		LEDG5 should light up.
#
#			- This will keep repeating.
#
##########################################################################
#################### INITIALIZE #################### 					##
main: nop
	# Move Addresses into registers.
	movia 	r23, SWITCHES	# "r23 = SWITCHES base"
	movia 	r22, BUTTONS	# "r22 = BUTTONS base"
	movia	r19, GREEN_LEDS # "r14 = GREEN LEDS base"
		movi	r9, 0b00000000	#
		stw		r9, 0(r19)		#

	movia	r21, array		# "r21 = array base"
##########################################################################
#################### START PROGRAM HERE #################### 			##
loop: nop

# initialize array loop here
	movi 	r12, 0			# loop counter
	movi 	r13, 3			# upperbound of loop
	movia	r21, array		# GET array bass address into R21
forLoop:

	movia	r21, array		# GET array bass address into R21
		# wait here for a button press
		wait1:
			#ldw		r4, 0(r23)		# GET switch value r23 into r4
			#call	display7Seg  	# Display SWITCH value on 7seg [Parameters: "r4"] ["r4" holds the value to display]
			ldw 	r4, 0(r22)		# "r4" <-- set value --- "r22 BUTTONS base address"
			beq 	r4, r0, wait1	# wait for button press
		# wait for button release
		wait2:
			#ldw		r4, 0(r23)		# GET switch value r23 into r4
			#call	display7Seg  	# Display SWITCH value on 7seg [Parameters: "r4"] ["r4" holds the value to display]
			ldw 	r4, 0(r22)		# "r4" <-- set value --- "r22 BUTTONS base address"
			bne 	r4, r0, wait2	# wait for button release

		# The current switch value will be added to the current index of "array".
		muli	r5, r12, 4		# GET offset into R5
		add		r21, r21, r5	# ADD offset to array base address

		ldw 	r4, 0(r23)		# LOAD switches from R23 into R4
		ldw		r5, 0(r21)		# LOAD array at the offset into R5

		add		r5, r5, r4		# ADD (array value + switch value)
		stw		r5, 0(r21)		# STORE new value from R5 into array address R21

		# Display new value on 7seg
		#ldw		r4, 0(r21)		# GET switch value r21 into r4
		#call	display7Seg  	# Display SWITCH value on 7seg [Parameters: "r4"] ["r4" holds the value to display]

	addi 	r12,r12,1					# counter++
	blt		r12,r13,forLoop				# check if upperbound of loop is reached

	br	loop							#

##########################################################################
#################### SUBROUTINES #################### 					##

# Displays a value from r4 on the seven-segment display.
#	- "r4" holds the value to display
# 	- Accepts "r4" as an integer.
# 	- Returns nothing.
display7Seg: nop

	# Here we calculate the 1000's, 100's, 10's, and 1's positions into 4 regs
	movi	r5,1000

	div		r12,r4,r5		# r12 = result / 1000 (rounded off)
	mul		r17,r12,r5		# r4 = 1000's place * 1000
	sub		r4,r4,r17		# remaining average (remainder of division) = orig avg - 1000's

	movi	r5,100

	div		r13,r4,r5		# r13 = remaining result / 100 (rounded off)
	mul		r17,r13,r5		# r4 = 100's place * 100
	sub		r4,r4,r17		# remaining average (remainder of division) = orig avg - 100's

	movi	r5,10

	div		r14,r4,r5		# r14 = remaining result / 10 (rounded off)
	mul		r17,r14,r5		# r4 = 10's place * 10
	sub		r15,r4,r17		# remaining average (1's place) = orig avg - 10's

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
	or		r2,r0,r15		# (000D) copy r15's value into the 7-seg display.
	or		r2,r2,r14		# (00CD) or logic bitwise r14's shifted binary value into the 10's place of the 7-seg display.
	or		r2,r2,r13		# (0BCD) or logic bitwise r13's shifted binary value into the 100's place of the 7-seg display.
	or		r2,r2,r12		# (ABCD) or logic bitwise r12's shifted binary value into the 1000's place of the 7-seg display.

nop
	# write that register to the 32-bit 7-segment display port
	# HEX_BASE represts the 32-bit 7-segment display port
	movia	r3, HEX_BASE	# load r6 value from HEX_BASE base address 			|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...
	stw		r2, 0(r3)		# store r5 value into the r6 HEX_BASE base address 	|AAAAAAAA	|BBBBBBBB	|CCCCCCCC	|DDDDDDDD	|...

	ret

	.end
