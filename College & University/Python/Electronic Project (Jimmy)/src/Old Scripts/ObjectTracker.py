
######################################################################
###
### Name:       Raspberry Pi Robot Controller
###
### Purpose:    Holds the controls for the robot.
###
######################################################################
###         Description                                     #######
###                                                         ######
### Created by:     Jimmy Vang                              #####
### Date Created:   4/02/2017                               ####
###                                                         ###
######################################################################

# imports
import robotController

import sys
import time
import threading

import numpy
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
    # Import Raspberry PI packages.
    print("computerVision.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is OK.")
    import picamera

else:

    # Prompt an UNSUPPORTED messge and exit this program if not compatible.
    # Exit this program.
    print("computerVision.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is not supported.")
    sys.exit()

##################################################################
class ObjectTracker(object):

    c = robotController.robotController()   # Create a robot controller class as 'c'.

    # Constants
    UP      = 1
    DOWN    = -1
    LEFT    = -1
    RIGHT   = 1

    # Camera Setup
    camera = picamera.PiCamera()
    camera.rotation = 180
    camera.resolution = (640, 480)

    ######################################################################
    ### Initialization ###
    #####################
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
        return
    
    ######################################################################
    ### Computer Vision Functions ###
    ################################

    # Track visible faces
    def run(self):

        # Create a face cascade using the haarcascade data
        face_cascade = cv2.CascadeClassifier('./haarcascades classifier data/haarcascade_frontalface_default.xml')

        while (1 == 1):

            # Take an image
            xReSize = 320
            yReSize = 240
            self.camera.capture('./data/images/tempImage.jpg', resize=(xReSize, yReSize))

            # Read image file
            #img = cv2.imread('./data/faces/s1/1.pgm')
            img = cv2.imread('./data/images/tempImage.jpg')
            gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

            # Detect the faces
            faces = face_cascade.detectMultiScale(
                gray,
                1.3,
                5)

            xCenter = 0
            yCenter = 0
            xSum = 0
            ySum = 0
            wSum = 0
            hSum = 0
            numOfFaces = 0
            # Draw rectangles around faces
            for (x, y, w, h) in faces:
                cv2.rectangle(img, (x,y), (x+w,y+h), (255,0,0), 2)
                xSum += x
                ySum += y
                wSum += w
                hSum += h
                numOfFaces += 1

            if (numOfFaces > 0):

                xAverage = xSum/numOfFaces
                yAverage = ySum/numOfFaces
                wAverage = wSum/numOfFaces
                hAverage = hSum/numOfFaces

                xCenter = (xAverage + xAverage+wAverage)/2
                yCenter = (yAverage + yAverage+hAverage)/2

                cv2.imshow('Faces', img)

                zone = 20
                speed = 5
                currentAngle = 0
                if ((xCenter > xReSize/2 + zone) & (currentAngle < 180)):
                    print('right', xCenter, currentAngle)
                    currentAngle = self.c.botServoCurrentAngle
                    self.c.rotateBottomCameraServo(currentAngle + speed)
                if ((xCenter < xReSize/2 - zone)):
                    print('left', xCenter, currentAngle)
                    currentAngle = self.c.botServoCurrentAngle
                    self.c.rotateBottomCameraServo(currentAngle - speed)
                if ((yCenter > yReSize/2 + zone) & (currentAngle > 0)):
                    print('down', yCenter, currentAngle)
                    currentAngle = self.c.topServoCurrentAngle
                    self.c.rotateTopCameraServo(currentAngle - speed)
                if ((yCenter < yReSize/2 - zone) & (currentAngle < 180)):
                    print('up', yCenter, currentAngle)
                    currentAngle = self.c.topServoCurrentAngle
                    self.c.rotateTopCameraServo(currentAngle + speed)
                #print(x, y, w, h, xCenter, yCenter)
            else:
                cv2.imshow('Faces', img)

            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
            #cv2.destroyAllWindows()

        return

    ######################################################################
    ### Stop Functions ###
    #####################

    # Stop everything in this class.
    def stop(self):
        self.closeCamera()
        self.destroyAllWindows()
        return

    # Close the camera.
    def closeCamera(self):
        print("--- Closing Camera ---")
        self.camera.close()
        return

    # Destroy all cv2 windows
    def destroyAllWindows(self):
        cv2.destroyAllWindows()

### End of class ###
#print("Done")

##################################################################

