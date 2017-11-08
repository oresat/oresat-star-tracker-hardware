import time
import cv2
from matplotlib import pyplot as plt #for displaying image
import matplotlib.animation as animation #for switching image

def show(params):

	img = cv2.imread(params.image,-1) #import as 3 channel color
	
	drawImg = img.copy() #copy of image to be draw on

	height, width, chan = img.shape #get image info
	
	print('Image Size = %s x %d' %(width,height))
	
	#plot window size options
	fig, ax = plt.subplots(figsize=(17, 12), dpi=100) #this allows tight layout, .figure doesn't
	fig.tight_layout() #tighter fit to plot window

	for i in range(len(params.coords)): #draw points on blank image
		cv2.circle(drawImg,(params.coords[i][0], params.coords[i][1]),4,(255,0,0),0)

	im = plt.imshow(img, animated=True) #show image, prep for animation

	def updateImg(*args): #function to call every frame update. arg is frame #
		if args[0] % 2: #check for even or odd, alternate between imgs
			im.set_array(drawImg) #set and return images
			return drawImg
		else:
			im.set_array(img)
			return img

	ani = animation.FuncAnimation(fig, updateImg, interval=1000) #animation function
	plt.show() #show plot

