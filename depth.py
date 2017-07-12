#!/usr/bin/python3

import sys, os, serial
#from PyQt4 import QtCore, QtGui, uic
#from oct2py import octave

#checker = uic.loadUiType("Rechner.ui")[0]                  			# Uebergabe UI Main an Haupt (Name frei waehlbar)


#class MainWindow(QtGui.QMainWindow, checker):         			# Klasse mit Parametern (x,x,x)
#	def __init__(self, parent=None):              			# initialisiert Hauptfenster
#		super(MainWindow, self).__init__()  			# super def. Hauptfenster
#		QtGui.QMainWindow.__init__(self, parent)
#		self.setupUi(self)
#		self.radius.setFocus()# Diese Zeile formt passt den Fensterinhalt an die Vorgabe aus dem Qt an
#		self.radius.editingFinished.connect(self.Radius)
#		self.durchmesser.editingFinished.connect(self.Durchmesser)
#		self.hoehe.editingFinished.connect(self.Hoehe)
#		self.gewicht.editingFinished.connect(self.Gewicht)
#		self.tiefe.editingFinished.connect(self.Tiefe)
#		self.aenderung.editingFinished.connect(self.Aenderung)
#		self.aenderung.returnPressed.connect(self.retAenderung)
#		#QtCore.QTimer.singleShot(int(float(sys.argv[1])*1000),lambda: app.exit(a))
#
#	def Radius(self):
#	  self.durchmesser.setText(str(float(self.radius.text())*2))
#	  self.hoehe.setFocus()
#	  self.Calculation
#	
#	def Durchmesser(self):
#	  self.radius.setText(str(float(self.durchmesser.text())/2))
#	  #print(self.durchmesser.isModified())
#	  self.hoehe.setFocus()
#	  self.Calculation()
#	  
#	def Hoehe(self):
#	  #self.gewicht.setFocus()
#	  self.Calculation()
#	  
#	def Gewicht(self):
#	  #self.tiefe.setFocus()
#	  self.Calculation()
#	  glugglug = float(self.maxver.text())-float(self.gewicht.text())
#	  self.aenderung.setText(str(round(glugglug,3)))
#	  
#	def Tiefe(self):
#	  #self.aenderung.setFocus()
#	  if self.tiefe.isModified():
#	    r=float(self.radius.text())
#	    gew_ist=float(self.gewicht.text())
#	    h_soll=float(self.tiefe.text())
#	    V_soll=math.pi*r*r*h_soll
#	    gew_soll=V_soll/1000
#	    chg=gew_soll-gew_ist
#	    self.aenderung.setText(str(round(chg,3)))
#	  else:
#	    self.Calculation()
#	  
#	  
#	def Aenderung(self):
#	  self.Calculation()
#	  
#	def retAenderung(self):
#	  chg=float(self.aenderung.text())
#	  gew=float(self.gewicht.text())
#	  gew_neu=gew+chg
#	  self.gewicht.setText(str(round(gew_neu,3)))
#	  self.gewicht.setModified(True)
#	  #self.gewicht.setFocus()
#	    
#	def Calculation(self):
#	  #Bedingungen = (self.radius.isModified() or self.durchmesser.isModified()) and self.hoehe.isModified()
#	  #print(Bedingungen)
#	  
#	  if (self.radius.isModified() or self.durchmesser.isModified()) and self.hoehe.isModified():
#	    r=float(self.radius.text())
#	    h=float(self.hoehe.text())
#	    V=math.pi*r*r*h
#	    self.maxver.setText(str(round(V/1000,3)))
#	    if self.gewicht.isModified() or self.aenderung.isModified():
#	      gew=float(self.gewicht.text())
#	      #r=float(self.radius.text())
#	      h_neu=(gew*1000)/(math.pi*r*r)
#	      self.tiefe.setText(str(round(h_neu,3)))
#	    




if __name__ == "__main__":                            			# Programmstart
	#app = QtGui.QApplication(sys.argv)
	#rechner = MainWindow()                         			# Festlegung des Hauptfensters
	#rechner.show()                                   			# oeffnen des Hauptfensters
	ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=10)
	print(ser.name)
	ser.write(b'P')#\r\n')
	ser.flush()
	data = ser.read(100)
	ser.close()
	print(data)
	sys.exit()
