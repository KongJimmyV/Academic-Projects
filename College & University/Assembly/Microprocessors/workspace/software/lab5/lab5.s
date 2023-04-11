		.equ	EXPANSION,0x10000700  # The base address of the IO port (JP2)
		.equ 	BUTTONS, 0x10000020 # The base address of the pushbuttons
		.equ	SWITCHES, 0x10000030 # The base address of the pushbuttons


			.data     # This region holds reserved memory locations for variables

			.align 2  # Since we are storing words, we must align on the 4-byte boundary
pattern:	.word 0b00110011001100110011001100110011  	# This pattern, when rotated, will drive the stepper
#pattern:	.word 0b10011000110001000110001000110001  	# STEP MOTOR PATTERN

reserved:	.word 0										# Step 2: Add a .word for the total step count


			.text			# This region hold instructions
			.global main

main:
			movia r21,pattern		# Load the address of the reserved memory location 'pattern'
			movia r22,reserved
			ldw	r14,0(r21)			# Load the 32-bit word at the location of 'pattern' into r14

			movia r20, BUTTONS		# Initialize the other addresses we will need
			movia r19, EXPANSION	#
			movia r18, SWITCHES		#


			movi  r6,0x0F			# Load the value 0b00001111
			stw	r6,4(r19)			# Store 0x0F into EXPANSION's base address + 1
									# This sets the first four bits of the expansion port to be
									# an output. Otherwise the pins default to input

loop:


wait1:		ldw	r10,0(r20)		#
			andi r10,r10,0b0011 #
			beq	r10,r0,wait1	# WAIT FOR BUTTON PRESS

			andi r12,r10,0b0001 		# KEY_0 IS PRESSED
			beq r12, r0, skipButton1	# Skip Button if KEY_0 IS NOT PRESSED
			movi r13,31					# make r13 = 31 	skipButton1:

			andi r12,r10,0b0010 		# KEY_1 IS PRESSED
			beq r12, r0, skipButton2	# Skip Button if KEY_0 IS NOT PRESSED
			movi r13,1					# make r13 = 1		skipButton2:


wait2:		ldw r10,0(r20)		#
			andi r10,r10,0b0011 #
			bne r10,r0,wait2	# WAIT FOR BUTTON RELEASE

			ldw r10,0(r18)		# Step 1: Read the slider switches and setup your loop variables
			mov r9,r0			# S1: count variable

loop1:		nop					# Step 1: Start the loop and perform your loop count test



			.equ	GREEN_LEDS, 0x10000000 	# GREEN DEBUGGER LEDS
			movia r2, GREEN_LEDS			# GREEN DEBUGGER LEDS
			stw r13,0(r2)					# GREEN DEBUGGER LEDS

			beq r9,r0,end		# check if count is 0, and do nothing

			rol r14,r14,r13		# rotate the step pattern 1 bit to left or right(step once)
			stw r14,0(r19)		# output the pattern to the Expansion port

			movia r17,200000	#	<- Increase the value to slow down the motor...
			mov  r16,r0			# These instructions form a small time delay loop, since
time:		addi r16,r16,1		# the motor cannot spin nearly as fast as the CPU can run
			blt	r16,r17,time	#

			.equ	RED_LEDS, 0x10000010 	# RED DEBUGGER LEDS
			movia r23, RED_LEDS				# RED DEBUGGER LEDS
			stw r13,0(r23)					# RED DEBUGGER LEDS

			addi r9,r9,1		# Step 1: Increment your loop variable and branch back to loop
			blt r9,r10,loop1	#

			ldw	r11,0(r22)		# Step 2: Load the total step count from memory
			add r11,r11,r10		# Step 2: Then increment it by the number of steps
			stw r11,0(r22)		# Step 2: And save back into memory

end:
			br loop
			.end
