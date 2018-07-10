import os
import cv2
import numpy as np
from time import time

# Go through all files in the sample directory
for filename in os.listdir("samples"):

	start = time()

	# Open the sample
	sample = cv2.imread("samples/" + filename, cv2.IMREAD_GRAYSCALE)

	# Threshold the sample
	ret, threshold = cv2.threshold(sample, 80, 255, cv2.THRESH_BINARY)

	# Count the number of black pixels in the thresholded image
	threshold_black = (640 * 480) - cv2.countNonZero(threshold)

	# Get the appropriate message - check for blurriness in the original sample if too few stars are detected
	message = "good"

	if threshold_black > 307190:

		blur = cv2.Laplacian(sample, cv2.CV_64F).var()

		if blur != 0 and blur < 5:
			message = "too blurry"
		else:
			message = "too few stars"

	elif threshold_black < 306950 and threshold_black > 306850:
		message = "too many stars"
	elif threshold_black <= 306850:
		message = "not a pure star field"

	total = time() - start

	print "\n" + filename + ": " + message 
	print "Time: " + str(total)