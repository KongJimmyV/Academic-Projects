.equ RED_LEDS,		0x10000010	# RED LEDS
.equ PUSH_BUTTONS,	0x10000020	# PUSH BUTTONS

.data			# This region holds data
	.align 2

	num:	.word 1,2,3,4,5



.text			# This region holds instructions
.global main

main:

	movia 	r2,RED_LEDS			# Get address from RED_LEDS
	movia 	r3,PUSH_BUTTONS		# Get address from PUSH_BUTTONS
	mov		r4,r0				# Initialize r4 as COUNTER
	movia	r5,num				# Initialize r5 with address of num

	movi	r21,5				# number of times loop1 runs

loop1:		#start of loop1
	waitbutton1:
		ldw		r11,0(r3)				#load push buttons
		andi	r11,r11,0b0010			#mask KEY_1
		beq		r11,r0,waitbutton1		#wait for button press from KEY_1

	waitbutton2:
		ldw		r11,0(r3)				#load push buttons
		andi	r11,r11,0b0010			#mask KEY_1 push button
		bne		r11,r0,waitbutton2		#wait for button release from KEY_1 push button

		bge		r4,r21,clearLED			#if counter reaches max amount, branch to clearLED

		ldw		r12,0(r5)				#load the value at r11 into r12
		stw		r12,0(r2)				#write the value to the red leds
		addi	r5,r5,4					#add to address value in num
		addi	r4,r4,1					#add to counter

		br		loop1					#branch to the end of loop1

loop1end:	#end of loop1

clearLED:	#clears LEDS
	stw		r0,0(r2)			# reset LEDS
	mov		r4,r0				# reset counter
	movia	r5,num				# reset num
	br		loop1				# branch to loop1


br 		main

.end
