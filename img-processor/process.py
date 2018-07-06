import os
import cv2
import numpy as np
from time import time

# # Open the ideal image
# ideal = cv2.imread("ideal.png", cv2.IMREAD_GRAYSCALE)

# # Count the number of black pixels in the ideal image
# ideal_black = (640 * 480) - cv2.countNonZero(ideal)

# Go through all files in the sample directory
for filename in os.listdir("samples"):

	start = time()

	# Open the sample
	sample = cv2.imread("samples/" + filename, cv2.IMREAD_GRAYSCALE)

	# Threshold the sample
	ret, threshold = cv2.threshold(sample, 80, 255, cv2.THRESH_BINARY)

	# Count the number of black pixels in the sample image
	sample_black = (640 * 480) - cv2.countNonZero(threshold)

	# Print appropriate message
	message = "good"

	if sample_black > 307190:
		message = "too few stars"
	elif sample_black < 306950 and sample_black > 306850:
		message = "too many stars"
        elif sample_black <= 306850:
		message = "not a pure star field"

	total = time() - start

	print "\n" + filename + ": " + str(sample_black) + ", " + message 
	print "Time: " + str(total)
