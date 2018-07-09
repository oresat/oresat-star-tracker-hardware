import os
import cv2
import numpy as np
from time import time

# Function to process black/white pixel ratio
def test_samples():

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


# Function to test blur detection
def test_blur():

	# Go through all files in the samples directory
	for filename in os.listdir("samples"):

		start = time()

		# Open the sample
		sample = cv2.imread("samples/" + filename, cv2.IMREAD_GRAYSCALE)

		print "\n" + filename + ": " + str(cv2.Laplacian(sample, cv2.CV_64F).var())
		print "Time: " + str(time() - start)


# Control loop
response = "a"

while response != "q":

	response = raw_input("\nEnter 's' for sample test or 'b' for blur test: ")

	if response == "s":
		test_samples()
	elif response == "b":
		test_blur()

print "\n"