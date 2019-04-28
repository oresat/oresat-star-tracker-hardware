# startracker.py - main front-end for the star tracker
# by Umair Khan, from the Portland State Aerospace Society
# based on OpenStarTracker from Andrew Tennenbaum at the University of Buffalo


# Imports
from time import time
import sys
import os
import cv2
import socket
import numpy as np
import beast


# Prepare constants and get system arguments
P_MATCH_THRESH = 0.99
CONFIGFILE = sys.argv[1]
YEAR = float(sys.argv[2])
MEDIAN_IMAGE = cv2.imread(sys.argv[3])
SOCKET_ADDR = "./ost_sock"
BUFFER_SIZE = 1024
data = ""
b_conf = [time(), beast.cvar.PIXSCALE, beast.cvar.BASE_FLUX]

# Prepare socket
s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)    
print "Socket created"
  
# Bind to the port 
s.bind(SOCKET_ADDR)         
print "Socket bound to %s" %(SOCKET_ADDR)

# Prepare star tracker
print "\nLoading config" 
beast.load_config(CONFIGFILE)

print "Loading hip_main.dat" 
S_DB = beast.star_db()
S_DB.load_catalog("hip_main.dat", YEAR)

print "Filtering stars" 
SQ_RESULTS = beast.star_query(S_DB)
SQ_RESULTS.kdmask_filter_catalog()
SQ_RESULTS.kdmask_uniform_density(beast.cvar.REQUIRED_STARS)
S_FILTERED = SQ_RESULTS.from_kdmask()

print "Generating DB" 
C_DB = beast.constellation_db(S_FILTERED, 2 + beast.cvar.DB_REDUNDANCY, 0)

print "Ready"


# Utility function to see if an image is worth solving
def check_image(img, connection):

	# Generate test parameters
	height, width, channels = img.shape
	total_pixels = height * width
	blur_check = int(total_pixels * 0.99996744)
	too_many_check = int(total_pixels * 0.99918619)

	# Convert and threshold the image
	img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
	ret, threshold = cv2.threshold(img, 80, 255, cv2.THRESH_BINARY)

	# Count the number of black pixels in the thresholded image
	threshold_black = total_pixels - cv2.countNonZero(threshold)

	# Check the test values and return appropriate value
	if threshold_black > blur_check:

		blur = cv2.Laplacian(img, cv2.CV_64F).var()

		if blur != 0 and blur < 5:
			connection.send("Image too blurry")
		else:
			connection.send("Too few stars in image")

		return 0

	elif threshold_black < too_many_check:
		connection.send("Image has too many stars or is not a pure star field")
		return 0

	return 1


# Solution function
def solve_image(filepath, connection):

	# Keep track of solution time
	starttime = time()

	# Create and initialize variables
	img_stars = beast.star_db()
	match = None
	fov_db = None

	# Start output for iteration
	connection.send(filepath)
	
	# Load the image
	img = cv2.imread(filepath)
	if type(img) == type(None):
		connection.send("\nInvalid filepath\n")
		return

	# Check the image to see if it is fit for processing
	result = check_image(img, connection)
	if result == 0:
		connection.send("\nTime: " + str(time() - starttime))
		return

	# Process the image for solving
	img = np.clip(img.astype(np.int16) - MEDIAN_IMAGE, a_min = 0, a_max = 255).astype(np.uint8)
	img_grey = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
	
	# Remove areas of the image that don't meet our brightness threshold and then extract contours
	ret, thresh = cv2.threshold(img_grey, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE, 255, cv2.THRESH_BINARY)
	thresh_contours, contours, hierarchy = cv2.findContours(thresh, 1, 2);

	# Process the contours
	for c in contours:

		M = cv2.moments(c)

		if M['m00'] > 0:

			# this is how the x and y position are defined by cv2
			cx = M['m10'] / M['m00']
			cy = M['m01'] / M['m00']

			# see https://alyssaq.github.io/2015/computing-the-axes-or-orientation-of-a-blob/ for how to convert these into eigenvectors/values
			u20 = M["m20"] / M["m00"] - cx ** 2
			u02 = M["m02"] / M["m00"] - cy ** 2
			u11 = M["m11"] / M["m00"] - cx * cy

			# The center pixel is used as the approximation of the brightest pixel
			img_stars += beast.star(cx - beast.cvar.IMG_X / 2.0, (cy - beast.cvar.IMG_Y / 2.0), float(cv2.getRectSubPix(img_grey, (1,1), (cx,cy))[0,0]), -1)

	# For the first pass, we only want to use the brightest MAX_FALSE_STARS + REQUIRED_STARS
	img_stars_n_brightest = img_stars.copy_n_brightest(beast.cvar.MAX_FALSE_STARS + beast.cvar.REQUIRED_STARS)
	img_const_n_brightest = beast.constellation_db(img_stars_n_brightest, beast.cvar.MAX_FALSE_STARS + 2, 1)
	lis = beast.db_match(C_DB, img_const_n_brightest)

	# Generate the match
	if lis.p_match > P_MATCH_THRESH and lis.winner.size() >= beast.cvar.REQUIRED_STARS:

		x = lis.winner.R11
		y = lis.winner.R21
		z = lis.winner.R31
		r = beast.cvar.MAXFOV / 2

		SQ_RESULTS.kdsearch(x, y, z, r, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)
		
		# estimate density for constellation generation
		C_DB.results.kdsearch(x, y, z, r,beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)
		fov_stars = SQ_RESULTS.from_kdresults()
		fov_db = beast.constellation_db(fov_stars, C_DB.results.r_size(), 1)
		C_DB.results.clear_kdresults()
		SQ_RESULTS.clear_kdresults()
		
		img_const = beast.constellation_db(img_stars, beast.cvar.MAX_FALSE_STARS + 2, 1)
		near = beast.db_match(fov_db, img_const)

		if near.p_match > P_MATCH_THRESH:
			match = near

	# Print solution
	if match is not None:

		match.winner.print_ori()

		# For reference:
		# - DEC         - rotation about the y-axis
		# - RA          - rotation about the z-axis
		# - ORIENTATION - rotation about the camera axis

	else:
		connection.send("\nImage could not be processed; no match found\n")

	# Calculate how long it took to process
	connection.send("\nTime: " + str(time() - starttime) + "\n")


# Put socket in istening mode 
s.listen(5)      
print "\nSocket is listening"   

# Listen for connections until broken
while True: 
	
	# Establish connection with client. 
	c, addr = s.accept()
	c.send("Received connection\n")  

	# Receive data w/ CYA policy
	try:
		data = c.recv(BUFFER_SIZE)
	except:
		c.send("An error occurred, closing link\n")

	# Remove stray whitespace
	data = data.strip()

	# Execute appropriate action
	if data == "quit":
		c.send("Shutting down OpenStarTracker, closing link...\n")
		c.close()
		break
	else:
		solve_image(data, c)
	
	c.close()

print "\n"