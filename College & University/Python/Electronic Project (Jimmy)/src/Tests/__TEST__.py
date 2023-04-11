#!/usr/bin/env python

import time
import sys

import pigpio

pi = pigpio.pi() # Connect to local Pi.
if not pi.connected:
   print("f")
   sys.exit()
   
pi.set_servo_pulsewidth(20, 500)
time.sleep(1)
pi.set_servo_pulsewidth(20, 1500)
time.sleep(1)
pi.set_servo_pulsewidth(20, 2500)
time.sleep(1)
pi.set_servo_pulsewidth(20, 1500)
time.sleep(1)

# switch servo off
pi.set_servo_pulsewidth(20, 0);

pi.stop()

import time
import picamera
with picamera.PiCamera() as camera:
    camera.start_preview()
    time.sleep(2)
    camera.capture_sequence([
        'image1.jpg',
        'image2.jpg',
        'image3.jpg',
        ])
    camera.stop_preview()
