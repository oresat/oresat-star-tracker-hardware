import os
import cv2
import numpy as np

# Open the ideal image
ideal = cv2.imread("ideal.png", cv2.IMREAD_GRAYSCALE)

# Count the number of black pixels in the ideal image
ideal_black = (640 * 480) - cv2.countNonZero(ideal)

# Go through all files in the sample directory
for filename in os.listdir("samples"):

	# Open the sample
	sample = cv2.imread("samples/" + filename, cv2.IMREAD_GRAYSCALE)

	# Threshold the sample
	ret, threshold = cv2.threshold(sample, 80, 255, cv2.THRESH_BINARY)

	# Count the number of black pixels in the sample image
	sample_black = (640 * 480) - cv2.countNonZero(threshold)

	# Calculate the percent difference
	diff = (sample_black - ideal_black) / float(ideal_black)

	# Print results
	print filename
	print "\n\tIdeal : " + str(ideal_black)
	print "\tSample: " + str(sample_black)
	print "\tDiff  : " + str(diff) + "\n"
