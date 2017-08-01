#!/usr/bin/python3

import sys, os, serial, time


if __name__ == "__main__":
	ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=5)
	print(ser.name)
	#ser.flush()
	time.sleep(4)
	ser.write(b'TP')
	#ser.flush()
	data = ser.read(30)
	ser.flush()
	ser.close()
	print(data)
	sys.exit()
