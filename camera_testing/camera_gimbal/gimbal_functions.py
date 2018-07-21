import serial
import time

def move(gcode, ser):
	ser.write(gcode + '\n')     # write a location
	time.sleep(.3) #wait for command to register
	ser.flushInput() #flush input buffer
	moving = True #set moving to true
	while (moving): 
		time.sleep(.1) #wait 
		ser.write('?') #write '?' to get status update

		line = ser.readline().strip('<') #read in info string and remove < from beginning
		#print(line[0])
		if (line[0] == 'I'): #first character is the first letter of the status. Check if 'Idle'
			moving = False #when Idle, exit loop
		ser.flushInput() #flush serial buffer
		line = '' #clear line var
