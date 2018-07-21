from PIL import Image
from datetime import datetime
from time import sleep
import select
import v4l2capture
import subprocess


# Open the video device
video = v4l2capture.Video_device("/dev/video0")

# Get the size of the image (suggesting one, just in case)
size_x, size_y = video.set_format(1280, 1024)

# Initialize buffers
video.create_buffers(1)
video.queue_all_buffers()

# Enable manual exposure control
video.set_exposure_auto(1)



# Capture a single image
def captureImage():

	# Get the image data
	video.start()
	select.select((video,), (), ())
	image_data = video.read_and_queue()

	# Create and save the image
	image = Image.frombytes("RGB", (size_x, size_y), image_data)
	imageName = str(video.get_exposure_absolute()) + "exp " + str(datetime.now())[5:-5] + ".bmp"
	imageName = imageName.replace(":", "-")
	image.save(imageName)

# Set the exposure of the camera
def setExposure():
	
	expRaw = video.get_exposure_absolute()
	print "The current exposure is " + str(expRaw) + "."

	newExposure = int(raw_input("Enter the desired raw exposure: "))
 	video.set_exposure_absolute(newExposure) 

	expRaw = video.get_exposure_absolute()
	print "The new exposure is " + str(expRaw) + "."

# Set the gain of the camera
def setGain():

	newGain = raw_input("Enter the desired gain: ")

	while int(newGain) < 0 or int(newGain) > 100:
		newGain = raw_input("That was invalid. Try again: ")

	subprocess.call("v4l2-ctl --set-ctrl=gain=" + newGain, shell=True)
	print "Set the gain."

# Capture a burst of images based on a time delay
def burst_time():

	# Get parameters
	numImages = int(raw_input("Enter the number of images to take: "))
	delay = float(raw_input("Enter the delay (in seconds): "))

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
	print "t - take a burst of photos with a specified delay between each"
	print "v - take a burst of photos with varying exposures"
	print "q - quit the program"


# Prompt the user for a command in a loop
response = raw_input("Enter command (use h for help): ")

while response != "q":

	if response == "p":
		captureImage()
		print "Saved image."
	elif response == "e":
		setExposure()
	elif response == "g":
		setGain()
	elif response == "t":
		burst_time()
		print "Finished time burst."
	elif response == "v":
		burst_exp()
		print "Finished exposure burst."
	elif response == "h":
		help()
	response = raw_input("\nEnter command: ")


# Disconnect from the camera when exiting
video.close()
