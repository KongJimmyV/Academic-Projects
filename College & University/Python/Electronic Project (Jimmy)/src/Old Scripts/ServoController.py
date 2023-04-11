

######################################################################
###         Description         #######
###                             ######
### Created by: Jimmy Vang      #####
### Date Created: 3/03/2017     ####
###                             ###
######################################################################

# imports
import sys
import time
import atexit

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
class ServoController(object):

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
        
        ### End of User Configuration ###
        
        ### GPIO Setup ###
        GPIO.setmode(GPIO.BOARD)
        #GPIO.setup(self.topServoPin, GPIO.OUT)
        #GPIO.setup(self.botServoPin, GPIO.OUT)
        
        ### Connect to local Pi. ###
        self.pi = pigpio.pi()
        if not self.pi.connected:
            print("pigpio.pi was unable to connect to the pi.")
            sys.exit()

        ### Software PWM Setup ###
        #self.topServo = GPIO.PWM(self.topServoPin, self.topServoPwmFreq)
        #self.botServo = GPIO.PWM(self.botServoPin, self.botServoPwmFreq)
    
    ######################################################################
    ### Camera/Servo Functions ###
    #############################

    # Rotate top camera servo
    def rotateTopCameraServo(self, angle):
        print("Top Servo Rotating")
        #self.topServo.stop()
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 0);

        #self.topServoPwmDutyCycle = (2.5 + (angle*(19.0/360.0)))
        self.topServoMs = (500 + (angle*(100.0/9.0)))
        #if self.topServoPwmDutyCycle >= self.topServoMinDutyCycle:
        if self.topServoMs >= self.topServoMsMin:
            pass
        else:
            #self.topServoPwmDutyCycle = self.topServoMinDutyCycle
            self.topServoMs = self.topServoMsMin

        #if self.topServoPwmDutyCycle <= self.topServoMaxDutyCycle:
        if self.topServoMs <= self.topServoMsMax:
            pass
        else:
            #self.topServoPwmDutyCycle = self.topServoMaxDutyCycle
            self.topServoMs = self.topServoMsMax

        #self.topServo.start(self.topServoPwmDutyCycle)
        self.pi.set_servo_pulsewidth(self.topServoGPIO, self.topServoMs)
        return

    # Rotate bottom camera servo
    def rotateBottomCameraServo(self, angle):
        print("Bottom Servo Rotating")
        #self.botServo.stop()
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 0);

        #self.botServoPwmDutyCycle = (2.5 + (angle*(19.0/360.0)))
        self.botServoMs = (500 + (angle*(100.0/9.0)))
        #if self.botServoPwmDutyCycle >= self.botServoMinDutyCycle:
        if self.botServoMs >= self.botServoMsMin:
            pass
        else:
            #self.botServoPwmDutyCycle = self.botServoMinDutyCycle
            self.botServoMs = self.botServoMsMin

        #if self.botServoPwmDutyCycle <= self.botServoMaxDutyCycle:
        if self.botServoMs <= self.botServoMsMax:
            pass
        else:
            #self.botServoPwmDutyCycle = self.botServoMaxDutyCycle
            self.botServoMs = self.botServoMsMax

        #self.botServo.start(self.botServoPwmDutyCycle)
        self.pi.set_servo_pulsewidth(self.botServoGPIO, self.botServoMs)
        return

    ######################################################################
    ### Stop Functions ###
    #####################
    
    # Stop All
    def stop(self):
        print("Stopping All Parts")
        self.stopServos()
        return
    
    # Stop Servos
    def stopServos(self):
        print("Stopping Servos")
        #self.topServo.stop()
        #self.botServo.stop()
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 0)
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 0)
        return

    # Reset Servos position to face the front of the robot.
    def resetServos(self):
        print("Reseting Servos")
        #self.rotateTopCameraServo(180)
        #self.rotateBottomCameraServo(90)
        self.pi.set_servo_pulsewidth(self.topServoGPIO, 2500)
        self.pi.set_servo_pulsewidth(self.botServoGPIO, 1500)
        time.sleep(2)

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

