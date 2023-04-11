
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

from imutils.video import VideoStream
import datetime
import argparse
import imutils

import numpy as np
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
    print("computerVision.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is OK.")
    #import picamera

else:

    # Prompt an UNSUPPORTED messge and exit this program if not compatible.
    # Exit this program.
    print("computerVision.py: This OS platform \"" + CURRENT_OPERATING_SYSTEM + "\" is not supported.")
    sys.exit()

##################################################################
class computerVision(object):

    c = robotController.robotController()   # Create a robot controller class as 'c'.

    ### Constants ###
    UP      = 1
    DOWN    = -1
    LEFT    = -1
    RIGHT   = 1

    ### Variables ###
    xCenter = 0
    yCenter = 0
    xSum = 0
    ySum = 0
    wSum = 0
    hSum = 0
    numOfObjects = 0
    tracking = False
    frame = None

    ### Camera Setup ###
    # construct the argument parse and parse the arguments
    ap = argparse.ArgumentParser()
    ap.add_argument("-p", "--picamera", type=int, default=-1,
        help="whether or not the Raspberry Pi camera should be used")
    args = vars(ap.parse_args())

    # initialize the video stream and allow the cammera sensor to warmup
    vs = VideoStream(usePiCamera=args["picamera"] > 0, framerate = 144)

    xSize = 320
    ySize = 240

    #camera = picamera.PiCamera()
    #camera.rotation = 180
    #camera.resolution = (640, 480)

    ######################################################################
    ### Initialization ###
    #####################
    def __init__(self):
        # initialize the video stream and allow the cammera sensor to warmup
        self.vs.start()
        return

    ######################################################################
    ### Computer Vision Functions ###
    ################################

    ######################################################################
    # Track visible objects
    def followObject(self, cascade):

        time.sleep(0.001)
        #print("TEST")

        if (self.frame == None):
            #print("TEST")
            raise Exception()
        else:
            pass

        # Create a face cascade using the haarcascade data
        for e in cascade:

            # Read image file
            gray = cv2.cvtColor(self.frame, cv2.COLOR_BGR2GRAY)

            # Detect the objects
            objects = e.detectMultiScale(
                gray,
                1.3,
                5)

            self.xCenter = 0
            self.yCenter = 0
            self.xSum = 0
            self.ySum = 0
            self.wSum = 0
            self.hSum = 0
            self.numOfObjects = 0

            # Draw rectangles around objects
            for (x, y, w, h) in objects:
                cv2.rectangle(self.frame, (x,y), (x+w,y+h), (255,0,0), 2)
                self.xSum += x
                self.ySum += y
                self.wSum += w
                self.hSum += h
                self.numOfObjects += 1

            # Run a new thread to center the camera servos on the object.
            threads = []
            tSC = threading.Thread(target=self.followObject_ServoController)
            threads.append(tSC)
            tSC.start()

            #print(x, y, w, h, self.xCenter, self.yCenter)
        return

    # Separate Thread for calculating the camera's servo movements
    def followObject_ServoController(self):

        if (self.numOfObjects > 0):

            xAverage = self.xSum/self.numOfObjects
            yAverage = self.ySum/self.numOfObjects
            wAverage = self.wSum/self.numOfObjects
            hAverage = self.hSum/self.numOfObjects

            self.xCenter = (xAverage + xAverage+wAverage)/2
            self.yCenter = (yAverage + yAverage+hAverage)/2
            # Rotate Camera towards face
            zone = 10
            speed = 1
            currentAngle = 0
            k = 12                #Constant for pixel division
            if ((self.xCenter > self.xSize/2 + zone) & (currentAngle < 180)):
                #print('right', xCenter, currentAngle)
                currentAngle = self.c.botServoCurrentAngle
                self.c.rotateBottomCameraServo(currentAngle + speed
                    + (int)(abs((self.xSize/2 - self.xCenter)/(self.xSize/k))))
            if ((self.xCenter < self.xSize/2 - zone)):
                #print('left', xCenter, currentAngle)
                currentAngle = self.c.botServoCurrentAngle
                self.c.rotateBottomCameraServo(currentAngle - speed
                    - (int)(abs((self.xSize/2 - self.xCenter)/(self.xSize/k))))
            if ((self.yCenter > self.ySize/2 + zone) & (currentAngle > 0)):
                #print('down', yCenter, currentAngle)
                currentAngle = self.c.topServoCurrentAngle
                self.c.rotateTopCameraServo(currentAngle - speed
                    - (int)(abs((self.ySize/2 - self.yCenter)/(self.ySize/k))))
            if ((self.yCenter < self.ySize/2 - zone) & (currentAngle < 180)):
                #print('up', yCenter, currentAngle)
                currentAngle = self.c.topServoCurrentAngle
                self.c.rotateTopCameraServo(currentAngle + speed
                    + (int)(abs((self.ySize/2 - self.yCenter)/(self.ySize/k))))

        else:
            pass

        return

    ######################################################################
    # Track an object
    def trackObject(self, cascade, tracking=True):
        try:
            print("\n\nAttempting to track/follow Object."
                + "\n(Press Q to quit current program)")
            #time.sleep(1.0)

            # loop over the frames from the video stream
            while (True):
                # grab the frame from the threaded video stream and resize it
                # to have a maximum width of 400 pixels
                self.frame = self.vs.read()
                self.frame = imutils.resize(self.frame, width=self.xSize, height=self.ySize)
                self.frame = imutils.rotate(self.frame, 180)

                threads = []
                t1 = threading.Thread(target=self.followObject(cascade=cascade))
                threads.append(t1)
                t1.start()

                # draw the timestamp on the frame
                timestamp = datetime.datetime.now()
                ts = timestamp.strftime("%A %d %B %Y %I:%M:%S%p")
                cv2.putText(self.frame, ts, (10, self.frame.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX,
                    0.35, (0, 0, 255), 1)

                # show the frame
                cv2.imshow("Frame", self.frame)
                key = cv2.waitKey(1) & 0xFF

                # if the `q` key was pressed, break from the loop
                if key == ord("q"):
                    break
        finally:
            # do a bit of cleanup
            self.c.resetServos()
            cv2.destroyAllWindows()
            self.tracking = False

        return

    def lineFollower(self):
        try:
            print("\n\nAttempting to follow a line. (Press Q to quit)")
            #time.sleep(1.0)
            self.c.stopMotors()
            self.c.rotateBottomCameraServo(90)
            self.c.rotateTopCameraServo(120)

            # loop over the frames from the video stream
            while True:
                # grab the frame from the threaded video stream and resize it
                # to have a maximum width of 400 pixels
                self.frame = self.vs.read()
                self.frame = imutils.resize(self.frame, width=self.xSize, height=self.ySize)
                self.frame = imutils.rotate(self.frame, 180)

                gray = cv2.cvtColor(self.frame,cv2.COLOR_BGR2GRAY)
                edges = cv2.Canny(gray,30,150,apertureSize = 3)
                lines = cv2.HoughLinesP(edges,1,np.pi/180,40,minLineLength=0,maxLineGap=10)

                self.xSum = self.xSize/2
                self.numOfObjects = 0
                if lines != None:
                    for line in lines:
                        x1,y1,x2,y2 = line[0]
                        k = 4
                        if (x1 > k and y1 > k and x2 > k and y2 > k):
                            cv2.line(self.frame,(x1,y1),(x2,y2),(0,255,0),2)
                        self.xSum += (x2 + x1)/2
                        self.numOfObjects += 1
                    self.lineFollower_MotorController()


                # draw the timestamp on the frame
                timestamp = datetime.datetime.now()
                ts = timestamp.strftime("%A %d %B %Y %I:%M:%S%p")
                cv2.putText(self.frame, ts, (10, self.frame.shape[0] - 10), cv2.FONT_HERSHEY_SIMPLEX,
                    0.35, (0, 0, 255), 1)

                # show the frame
                cv2.imshow("Frame Edges", edges)
                cv2.imshow("Frame", self.frame)
                key = cv2.waitKey(1) & 0xFF

                # if the `q` key was pressed, break from the loop
                if key == ord("q"):
                    break
        finally:
            # do a bit of cleanup
            self.c.stopMotors()
            self.c.resetServos()
            cv2.destroyAllWindows()
            self.tracking = False

        return

    def lineFollower_MotorController(self):

        if (self.numOfObjects > 0):

            xAverage = self.xSum/self.numOfObjects
            wAverage = 0
            self.xCenter = (xAverage + xAverage+wAverage)/2

            # Rotate motor
            zone = 40
            if ((self.xCenter > self.xSize/2 + zone)):
                print('right', self.xCenter, self.xSize/2)
                self.c.rotateRight()

            elif ((self.xCenter < self.xSize/2 - zone)):
                print('left', self.xCenter, self.xSize/2)
                self.c.rotateLeft()

            else:
                print('forward', self.xCenter, self.xSize/2)
                self.c.driveForward()

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
        #self.camera.close()
        self.vs.stop()
        return

    # Destroy all cv2 windows
    def destroyAllWindows(self):
        cv2.destroyAllWindows()

### End of class ###
#print("Done")

##################################################################

