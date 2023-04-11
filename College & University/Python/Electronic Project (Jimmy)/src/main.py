

######################################################################
###
### Name:       Raspberry Pi Robot
###
### Purpose:    N/A
###
######################################################################
###         Description                                     #######
###                                                         ######
### Created by:     Jimmy Vang                              #####
### Date Created:   3/03/2017                               ####
###                                                         ###
######################################################################

import robotController
import computerVision

import sys
import time
#import Queue
import threading

import atexit
import traceback
import cv2

######################################################################
### Platform/OS compatibility Checks ###
#######################################

# Create platform variables/constants
CURRENT_OPERATING_SYSTEM = sys.platform
RASPBERRY_PI_3_PLATFORM = "linux"

# Check for OS compatibility (ONLY WORKS ON RASPBERRY PI).
if CURRENT_OPERATING_SYSTEM == RASPBERRY_PI_3_PLATFORM:

    # Prompt an OK message if compatible.
    print("main.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is OK.")

else:

    # Prompt an UNSUPPORTED messge and exit this program if not compatible.
    # Exit this program.
    print("main.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is not supported.")
    sys.exit()

# Initialize/Create objects for the Robot.
c = robotController.robotController()   # Create a robot controller class as 'c'.
v = computerVision.computerVision()     # Create a computer vision class as 'v'
queueLock = threading.Lock()

cascade = [cv2.CascadeClassifier('./haarcascades classifier data/haarcascade_frontalface_default.xml')]

# Run all code here.
def main():

    print("\n*** STARTING DEMO ***")
    c.stopMotors()
    c.resetServos()

    while (True):
        print("\n*** MAIN MENU (Demo written by: \"Jimmy Vang\") ***")

        # Ask user what program to run.
        print("\nWhich program would you like to run?"
            + "\n    1 Object Tracker/Follower (Only Faces for now)"
            + "\n    2 Line Follower"
            + "\n    3 Motor Tester"
            + "\n    4 Servo Tester"
            + "\n"
            + "\nType/Enter in the program number to run it."
            + "\nType/Enter Q to quit demo.")
        program = input("Program #: ")

        # Attempt to run programs
        print("\nAttempting to run program #" + program)
        time.sleep(1)

        if program == "1":      # Object Tracker/Follower
            print("\nSuccess! Running Object Tracker/Follower")
            v.trackObject(cascade=cascade)

        elif program == "2":    # Line Follower
            print("\nSuccess! Running Line Follower")
            v.lineFollower()

        elif program == "3":    # Motor Tester
            print("\nSuccess! Running Motor Tester")
            motorTest()

        elif program == "4":    # Servo Tester
            print("\nSuccess! Running Servo Tester")
            servoTest()

        elif program == "q" or program == "Q":
            print("\nQuiting demo! Please wait!")
            break

        else:
            # Invalid user input. Ask to type again.
            print("\nInvalid Input! Please try again!")
            time.sleep(2)

    # End of demo
    c.stopMotors()
    c.resetServos()
    return

def motorTest():

    ############ Testing Motors ############
    print("\n*** Testing Motors ***")

    print("Moving Forward")
    c.driveForward()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Moving Backwards")
    c.driveReverse()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Rotating Right")
    c.rotateRight()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Rotating Left")
    c.rotateLeft()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Rotating Left")
    c.rotateLeft()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Rotating Right")
    c.rotateRight()
    time.sleep(0.4)
    c.stopMotors()
    time.sleep(1)

    print("Stopping Motors")
    c.stopMotors()

    return

def servoTest():

    ############ Test Servos ############
    print("\n*** Testing Servos ***")

    print("Testing bottom servo using robotController's function")
    for i in range(180):
        c.rotateBottomCameraServo(i)
        time.sleep(0.01)

    c.resetServos()

    print("Testing top servo using robotController's function")
    for i in range(180):
        c.rotateTopCameraServo(i)
        time.sleep(0.01)

    c.resetServos()

    print("Testing bottom servo by setting the pi's servo_pulsewidth")
    for i in range(1500, 2500):
        c.pi.set_servo_pulsewidth(c.topServoGPIO, i)
        time.sleep(0.001)

    c.resetServos()

    print("Testing top servoby setting the pi's servo_pulsewidth")
    for i in range(500, 2500):
        c.pi.set_servo_pulsewidth(c.botServoGPIO, i)
        time.sleep(0.001)

    c.resetServos()

    print("Stopping Servos")
    c.stopServos()

    return

# Cleans up the RPi robot and exits safely
class cleanUpThread (threading.Thread):

    def __init__(self, threadID=0, name='clean'):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name

    def run(self):
        print ("\n*** Starting " + self.name + " ***")
        # Get lock to synchronize threads
        queueLock.acquire()

        c.stop()
        v.stop()

        # Free lock to release next thread
        queueLock.release()

        print ("*** Exiting " + self.name + " ***\n")

# Cleans up the RPi robot and exits safely
class objectTracker (threading.Thread):

    def __init__(self, threadID=1, name='object_tracker'):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name

    def run(self):
        print ("\n*** Starting " + self.name + " ***")
        # Get lock to synchronize threads
        queueLock.acquire()

        v.trackObject()

        # Free lock to release next thread
        queueLock.release()

        print ("*** Exiting " + self.name + " ***\n")

        # Cleans up the RPi robot and exits safely
class objectFollower (threading.Thread):

    def __init__(self, threadID=2, name='object_follower'):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name

    def run(self):
        print ("\n*** Starting " + self.name + " ***")
        # Get lock to synchronize threads
        queueLock.acquire()

        v.followObject(cascade=cascade)

        # Free lock to release next thread
        queueLock.release()

        print ("*** Exiting " + self.name + " ***\n")

##########################################################################
### Run Robot Program Here ###
#############################

# Create queueLock and threads array
queueLock = threading.Lock()
threads = []

# Create new threads
thread_cleanup = cleanUpThread(1, "Thread_CleanUp")

# Attempt to run main
try:

    # Run main
    main()

except (KeyError, KeyboardInterrupt) as e:
    print("")
    print("*********************************************")
    print("*** A key or CTRL-C was pressed while the Robot was running. ***")
    print(e)
    traceback.print_exc()
    print("*********************************************")
    print("")

except (Exception) as e:
    print("")
    print("*********************************************")
    print("*** An Unexpected Exception/Error Occured ***")
    print(e)
    traceback.print_exc()
    print("*********************************************")
    print("")

finally:

    # Start cleanup thread
    thread_cleanup.start()          # CleanUp Thread
    threads = []
    threads.append(thread_cleanup)  # Add threads to thread list
    for t in threads:               # Wait for all threads to complete
        t.join()

print("\n*** END OF DEMO ***")
