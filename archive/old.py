import time
import cv2
import numpy as np;
from matplotlib import pyplot as plt #for displaying image
import matplotlib.animation as animation #for switching image
e1 = cv2.getTickCount() #for finding execution time
image = 'test_images/stars2.jpg'

img = cv2.imread(image,-1) #import as 3 channel color

newImg = img.copy() #NEED to change color space to greyscale
drawImg = img.copy()
compImg = img.copy()

cv2.getTickCount() #for finding execution time

#blur = cv2.medianBlur(newImg,3)
blur3 = cv2.GaussianBlur(newImg,(3,3),0)
#blur3 = newimg
_, thresh = cv2.threshold(blur3,90,255,cv2.THRESH_BINARY)#apply thresh

edges = cv2.Canny(thresh,100,200)#find canny edges

_, contours, _ = cv2.findContours(edges,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_NONE)#find contours

centers = []

for i in range(len(contours)):
	M = cv2.moments(contours[i])
	if M['m00'] == 0: #check if m00 (convex area) is zero
		M['m00'] = 1
	x = int(M['m10']/M['m00']) #x coor
	y = int(M['m01']/M['m00']) #y coor

	centers.append([]) #append an array to centers
	centers[i] = [x,y] # save x and y to index 0 and 1

#everything after here is just for viewing and debug
e2 = cv2.getTickCount() #for finding execution time
time = (e2 - e1)/ cv2.getTickFrequency()
height, width, chan = compImg.shape
print('Image Size = %s x %d' %(width,height))
print('Stars Found = %s' %len(centers))
print('execution time = %s' % str(time))

#plot window size options
fig, ax = plt.subplots(num=None, figsize=(21, 12), dpi=100, facecolor='w', edgecolor='k')
fig.tight_layout()

'''
tempImg = compImg

for i in range(len(centers)): #draw points on blank image
	starPoints = cv2.circle(tempImg,(centers[i][0],centers[i][1]),4,(255,0,0),0)
'''

for i in range(len(centers)): #draw points on blank image
	starPoints = cv2.circle(drawImg,(centers[i][0],centers[i][1]),4,(255,0,0),0)

im = plt.imshow(compImg, animated=True) #show image, prep for animation

def updateImg(*args): #function to call every frame update. arg is frame #
	if args[0] % 2: #check for even or odd, alternate between imgs
		im.set_array(starPoints)
		return starPoints
	else:
		im.set_array(compImg)
		return compImg

ani = animation.FuncAnimation(fig, updateImg, interval=1000) #animation function
plt.show() #show plot


