
######################################################################
###
### Name:       Raspberry Pi Robot Controller
###
### Purpose:    Holds the physical controls for the Raspberry Pi Robot.
###             Uses RPi.GPIO and pigpiod for the functions.
###
######################################################################
###         Description                                     #######
###                                                         ######
### Created by:     Jimmy Vang                              #####
### Date Created:   3/03/2017                               ####
###                                                         ###
######################################################################

# imports
import sys
import time
import threading

import traceback

######################################################################
### Platform/OS compatibility Checks ###
#######################################

# Create platform variables/constants
CURRENT_OPERATING_SYSTEM = sys.platform
RASPBERRY_PI_3_PLATFORM = "linux"

# Check for OS compatibility (ONLY WORKS ON RASPBERRY PI).
if CURRENT_OPERATING_SYSTEM == RASPBERRY_PI_3_PLATFORM:

    # Prompt an OK message if compatible.
    # Import Raspberry PI packages.
    print("robotController.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is OK.")
    import RPi.GPIO as GPIO
    import pigpio

else:

    # Prompt an UNSUPPORTED messge and exit this program if not compatible.
    # Exit this program.
    print("robotController.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is not supported.")
    sys.exit()

##################################################################
class robotController(object):

    # Instance Variables
    angle = 0

    # Constants
    UP      = 1
    DOWN    = -1
    LEFT    = -1
    RIGHT   = 1

    ######################################################################
    ### Initialization ###
    #####################
    def __init__(self):

        ### Connect to local Pi. ###
        self.pi = pigpio.pi()
        if not self.pi.connected:
            print("pigpio.pi was unable to connect to the pi.")
            sys.exit()

        try:
            # Right Motor Setup
            self.rightMotorAIN1 = 29
            self.rightMotorAIN2 = 31
            self.rightMotorPwmA_Pin = 35
            self.rightMotorPwmA_Freq = 50000
            self.rightMotorPwmA_DutyCycle = 90

            # Left Motor Setup
            self.leftMotorBIN1 = 33
            self.leftMotorBIN2 = 32
            self.leftMotorPwmB_Pin = 37
            self.leftMotorPwmB_Freq = 50000
            self.leftMotorPwmB_DutyCycle = 90

            # Top Servo Setup
            self.topServoPin = 40
            self.topServoGPIO = 21
            self.topServoPwmFreq = 50
            self.topServoMs = 1500
            self.topServoMsMax = 2500
            self.topServoMsMin = 1750
            self.topServoPwmDutyCycle = 7.25
            self.topServoMaxDutyCycle = 12.0
            self.topServoMinDutyCycle = 7.25

            # Bottom Servo Setup
            self.botServoPin = 38
            self.botServoGPIO = 20
            self.botServoPwmFreq = 50
            self.botServoMs = 1500
            self.botServoMsMax = 2500
            self.botServoMsMin = 500
            self.botServoPwmDutyCycle = 7.25
            self.botServoMaxDutyCycle = 12.0
            self.botServoMinDutyCycle = 2.5

            ### GPIO Setup ###
            GPIO.setmode(GPIO.BOARD)
            GPIO.setup(self.rightMotorAIN1, GPIO.OUT)
            GPIO.setup(self.rightMotorAIN2, GPIO.OUT)
            GPIO.setup(self.leftMotorBIN1, GPIO.OUT)
            GPIO.setup(self.leftMotorBIN2, GPIO.OUT)

            GPIO.setup(self.rightMotorPwmA_Pin, GPIO.OUT)
            GPIO.setup(self.leftMotorPwmB_Pin, GPIO.OUT)

            #GPIO.setup(self.topServoPin, GPIO.OUT)
            #GPIO.setup(self.botServoPin, GPIO.OUT)

            ### GPIO Software PWM Setup ###
            self.leftMotor = GPIO.PWM(self.rightMotorPwmA_Pin, self.rightMotorPwmA_Freq)
            self.rightMotor = GPIO.PWM(self.leftMotorPwmB_Pin, self.leftMotorPwmB_Freq)
            #self.topServo = GPIO.PWM(self.topServoPin, self.topServoPwmFreq)
            #self.botServo = GPIO.PWM(self.botServoPin, self.botServoPwmFreq)


        except (KeyError, KeyboardInterrupt) as e:
            self.cleanUp()
            print("")
            print("*********************************************")
            print("*** A key or CTRL-C was pressed while robotController.py was initializing. ***")
            print(e)
            traceback.print_exc()
            print("*********************************************")
            print("")
            sys.exit()

        except (Exception) as e:
            self.cleanUp()
            print("")
            print("*********************************************")
            print("*** An Unexpected Exception/Error Occured ***")
            print(e)
            traceback.print_exc()
            print("*********************************************")
            print("")
            sys.exit()

        return

    ######################################################################
    ### Drive Functions ###
    ######################

    # Drive the robot forwards
    def driveForward(self):
        #print("Going forwards")
        GPIO.output(self.rightMotorAIN1, GPIO.LOW)
        GPIO.output(self.rightMotorAIN2, GPIO.HIGH)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.LOW)
        GPIO.output(self.leftMotorBIN2, GPIO.HIGH)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Drive the robot in reverse
    def driveReverse(self):
        #print("Going backwards")
        GPIO.output(self.rightMotorAIN1, GPIO.HIGH)
        GPIO.output(self.rightMotorAIN2, GPIO.LOW)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.HIGH)
        GPIO.output(self.leftMotorBIN2, GPIO.LOW)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Rotate the robot counter-clockwise
    def rotateLeft(self):
        #print("Turning Left")
        GPIO.output(self.rightMotorAIN1, GPIO.HIGH)
        GPIO.output(self.rightMotorAIN2, GPIO.LOW)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.LOW)
        GPIO.output(self.leftMotorBIN2, GPIO.HIGH)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Rotate the robot clockwise
    def rotateRight(self):
        #print("Turning Right")
        GPIO.output(self.rightMotorAIN1, GPIO.LOW)
        GPIO.output(self.rightMotorAIN2, GPIO.HIGH)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.HIGH)
        GPIO.output(self.leftMotorBIN2, GPIO.LOW)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    ######################################################################
    ### Camera/Servo Functions ###
    #############################

#    # Rotate top camera servo
#    def rotateTopCameraServo(self, angle):
#        print("Top Servo Rotating")
#        self.topServo.stop()
#
#        self.topServoPwmDutyCycle = (2.5 + (angle*(19.0/360.0)))
#        if self.topServoPwmDutyCycle >= self.topServoMinDutyCycle:
#            pass
#        else:
#            self.topServoPwmDutyCycle = self.topServoMinDutyCycle
#
#        if self.topServoPwmDutyCycle <= self.topServoMaxDutyCycle:
#            pass
#        else:
#            self.topServoPwmDutyCycle = self.topServoMaxDutyCycle
#
#        self.topServo.start(self.topServoPwmDutyCycle)
#        return
#
#    # Rotate bottom camera servo
#    def rotateBottomCameraServo(self, angle):
#        print("Bottom Servo Rotating")
#        self.botServo.stop()
#
#        self.botServoPwmDutyCycle = (2.5 + (angle*(19.0/360.0)))
#        if self.botServoPwmDutyCycle >= self.botServoMinDutyCycle:
#            pass
#        else:
#            self.botServoPwmDutyCycle = self.botServoMinDutyCycle
#
#        if self.botServoPwmDutyCycle <= self.botServoMaxDutyCycle:
#            pass
#        else:
#            self.botServoPwmDutyCycle = self.botServoMaxDutyCycle
#
#        self.botServo.start(self.botServoPwmDutyCycle)
#        return

    # Rotate top camera servo
    def rotateTopCameraServo(self, angle):
        #print("Top Servo Rotating")
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 0);

        self.topServoMs = (500 + (angle*(100.0/9.0)))
        if self.topServoMs >= self.topServoMsMin:
            pass
        else:
            self.topServoMs = self.topServoMsMin

        if self.topServoMs <= self.topServoMsMax:
            pass
        else:
            self.topServoMs = self.topServoMsMax

        self.pi.set_servo_pulsewidth(self.topServoGPIO, self.topServoMs)
        return

    # Rotate bottom camera servo
    def rotateBottomCameraServo(self, angle):
        #print("Bottom Servo Rotating")
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 0);

        self.botServoMs = (500 + (angle*(100.0/9.0)))
        if self.botServoMs >= self.botServoMsMin:
            pass
        else:
            self.botServoMs = self.botServoMsMin

        if self.botServoMs <= self.botServoMsMax:
            pass
        else:
            self.botServoMs = self.botServoMsMax

        self.pi.set_servo_pulsewidth(self.botServoGPIO, self.botServoMs)
        return

    ######################################################################
    ### Stop Functions ###
    #####################

    # Stop All
    def stop(self):
        #print("Stopping All Parts")
        self.stopServos()
        self.stopMotors()
        self.cleanUp()
        return

    # Stop Motors
    def stopMotors(self):
        #print("Stopping Motors")
        self.leftMotor.stop()
        self.rightMotor.stop()
        return

    # Stop Servos
    def stopServos(self):
        #print("Stopping Servos")
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 0)
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 0)
        return

    # Reset Servos position to face the front of the robot.
    def resetServos(self):
        #print("Reseting Servos")
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 2500)
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 1500)
        time.sleep(2)

#    # Stop Servos
#    def stopServos(self):
#        print("Stopping Servos")
#        self.topServo.stop()
#        self.botServo.stop()
#        return
#
#    # Reset Servos position to face the front of the robot.
#    def resetServos(self):
#        print("Reseting Servos")
#        self.rotateTopCameraServo(180)
#        self.rotateBottomCameraServo(90)
#        time.sleep(2)

    # Cleanup Handler
    def cleanUp(self):
        print("--- RUNNING GPIO.cleanup() [RPi.GPIO.cleanup()]")
        GPIO.cleanup()
        print("--- RUNNING pi.stop() [pigpio.pi().stop()]")
        self.pi.stop()

### End of class ###
#print("Done")

##################################################################

