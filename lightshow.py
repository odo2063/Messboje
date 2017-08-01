#!/usr/bin/python3

import sys, os, math, time
import CHIP_IO.SOFTPWM as PWM 

i=0
tsleep=0.05
ttotal=5
PWM.start("XIO-P4", 50, 100, 0)

def MachAnders(x):
	#print(x)
	PWM.set_duty_cycle("XIO-P4", x/4)


if __name__ == "__main__":					# Programmstart
	try:
		while True:
			i=i+1
			x=ttotal/tsleep
			x=((math.sin(2*math.pi*i/x)+1)/2)*100
			if x==0:
				x=0.01
			#print(x)
			MachAnders(x)
			if i>(ttotal/tsleep):
				i=0
			time.sleep(tsleep)
 
        # Beim Abbruch durch STRG+C resetten
	except KeyboardInterrupt:
		print("Lightshow vom User gestoppt")
		#PWM.stop()
		PWM.cleanup()
