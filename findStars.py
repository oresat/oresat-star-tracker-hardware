import time
import cv2
import numpy as np;

def find(params):
	
	img = cv2.imread(params.image,0) #import as 3 channel color

	#blur = cv2.medianBlur(newImg,3)
	blur = cv2.GaussianBlur(img, (params.gKernel, params.gKernel), 0)

	_, thresh = cv2.threshold(blur, params.threshLower, 255, cv2.THRESH_BINARY)#apply thresh

	edges = cv2.Canny(thresh,100,200)#find canny edges

	_, contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)#find contours

	coords = [] #array to hold star point coords

	for i in range(len(contours)): #get coords from moments info
		M = cv2.moments(contours[i])
		if M['m00'] == 0: #check if m00 (convex area) is zero
			M['m00'] = 1
		x = int(M['m10']/M['m00']) #x coor
		y = int(M['m01']/M['m00']) #y coor
		coords.append([]) #append an array to centers
		coords[i] = [x,y] # save x and y to index 0 and 1

	#everything after here is just for viewing and debug

	return coords


