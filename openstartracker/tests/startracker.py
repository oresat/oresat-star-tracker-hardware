# startracker.py - main front-end for the star tracker
# by Umair Khan, from the Portland State Aerospace Society
# based on OpenStarTracker from Andrew Tennenbaum at the University of Buffalo


# Imports
from time import time
import sys
import os
import cv2
import numpy as np
import beast


# Prepare constants and get system arguments
P_MATCH_THRESH = 0.99
CONFIGFILE = sys.argv[1]
YEAR = float(sys.argv[2])
MEDIAN_IMAGE = cv2.imread(sys.argv[3])
SAMPLE_DIR = CONFIGFILE.split('/')[0] + "/samples"
b_conf = [time(), beast.cvar.PIXSCALE, beast.cvar.BASE_FLUX]


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


# Process each image in the samples directory
for image in os.listdir(SAMPLE_DIR):

	# Keep track of solution time
	starttime = time()

	# Create and initialize variables
	filename = SAMPLE_DIR + "/" + image
	img_stars = beast.star_db()
	match = None
	fov_db = None
	
	# Load and process the image
	img = cv2.imread(filename)
	img = np.clip(img.astype(np.int16) - MEDIAN_IMAGE, a_min = 0, a_max = 255).astype(np.uint8)
	img_grey = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
	
	# Remove areas of the image that don't meet our brightness threshold and then extract contours
	ret, thresh = cv2.threshold(img_grey, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE, 255, cv2.THRESH_BINARY)
	contours, hierarchy = cv2.findContours(thresh, 1, 2);

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

	# Print results
	print "\n\n" + filename

	if match is not None:

		match.winner.print_ori()

		# For reference:
		# - DEC         - rotation about the y-axis
		# - RA          - rotation about the z-axis
		# - ORIENTATION - rotation about the camera axis

	else:
		print "Image could not be processed; no match found"

	# Calculate how long it took to process
	print "\nTime: " + str(time() - starttime)

print "\n"