import numpy as np
import itertools
from PIL import Image
import scipy.ndimage
import scipy.optimize
import scipy.stats
import glob

# directory containing input images
image_directory = './pics'

# boolean for whether or not to display an annotated version
# of the image with identified stars circled in green and
# unmatched catalog stars circled in red
show_solution = True

# maximum fields of view of catalog patterns in degrees
# determines approximately what image fields of view
# can be identified by the algorithm
max_fovs = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]

# radius around image stars to search for matching catalog stars
# as a fraction of image field of view in x dimension
match_radius = .01

# maximum error in edge ratios
max_error = .01

# image downsampling factor for median filtering
downsample_factor = 2

# median filter window radius in down-sampled image pixels
filter_radius = 2
filter_width = filter_radius * 2 + 1

# percentage of pattern catalog that stores values
catalog_fill_factor = .5

# number of divisions along each dimension of the pattern catalog
num_catalog_bins = 25

# maximum number of pattern catalog stars within
# the maximum fov centered on any given pattern catalog star
max_stars_per_fov = 10

# minimum star brightness magnitude
magnitude_minimum = 5.0

# minimum allowable angle between star vectors in radians
# used to remove double stars
min_angle = .002

# number of stars to use in each pattern
pattern_size = 5

# minimum number of pixels in a group of bright pixels
# needed to classify the group as a star
min_pixels_in_group = 3

# centroiding window radius around a star's center pixel
# does not count the center pixel
window_radius = 2

# maximum number of bright stars to check against pattern catalog
max_pattern_checking_stars = 8

# maximum probability of mismatch for verifying an attitude determination
max_mismatch_probability = 1e-20

# percentage of fine sky map that stores values
fine_sky_map_fill_factor = .5

# number of divisions to break a single radius of
# the celestial sphere into for rapid star lookup
num_fine_sky_map_bins = 100

# percentage of course sky map that stores values
course_sky_map_fill_factor = .5

# number of divisions to break a single radius of
# the celestial sphere into for rapid star lookup
num_course_sky_map_bins = 4

# constant used for randomizing hash functions
avalanche_constant = 2654435761
