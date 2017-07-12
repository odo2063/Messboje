#!/usr/bin/python3

import sys, glob, os, time
#from PyQt4 import QtCore, QtGui, uic
import CHIP_IO.GPIO as GPIO 
#from oct2py import octave

GPIO.setup("XIO-P6", GPIO.OUT, initial=0)
#
if __name__ == "__main__":                            			# Programmstart
	GPIO.output("XIO-P6",GPIO.HIGH)
	time.sleep(200)
	os.system('wget http://ADMIN:1111@192.168.0.3/Datalog?SID=1 -O /home/chip/boje/datalog')
	GPIO.output("XIO-P6",GPIO.LOW)
	os.system('iconv -f utf-16 -t utf-8 /home/chip/boje/datalog -o /home/chip/boje/datalog8')
	GPIO.cleanup()
	sys.exit()

