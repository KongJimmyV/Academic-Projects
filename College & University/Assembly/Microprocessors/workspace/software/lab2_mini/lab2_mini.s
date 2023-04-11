		.equ LEDS_RED,0x10000010 # The base address of the RED LEDs

		.text                   # Instructions follow

        .global main            # makes label "main" globally known

main:   movia	r23,LEDS_RED	# Store address of red LEDs in r23


		movi	r5,5
		movi	r7,1

		add		r12,r5,r7		# Add r5 and r7, store result in r12

		stw	r12,0(r23)			# This displays r12 on the red LEDs
		nop						# Insert a breakpoint here



		movi	r9,128
		movi	r4,-50

		sub		r17,r4,r9		# Subtract r4 from r9, store result in r17

		stw	r17,0(r23)			# This displays r17 on the red LEDs
		nop						# Insert a breakpoint here


		movi	r11,7
		movi	r13,2

		mul		r14,r11,r13		# Multiply r11 and r13, store result in r14

		stw	r14,0(r23)			# This displays r14 on the red LEDs
		nop						# Insert a breakpoint here


		movi	r15,0b1010

		andi	r15,r15,0b0011	# Logically AND r15 with the immediate value 0b0011, store result back in r15

		stw	r15,0(r23)			# This displays r15 on the red LEDs
		nop						# Insert a breakpoint here


		movi	r16,0b11110000

		nor		r21,r0,r16		# Logically NOT (do a NOR with r0) r16 and store result in r21

		stw	r21,0(r23)			# This displays r21 on the red LEDs
		nop						# Insert a breakpoint here


loop:	nop
		br loop					# Do nothing forever
		.end
