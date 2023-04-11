
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

    # Constants
    UP      = 1
    DOWN    = -1
    LEFT    = -1
    RIGHT   = 1

    ### Connect to local Pi. ###
    pi = pigpio.pi()
    if not pi.connected:
        print("pigpio.pi was unable to connect to the pi.")
        sys.exit()

    # Motor Speed
    motorSpeedPwm_Pin = 22
    motorSpeedPwm_Freq = 50
    motorSpeedPwm_DutyCycle = 60

    # Right Motor Setup
    rightMotorAIN1 = 29
    rightMotorAIN2 = 31
    rightMotorPwmA_Pin = 35
    rightMotorPwmA_Freq = 50000
    rightMotorPwmA_DutyCycle = 90

    # Left Motor Setup
    leftMotorBIN1 = 33
    leftMotorBIN2 = 32
    leftMotorPwmB_Pin = 37
    leftMotorPwmB_Freq = 50000
    leftMotorPwmB_DutyCycle = 90

    # Top Servo Setup
    topServoPin = 40
    topServoGPIO = 21
    topServoPwmFreq = 50
    topServoMs = 1500
    topServoMsMax = 2500
    topServoMsMin = 1650
    topServoPwmDutyCycle = 7.25
    topServoMaxDutyCycle = 12.0
    topServoMinDutyCycle = 7.25
    topServoCurrentAngle = 180

    # Bottom Servo Setup
    botServoPin = 38
    botServoGPIO = 20
    botServoPwmFreq = 50
    botServoMs = 1500
    botServoMsMax = 2500
    botServoMsMin = 500
    botServoPwmDutyCycle = 7.25
    botServoMaxDutyCycle = 12.0
    botServoMinDutyCycle = 2.5
    botServoCurrentAngle = 90

    ### GPIO Setup ###
    try:
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(rightMotorAIN1, GPIO.OUT)
        GPIO.setup(rightMotorAIN2, GPIO.OUT)
        GPIO.setup(leftMotorBIN1, GPIO.OUT)
        GPIO.setup(leftMotorBIN2, GPIO.OUT)

        GPIO.setup(rightMotorPwmA_Pin, GPIO.OUT)
        GPIO.setup(leftMotorPwmB_Pin, GPIO.OUT)
        GPIO.setup(motorSpeedPwm_Pin, GPIO.OUT)

        #GPIO.setup(topServoPin, GPIO.OUT)
        #GPIO.setup(botServoPin, GPIO.OUT)
    except (KeyboardInterrupt, Exception):
        #self.stop()
        pass

    ### GPIO Software PWM Setup ###
    leftMotor = GPIO.PWM(rightMotorPwmA_Pin, rightMotorPwmA_Freq)
    rightMotor = GPIO.PWM(leftMotorPwmB_Pin, leftMotorPwmB_Freq)
    motorSpeed = GPIO.PWM(motorSpeedPwm_Pin, motorSpeedPwm_Freq)
    #topServo = GPIO.PWM(topServoPin, topServoPwmFreq)
    #botServo = GPIO.PWM(botServoPin, botServoPwmFreq)

    ######################################################################
    ### Initialization ###
    #####################
    def __init__(self):

        return

    ######################################################################
    ### Drive Functions ###
    ######################

    # Drive the robot forwards
    def driveForward(self):
        #print("Going forwards")
        self.motorSpeed.start(self.motorSpeedPwm_DutyCycle)

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
        self.motorSpeed.start(self.motorSpeedPwm_DutyCycle)

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
        self.motorSpeed.start(self.motorSpeedPwm_DutyCycle)

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
        self.motorSpeed.start(self.motorSpeedPwm_DutyCycle)

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
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 0)

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
        self.topServoCurrentAngle = angle

        return

    # Rotate bottom camera servo
    def rotateBottomCameraServo(self, angle):
        #print("Bottom Servo Rotating")
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 0)

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
        self.botServoCurrentAngle = angle

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
        self.motorSpeed.stop()
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
        self.topServoCurrentAngle = 180
        self.botServoCurrentAngle = 90
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

