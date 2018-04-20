from PIL import Image
from datetime import datetime
from time import sleep
import select
import v4l2capture
import serial
import math


ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=1
)
# Open the video device
video = v4l2capture.Video_device("/dev/video0")

# Get the size of the image (suggesting one, just in case)
size_x, size_y = video.set_format(1280, 1024)

# Initialize buffers
video.create_buffers(1)
video.queue_all_buffers()

# Enable manual exposure control
video.set_exposure_auto(1)

def move(gcode, wait): # gcode, wait: 1 = wait for movement to finish
        ser.write(gcode + '\n')     # write a location
        sleep(.3) #wait for command to register
        ser.flushInput() #flush input buffer
	if(wait == 1):
        	moving = True #set moving to true
        	while (moving):
                	sleep(.1) #wait 
                	ser.write('?') #write '?' to get status update
                	line = ser.readline().strip('<') #read in info string and remove < from beginning
                	#print(line[0])
                	if (line[0] == 'I'): #first character is the first letter of the status. Check if 'Idle'
                        	moving = False #when Idle, exit loop
                	ser.flushInput() #flush serial buffer
                	line = '' #clear line var

def home():
	print(ser.name)         # check which port was really used
	sleep(3) #wait for terminal to open
	ser.write('$h\n')     # write a string
	sleep(6) #wait for machine to home 
	ser.flushInput()



# Capture a single image
def captureImage(rate):

	# Get the image data
	video.start()
	select.select((video,), (), ())
	image_data = video.read_and_queue()

	# Create and save the image
	image = Image.frombytes("RGB", (size_x, size_y), image_data)
	imageName = str(video.get_exposure_absolute()) + "exp " + str(datetime.now())[5:-5] + "rate" + str(rate) + ".bmp"
	imageName = imageName.replace(":", "-")
	image.save("./images/" + imageName)

# Set the exposure of the camera
def setExposure():
	
	expRaw = video.get_exposure_absolute()
	print "The current exposure is " + str(expRaw) + "."

	newExposure = int(raw_input("Enter the desired raw exposure: "))
 	video.set_exposure_absolute(newExposure) 

	expRaw = video.get_exposure_absolute()
	print "The new exposure is " + str(expRaw) + "."

# Capture a burst of images based on a time delay
def burst_time(delay, numImages):

	# Get parameters
	#numImages = int(raw_input("Enter the number of images to take: "))
	#delay = float(raw_input("Enter the delay (in seconds): "))

	# Capture burst
	for i in range(0, numImages):
		captureImage()
		sleep(delay)

# Capture a burst of images with differing exposures
def burst_exp():

	# Get the current exposure
	currentExposure = video.get_exposure_absolute()

	# Define the exposures
	exposures = [1, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000]

	# Capture the images
	for i in exposures:
		print "Capturing an image with exposure " + str(video.set_exposure_absolute(i))
		captureImage()

	# Reset the exposure to its previous value
	video.set_exposure_absolute(currentExposure)

# Print all available commands
def help():
	
	print "p - capture a single image"
	print "e - manually set the exposure of the camera"
	print "b - take a burst of photos with a specified delay between each"
	print "v - take a burst of photos with varying exposures"
	print "q - quit the program"
	print "m - move"
	print "t - test"


def run():
	
	#test(rate, exp, imgs, xstart, ystart, xend, yend)		
	#startExp = 250
	
	startExp = 3750
	endExp = 5000
	startRate = 360
	endRate = 1800
	xstart = 0
	xend = 0
	ystart = 0
	yend = 45
	numPics = 5 #this currently controls nothing, pictures are taken every 10 degrees of movement
	expStep = 250 #250 = exposure step of .025 seconds
	rateStep = 180 #180 degrees per step = .5 RPM per step
	home()

	for exp in range(startExp, endExp, expStep):
		for rate in range(startRate, endRate, rateStep):
			test(rate, exp, numPics, xstart, ystart, xend, yend) #loop through settings

def test(rate, exp, imgs, xstart, ystart, xend, yend):
	
	print("Rate: " + str(rate))
	print("Exposure: " + str(exp))	
	#print("")
	
	video.set_exposure_absolute(exp) 
	
	degperpic = 10
	#dist = math.sqrt(((xend-xstart)^2) + ((yend-ystart)^2)) #pythagoras that shit 
	
	#(degrees per pic / degrees per second) - (exposure time uS > S) = seconds between pics 
	buf = (float(degperpic) / (float(rate)/float(60))) - (float(exp) / float(10000)) 
	
	if (buf < .02):
		buf = .02
	print(str(buf))
	print("")

	
	#home()

	move("g0 x" + str(xstart) + " y" + str(ystart), 1) #go to start location

	#start movement
        ser.write("g01 x" + str(xend) + " y" + str(yend) + " f" + str(rate) + '\n')     # write a location
        sleep(.3) #wait for command to register
        ser.flushInput() #flush input buffer
 
	moving = True #set moving to true
        while (moving):
		
		captureImage(rate)
		#print(buf)
		sleep(buf)
	
                ser.write('?') #write '?' to get status update
                line = ser.readline().strip('<') #read in info string and remove < from beginning
                
		if (line[0] == 'I'): #first character is the first letter of the status. Check if 'Idle'
                        moving = False #when Idle, exit loop
                ser.flushInput() #flush serial buffer
                line = '' #clear line var



# Prompt the user for a command in a loop
response = raw_input("Enter command (use h for help): ")

while response != "q":

	if response == "p":
		captureImage(0)
		print "Saved image."
	elif response == "e":
		setExposure()
	elif response == "b":
		burst_time()
		print "Finished time burst."
	elif response == "v":
		burst_exp()
		print "Finished exposure burst."
	elif response == "h":
		help()
	elif response == "m":
		move("g0 x90 f720", 0)
	elif response == "c":
		home()
	elif response == "t":
		run()


	response = raw_input("\nEnter command: ")


# Disconnect from the camera when exiting
video.close()
