from os import listdir, system, environ
from os.path import isfile, join
import cv2
import numpy as np
import sys
from astropy.io import fits
from scipy import spatial
import cPickle as pickle

# Exposure time
try: EXPOSURE_TIME = float(environ['EXPOSURE_TIME'])
except KeyError: EXPOSURE_TIME = 0.03 # s

# Aperture
try: APERTURE = float(environ['APERTURE'])
except KeyError: APERTURE = 60.7 # mm

# Pixels of separation needed to distinguish stars from each other
try: DOUBLE_STAR_PX = float(environ['DOUBLE_STAR_PX'])
except KeyError: DOUBLE_STAR_PX = 3.5

# Check all constellations which fall inside these bounds
# (increasing this can reduce the probability of finding a match, since the true match has to stand out against a larger crowd)
try: POS_ERR_SIGMA = float(environ['POS_ERR_SIGMA'])
except KeyError: POS_ERR_SIGMA = 2

# Maximum number of objects that can be brighter than the two brightest stars
# (multiplies runtime by (N+2)^2)
try: MAX_FALSE_STARS = int(environ['MAX_FALSE_STARS'])
except KeyError: MAX_FALSE_STARS = 2 

# Of the brightest DB_REDUNDANCY + 2 stars, we need at least 2
# (multiplies runtime by (N+2)^2)
try: DB_REDUNDANCY = int(environ['DB_REDUNDANCY'])
except KeyError: DB_REDUNDANCY = 1

# How many stars should be tried to match
# (multiplies runtime by (N+2)^2)
# (for ultrawide fov this may be set to 3 for faster matching)
# (for ultranarrow fov, it may be necessary to set this to 5)
try: REQUIRED_STARS = int(environ['REQUIRED_STARS'])
except KeyError: REQUIRED_STARS = 5 


# Utility function
def angles2xyz(ra, dec):
	x = np.cos(np.radians(ra)) * np.cos(np.radians(dec))
	y = np.sin(np.radians(ra)) * np.cos(np.radians(dec))
	z = np.sin(np.radians(dec))
	return list((x, y, z))

# load the star catalog, converting from id, ra, dec to x, y, z, id
def getstardb(year = 1991.25, filename = "hip_main.dat"):

	yeardiff = year - 1991.25
	stardb = {}
	starfile = open(filename)

	for line in starfile.readlines():

		fields =line.split('|')

		try:
			HIP_ID = int(fields[1]);
			MAG = float(fields[5]);
			DEC = yeardiff * float(fields[13]) / 3600000.0 + float(fields[9]);
			cosdec = np.cos(np.pi * DEC / 180.0);
			RA = yeardiff * float(fields[12]) / (cosdec * 3600000.0) + float(fields[8]);
			X = np.cos(np.pi * RA / 180.0) * cosdec;
			Y = np.sin(np.pi * RA / 180.0) * cosdec;
			Z = np.sin(np.pi * DEC / 180.0);
		except ValueError:
			continue

		try:
			f6 = int(fields[6])
		except ValueError:
			f6 = 0

		if (int(fields[29]) == 0 or int(fields[29]) == 1) and f6 != 3:
			UNRELIABLE = 0
		else:
			UNRELIABLE=1

		stardb[HIP_ID] = [HIP_ID, MAG, DEC, RA, X, Y, Z, UNRELIABLE]

	return stardb

# Utility function
def basename(filename):
	if "." in filename:
		filename = ".".join(filename.split(".")[0:-1])
	return filename

# only do this part if we were run as a python script
if __name__ == '__main__':

	# Get images and generate median image
	samplepath = sys.argv[1] + "/samples"
	image_names = [ f for f in listdir(samplepath) if isfile(join(samplepath, f)) ]
	num_images = len(image_names)
	images = np.asarray([cv2.imread( join(samplepath,image_names[n]) ).astype(float) for n in range(0, num_images)])
	median_image = np.median(images, axis=0)
	cv2.imwrite(sys.argv[1] + "/median_image.png", median_image)

	# Remove old calibration data
	print "\nClearing old calibration data:"
	system("rm -rfv " + sys.argv[1] + "/calibration_data/* ")
		
	# Load or create the star database
	stardb = {}

	if isfile("stardb.p"):
		print "\nLoading database from pickle"
		stardb = pickle.load(open("stardb.p", "rb"))
	else:
		print "\nGenerating database"
		stardb = getstardb()
		pickle.dump(stardb, open("stardb.p", "wb"))
	
	astrometry_results = {}

	# filter the background image for astrometry - more important for starfield generator
	for n in range(0, num_images):

		images[n] -= median_image
		image_name = sys.argv[1] + "/calibration_data/" + basename(image_names[n]) + ".png"
		img = np.clip(images[n], a_min = 0, a_max = 255).astype(np.uint8)
		cv2.imwrite(image_name, img)

		solve_cmd = "solve-field --skip-solved --no-plots --downsample 2 --cpulimit 60 " + image_name
		print solve_cmd
		system(solve_cmd)

		if isfile(basename(image_name)+'.wcs'):
			print 'wcsinfo ' + basename(image_name) + '.wcs  | tr [:lower:] [:upper:] | tr " " "=" | grep "=[0-9.-]*$" > ' + basename(image_name) + '.solved'
			system('wcsinfo ' + basename(image_name) + '.wcs  | tr [:lower:] [:upper:] | tr " " "=" | grep "=[0-9.-]*$" > ' + basename(image_name) + '.solved')
			hdulist = fits.open(basename(image_name) + ".corr")
			astrometry_results[image_names[n]] = np.array([[i['flux'], i['field_x'], i['field_y'], i['index_x'], i['index_y']] + angles2xyz(i['index_ra'], i['index_dec']) for i in hdulist[1].data])
		
	
	# Use only values below the median for variance calculation. 
	# (This is equivalent to calculating variance after having filtered out stars and background light.)
	THRESH_FACTOR = 5
	IMAGE_VARIANCE = np.ma.average(images ** 2, weights = images < 0)
	
	bestimage = ""
	maxstars = 0

	# for stars over 5 * IMAGE_VARIANCE, find the corresponding star in the db
	sd = np.array(stardb.values(), dtype = object)
	star_kd = spatial.cKDTree(sd[:,4:7])

	for i in astrometry_results:

		astrometry_results[i] = astrometry_results[i][astrometry_results[i][:,0] > IMAGE_VARIANCE * THRESH_FACTOR]
		astrometry_results[i] = np.hstack((sd[star_kd.query(astrometry_results[i][:,5:8])[1]], astrometry_results[i]))

		if len(astrometry_results[i]) > maxstars:
			bestimage = i
			maxstars = len(astrometry_results[i])

	astrometry_results_all = np.vstack(np.array(astrometry_results.values()))
	astrometry_results_all = astrometry_results_all.astype('float')
	
	# find the dimmest star
	dimmest_match = astrometry_results_all[np.argmax(astrometry_results_all[:,1]),:]

	BASE_FLUX = dimmest_match[8] / pow(10.0, -dimmest_match[1] / 2.5)
	
	db_img_dist = np.linalg.norm(astrometry_results_all[:,9:11] - astrometry_results_all[:,11:13], axis=1)
	db_img_dist = db_img_dist - IMAGE_VARIANCE / (astrometry_results_all[:,8])
	
	POS_VARIANCE = np.mean(db_img_dist)
	
	execfile(sys.argv[1] + "/calibration_data/" + basename(bestimage) + ".solved")
	
	f_calib = open(sys.argv[1] + "/calibration.txt", 'w')
	f_calib.write("IMG_X=" + str(IMAGEW) + "\n")
	f_calib.write("IMG_Y= " + str(IMAGEH) + "\n")
	f_calib.write("PIXSCALE=" + str(PIXSCALE) + "\n")
	f_calib.write("DB_REDUNDANCY=" + str(DB_REDUNDANCY) + "\n")
	f_calib.write("DOUBLE_STAR_PX=" + str(DOUBLE_STAR_PX) + "\n")
	f_calib.write("REQUIRED_STARS=" + str(REQUIRED_STARS) + "\n")
	f_calib.write("MAX_FALSE_STARS=" + str(MAX_FALSE_STARS) + "\n")
	f_calib.write("BASE_FLUX=" + str(BASE_FLUX) + "\n")
	f_calib.write("THRESH_FACTOR=" + str(THRESH_FACTOR) + "\n")
	f_calib.write("IMAGE_VARIANCE=" + str(IMAGE_VARIANCE) + "\n")
	f_calib.write("POS_ERR_SIGMA=" + str(POS_ERR_SIGMA) + "\n")
	f_calib.write("POS_VARIANCE=" + str(POS_VARIANCE) + "\n")
	f_calib.write("APERTURE=" + str(APERTURE) + "\n")
	f_calib.write("EXPOSURE_TIME=" + str(EXPOSURE_TIME) + "\n")
	f_calib.close()
	
	print "Calibration finished"
	print "calibration.txt and median_image.png are in " + sys.argv[1] + "\n"
	system("cat " + sys.argv[1] + "/calibration.txt")