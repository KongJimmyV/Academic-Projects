		.equ SWITCHES, 	0x10000030 # The base address of the slider switches
		.equ BUTTONS, 	0x10000020 # The base address of the pushbuttons
		.equ LEDS_RED,	0x10000010 # The base address of the RED LEDs

		.text
		.global main

##################################
##  Add and Multply Calculator  ##
##################################
main:	nop

		add		r10,r0,r0		# initialize the storage register as zero

	####################################################################
	##  Preload the other memory addresses into registers if desired  ##
	####################################################################
		movia	r20, SWITCHES
		movia	r21, BUTTONS
		movia	r22, LEDS_RED

loop:	nop						#Start of the main loop

		ldw		r6,0(r21)		# Start by reading in the BUTTONS

								# Then start bitmasking & branching to complete the operations

								# the first test is provided as an example:

#####################################
##  If Keys are not pressed, skip  ##
#####################################
	# check if keys are not pressed
		andi	r7,r6,0b1111	# AND r6 with 0b0001 and put in r7
		beq		r7,r0,done 		# if bit 1 is NOT SET (r7 = 0) skip to the next bit to check

#########################
##  Check Key Presses  ##
#########################
	# check if key_0 is pressed
		andi	r7,r6,0b0001	# mask key_0
		bne		r7,r0,wait1 	# do first test (store first number)
	# check if key_1 is pressed
		andi	r7,r6,0b0010	# mask key_1
		bne		r7,r0,wait2 	# do second test (add)
	# check if key_2 is pressed
		andi	r7,r6,0b0100	# mask key_2
		bne		r7,r0,wait3 	# do third test (sub)
	# check if key_3 is pressed
		andi	r7,r6,0b1000	# mask key_3
		bne		r7,r0,wait4 	# do fourth test (div)

#############
##  Tests  ##
#############
	#######################
	##  KEY_0 is pressed ##
	#######################			# if we get here, bit 1 WAS set
	wait1:	ldw		r10,0(r20)		# (First Value) load the slider switches into r10 (assumes r20 has been used for the slider swithches above)
			mov		r12,r10			# Store value in r12
			stw		r12, 0(r22)		# Light Red LEDS

			ldw		r6, 0(r21)		# Add a small loop here to repeatedly read the buttons and compare to r0
			andi	r7,r6,0b0001	# mask key_0
			bne		r0, r7, wait1	# as long as the buttons are not zero, keep reading them and testing again
		br		done			# Skip to the end of the loop

	#######################
	##  KEY_1 is pressed ##
	#######################
	wait2:	ldw 	r11,0(r20)		# (Second Value) Load slider switches into r11
			mul		r12,r10,r11		# Multiply (r10 x r11 = r12)
			stw		r12, 0(r22)		# Light Red LEDS

			ldw		r6, 0(r21)		# Load push buttons in to r6
			andi	r7,r6,0b0010	# mask key_1
			bne		r0, r7, wait2	# Wait if push button is still pressed
		br		done			# Skip to the end of the loop

	#######################
	##  KEY_2 is pressed ##
	#######################
	wait3:	ldw 	r11,0(r20)		# (Second Value) Load slider switches into r11
			add		r12,r10,r11		# Add (r10 + r11 = r12)
			stw		r12, 0(r22)		# Light Red LEDS

			ldw		r6, 0(r21)		# Load push buttons in to r6
			andi	r7,r6,0b0100	# mask key_2
			bne		r0, r7, wait3	# Wait if push button is still pressed
		br		done			# Skip to the end of the loop

	#######################
	##  KEY_3 is pressed ##
	#######################
	wait4:	ldw 	r11,0(r20)		# (Second Value) Load slider switches into r11
			div		r12,r10,r11		# Divide (r10 / r11 = r12)
			stw		r12, 0(r22)		# Light Red LEDS

			ldw		r6, 0(r21)		# Load push buttons in to r6
			andi	r7,r6,0b1000	# mask key_3
			bne		r0, r7, wait4	# Wait if push button is still pressed
		br		done			# Skip to the end of the loop

#################
##  End Tests  ##
#################

skip1: 							# Add the other tests here, chaning them together as with the first
								# Test for r6 being equal to 2 and perform multiplication

skip2:							# Test for r6 being equal to 4 and perform addition


skip3:							# Don't test anything here, this is the 'fallback' just display r10


done:							# All done

		stw		r10, 0(r22)		# Light Red LEDS

		br		loop			# return to the main loop

		.end
