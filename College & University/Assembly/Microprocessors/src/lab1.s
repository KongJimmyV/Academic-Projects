			.text               # Instructions follow

      		.global main        # makes label "main" globally known

#___________________________________________________________________________________________________________________
#
#	LAB 1
#	Jimmy Vang
#	9/8/2016
#___________________________________________________________________________________________________________________

main:  								### Execution of the program starts here

# Definitions
			movia	r2,0x10000030			# 	set Slider Switches	--> to R2
			movia	r5,0x10000020			#	set Push Buttons	--> to R2
			movia	r3,0x10000000			# 	set Green LEDS		--> to R3
			movia	r4,0x10000010			# 	set Red LEDS		--> to R4

			movi	r9, 0					# 	set value 0 (used for Green LEDS)
			movi	r10,0					# 	set value 0 (used for Red LEDS)
			movi	r11,0					#	set value 0 (used for Push Buttons)

			#br		turnOnAllLEDS			## branch and Turn on all LEDS
			br		turnOffAllLEDS			## branch and Turn off all LEDS

#___________________________________________________________________________________________________________________
#*** Main Loop.						#################
loop:   							### Main Loop ###
#									#################

			nop								# The beginning of the main loop

#*** This section changes Green LEDS by adding ---> (the number of switches in the ON position + 1).
			ldw		r9,0(r2)				# read from address in R2 (switches) and store value in R9
			addi	r9,r9,1					# set R9 to be equal to the sum of R9 + 1
			stw		r9,0(r3)				### Lights Green LEDS (store the value from R9 to the address in R3)
			br skip1						### SKIP changing/lighting RED LEDS

#*** This section turns on Red LEDS by adding ---> (the number of switches in the ON position + 1).
			ldw		r10,0(r2)				# read from address in R2 (switches) and store value in R10
			addi	r10,r10,1				# set R10 to be equal to the sum of R10 + 1
			stw		r10,0(r4)				### Lights Red LEDS (store the value in R10 to the address in R4)
	skip1:
			br      loop        			## Branch to loop

#___________________________________________________________________________________________________________________
#*** OTHER Branches.
turnOnAllLEDS:							# TURN ON ALL LEDS
			movi	r9,0b0011111111			# copy binary value into R9
			movi	r10,0b1111111111		# copy binary value into R10
			stw		r9,0(r3)				### turn on Green LEDS (store r9 value to r3)
			stw		r10,0(r4)				### turn on Red LEDS (store r11 value to r4)
			br      loop        			## Branch to loop
turnOffAllLEDS:							# TURN OFF ALL LEDS
			movi	r9,0					# copy 0 into r9
			movi	r10,0					# copy 0 into r11
			stw		r9,0(r3)				### store r9 value to r3 reset Green LEDS
			stw		r10,0(r4)				### store r11 value to r4 to reset Red LEDS
			br      loop        			## Branch to loop
#___________________________________________________________________________________________________________________

end:
       		.end                  		# The assembler will stop here





