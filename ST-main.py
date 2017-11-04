import findStars
import showStars
import cv2


class starFindArgs: #current params for star finding
	image = 'test_images/stars2.jpg'
	threshLower = 80
	gKernel = 3
	
e1 = cv2.getTickCount() #for finding execution time

starCoords = findStars.find(starFindArgs) #run star finder, returns star coords

e2 = cv2.getTickCount() #for finding execution time

time = (e2 - e1)/ cv2.getTickFrequency() #for finding execution time

print('starFind time = %ss' % str(time))

print('Stars Found = %s' %len(starCoords))

class displayArgs: #params for display
	image = starFindArgs.image
	coords = starCoords
	
showStars.show(displayArgs)
