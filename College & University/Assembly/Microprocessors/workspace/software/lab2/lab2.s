		.equ LEDS_RED,0x10000010 # The base address of the RED LEDs
		.equ LEDS_GRN,0x10000000 # The base address of the Green LEDs
		.equ SWITCHES,0x10000030 # The base address of the slider switches

		.text                   # Instructions follow

        .global main            # makes label "main" globally known

main:   movia	r21,LEDS_GRN	# Execution starts here
		movia	r22,SWITCHES	# Store address of switches in r22, address of green leds in r21
		movia	r23,LEDS_RED	# ... and address of red leds in r23

		movi	r2,6			# Initialize registers r2 throgh r10
		movi	r3,2
		movi	r4,3
		movi	r5,13
		movi	r6,3
		movi	r7,1
		movi	r8,-20
		movi	r9,4
		movi	r10,-3

		stw		r0,0(r23)		#Reset all LEDS
		stw		r0,0(r21)		#Reset all LEDS
								# add your code to calculate the expression
								# here... ((r2 - r3) * (r2 / r4)) + ((r5 * r6) - ((r8 / (r7 + r9)) * r10))
								# put the final result in r15. You may have to reuse some of the registers
								# and/or use r11-r15 as temporary registers for the intermediate results

		#START YOUR CODE HERE
		
		#	Crazy Main Equation!!!
		#	Break equation into 2 SIDES, then Simplify.
			#	((r2 - r3) * (r2 / r4))
			#	+
			#	(r5 * r6) - ((r8 / (r7 + r9)) * r10))

		#	#---| Left Side |---------------------------------------------------------------------------------
			#	(r2 - r3) * (r2 / r4)
			#	Simplify left side, then store in r13

				sub r11,r2,r3		#(r2 - r3)								= r11
				div r12,r2,r4		#(r2 / r4)								= r12
				mul	r13,r11,r12		#(r2 - r3) * (r2 / r4)						*= r13

		#	#-------------------------------------------------------------------------------------------------
			#---| Right Side |--------------------------------------------------------------------------------
			#	(r5 * r6) - ((r8 / (r7 + r9)) * r10)
			#	Simplify right side, break into 2 parts, then store in r14
					#	Left Part	(r5 * r6)
					#	Simplify left part, then store in r11
					mul r11,r5,r6	#(r5 * r6)								= r11

					#	Right Part	(r8 / (r7 + r9)) * r10
					#	Simplify right part, then store in r12
					add	r12,r7,r9	#(r7 + r9)								= r12
					div	r12,r8,r12	#(r8 / (r7 + r9))						= r12
					mul r12,r12,r10	#(r8 / (r7 + r9)) * r10					= r12

				#	Subtract left and right part, then store in r14
				sub	r14,r11,r12		#(r5 * r6) - ((r8 / (r7 + r9)) * r10)		*= r14

		#	#-------------------------------------------------------------------------------------------------
			#---| Add Left Side + Right Side |----------------------------------------------------------------
				#	Finish Simplifying Main Equation by adding r13 + r14. Store in r15.
				add r15,r13,r14		#											**= r15

		#	#-------------------------------------------------------------------------------------------------

		#STOP HERE

		stw		r15,0(r21)		# Send the result of the expression to the GREEN LEDS

loop:   nop						# The beginning of the main loop

		ldw		r16,0(r22)		# read from the address in r22 (switches) and store value in r16
		
								# Now you should apply the requested LOGICAL expression. Load in any values
								# that you need using the movi instruction (see r2-r10 setup above)
								# store the end result in r20 so it can be displayed to the LEDs
								# You could also make use of the andi, ori, and xori instructions.
								# Remember to load a binary value use "0b" before the binary value, ex:
								# movi	r7,0b0110	-- This loads the value '6' into r7
								
		#START YOUR CODE HERE

		movi	r2,0b1111111011
		movi	r3,0b0001

		nor		r4,r16,r2
		or		r5,r4,r3
		andi	r20,r5,0b0000000111

		#STOP HERE



		stw		r20,0(r23)		# store the value in r20 to the address in r23 (lights)

        br      loop            # Branch to loop

        .end                    # The assembler will stop here
