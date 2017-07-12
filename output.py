#!/usr/bin/python3

import sys, glob, os#, math
from PyQt4 import QtCore, QtGui, uic
import CHIP_IO.GPIO as GPIO 
#from oct2py import octave

main = uic.loadUiType("output.ui")[0]                  			# Uebergabe UI Main an Haupt (Name frei waehlbar)


class MainWindow(QtGui.QMainWindow, main):         			# Klasse mit Parametern (x,x,x)
	def __init__(self, parent=None):              			# initialisiert Hauptfenster
		super(MainWindow, self).__init__()  			# super def. Hauptfenster
		QtGui.QMainWindow.__init__(self, parent)
		self.setupUi(self)
		GPIO.setup("XIO-P0", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P1", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P2", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P3", GPIO.OUT, initial=0)
##		GPIO.setup("XIO-P4", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P5", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P6", GPIO.OUT, initial=0)
		GPIO.setup("XIO-P7", GPIO.OUT, initial=0)
		self.xio_0.stateChanged.connect(self.xio0_on)
		#self.xio_0.released.connect(self.xio0_off)
		self.xio_1.stateChanged.connect(self.xio1_on)
		#self.xio_1.released.connect(self.xio1_off)
		self.xio_2.stateChanged.connect(self.xio2_on)
		#self.xio_2.released.connect(self.xio2_off)
		self.xio_3.stateChanged.connect(self.xio3_on)
		#self.xio_3.released.connect(self.xio3_off)
##		self.xio_4.stateChanged.connect(self.xio4_on)
		#self.xio_4.released.connect(self.xio4_off)
		self.xio_5.stateChanged.connect(self.xio5_on)
		#self.xio_5.released.connect(self.xio5_off)
		self.xio_6.stateChanged.connect(self.xio6_on)
		#self.xio_6.released.connect(self.xio6_off)
		self.xio_7.stateChanged.connect(self.xio7_on)
		#self.xio_7.released.connect(self.xio7_off)
		self.EXIT.clicked.connect(self.do_exit)
		
	def do_exit(self):
	  GPIO.cleanup()
	  sys.exit()
	  
	
	def xio0_on(self):
	  if self.xio_0.isChecked():
	    GPIO.output("XIO-P0",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P0",GPIO.LOW)
#	def xio0_off(self):
#	  GPIO.output("XIO-P0",GPIO.LOW)
	
	def xio1_on(self):
	  if self.xio_1.isChecked():
	    GPIO.output("XIO-P1",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P1",GPIO.LOW)
#	def xio1_off(self):
#	  GPIO.output("XIO-P1",GPIO.LOW)

	def xio2_on(self):
	  if self.xio_2.isChecked():
	    GPIO.output("XIO-P2",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P2",GPIO.LOW)
#	def xio2_off(self):
#	  GPIO.output("XIO-P2",GPIO.LOW)

	def xio3_on(self):
	  if self.xio_3.isChecked():
	    GPIO.output("XIO-P3",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P3",GPIO.LOW)
#	def xio3_off(self):
#	  GPIO.output("XIO-P3",GPIO.LOW)

	def xio4_on(self):
	  if self.xio_4.isChecked():
	    GPIO.output("XIO-P4",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P4",GPIO.LOW)
#	def xio4_off(self):
#	  GPIO.output("XIO-P4",GPIO.LOW)

	def xio5_on(self):
	  if self.xio_5.isChecked():
	    GPIO.output("XIO-P5",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P5",GPIO.LOW)
#	def xio5_off(self):
#	  GPIO.output("XIO-P5",GPIO.LOW)

	def xio6_on(self):
	  if self.xio_6.isChecked():
	    GPIO.output("XIO-P6",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P6",GPIO.LOW)
#	def xio6_off(self):
#	  GPIO.output("XIO-P6",GPIO.LOW)

	def xio7_on(self):
	  if self.xio_7.isChecked():
	    GPIO.output("XIO-P7",GPIO.HIGH)
	  else:
	    GPIO.output("XIO-P7",GPIO.LOW)
#	def xio7_off(self):
#	  GPIO.output("XIO-P7",GPIO.LOW)


if __name__ == "__main__":                            			# Programmstart
	
	    app = QtGui.QApplication(sys.argv)
	    output = MainWindow()# Festlegung des Hauptfensters
	    output.show()
	    sys.exit(app.exec_())

