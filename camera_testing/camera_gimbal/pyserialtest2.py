def move(gcode):
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


import serial
import time
ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=1
)
print(ser.name)         # check which port was really used
time.sleep(3) #wait for terminal to open
ser.write('$h\n')     # write a string
time.sleep(6) #wait for machine to home
#ser.write('g91\n') 
time.sleep(.5) #wait for machine to home
ser.flush()
#ser.write(b'g0 x90 y90\n') 
ser.flushInput()

move("g0 x90 y90")
move("g0 x0 y0")

def move(gcode):
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
	

