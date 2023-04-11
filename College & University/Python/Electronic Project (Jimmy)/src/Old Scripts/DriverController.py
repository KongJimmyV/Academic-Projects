# imports
import sys
import time
import atexit

######################################################################
###         Description         #######
###                             ######
### Created by: Jimmy Vang      #####
### Date Created: 3/03/2017     ####
###                             ###
######################################################################

######################################################################
### Platform/OS compatibility Checks ###
#######################################

# Create platform variables/constants
_OS_ = sys.platform
RASPBERRY_PI_3 = "linux"

# Check for OS compatibility (ONLY WORKS ON RASPBERRY PI).
if _OS_ == RASPBERRY_PI_3:
    
    # Import Raspberry PI packages.
    print("This OS platform \"" + _OS_ + "\" is OK.")
    import RPi.GPIO as GPIO
    import pigpio
    
else:

    # Exit this program if the OS is not compatible.
    print("This OS platform \"" + _OS_ + "\" is not supported.")
    sys.exit()

##################################################################
class DriverController(object):

    # Constants
    UP     = 1
    DOWN    = -1
    LEFT   = -1
    RIGHT  = 1

    ######################################################################
    ### Initialization ###
    #####################
    def __init__(self):
        #print("init test")
        ### User Configuration ###
        
        ### End of User Configuration ###

        ### GPIO Setup ###
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(self.rightMotorAIN1, GPIO.OUT)
        GPIO.setup(self.rightMotorAIN2, GPIO.OUT)
        GPIO.setup(self.leftMotorBIN1, GPIO.OUT)
        GPIO.setup(self.leftMotorBIN2, GPIO.OUT)

        GPIO.setup(self.rightMotorPwmA_Pin, GPIO.OUT)
        GPIO.setup(self.leftMotorPwmB_Pin, GPIO.OUT)
        
        ### Connect to local Pi. ###
        self.pi = pigpio.pi()
        if not self.pi.connected:
            print("pigpio.pi was unable to connect to the pi.")
            sys.exit()

        ### Software PWM Setup ###
        self.leftMotor = GPIO.PWM(self.rightMotorPwmA_Pin, self.rightMotorPwmA_Freq)
        self.rightMotor = GPIO.PWM(self.leftMotorPwmB_Pin, self.leftMotorPwmB_Freq)

    ######################################################################
    ### Drive Functions ###
    ######################

    # Drive the robot forwards
    def driveForward(self):
        print("Going forwards")
        GPIO.output(self.rightMotorAIN1, GPIO.LOW)
        GPIO.output(self.rightMotorAIN2, GPIO.HIGH)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.LOW)
        GPIO.output(self.leftMotorBIN2, GPIO.HIGH)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Drive the robot in reverse
    def driveReverse(self):
        print("Going backwards")
        GPIO.output(self.rightMotorAIN1, GPIO.HIGH)
        GPIO.output(self.rightMotorAIN2, GPIO.LOW)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.HIGH)
        GPIO.output(self.leftMotorBIN2, GPIO.LOW)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Rotate the robot counter-clockwise
    def rotateLeft(self):
        print("Turning Left")
        GPIO.output(self.rightMotorAIN1, GPIO.HIGH)
        GPIO.output(self.rightMotorAIN2, GPIO.LOW)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.LOW)
        GPIO.output(self.leftMotorBIN2, GPIO.HIGH)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return

    # Rotate the robot clockwise
    def rotateRight(self):
        print("Turning Right")
        GPIO.output(self.rightMotorAIN1, GPIO.LOW)
        GPIO.output(self.rightMotorAIN2, GPIO.HIGH)
        self.leftMotor.start(self.rightMotorPwmA_DutyCycle)

        GPIO.output(self.leftMotorBIN1, GPIO.HIGH)
        GPIO.output(self.leftMotorBIN2, GPIO.LOW)
        self.rightMotor.start(self.leftMotorPwmB_DutyCycle)
        return
    
    ######################################################################
    ### Stop Functions ###
    #####################
    
    # Stop All
    def stop(self):
        print("Stopping All Parts")
        self.stopMotors()
        return

    # Stop Motors
    def stopMotors(self):
        print("Stopping Motors")
        self.leftMotor.stop()
        self.rightMotor.stop()
        return

    # Cleanup Handler
    def cleanUp(self):
        print("CLEANING GPIO")
        GPIO.cleanup()
        self.pi.stop()
        print("DONE CLEANING")

    # atexit cleaner
    if _OS_ == RASPBERRY_PI_3:
        atexit.register(cleanUp)

### End of class ###
#print("Done")

##################################################################
