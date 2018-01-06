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

# converts a hash_code into an index in the hash table
def hash_code_to_index(hash_code, bins_per_dimension, hash_table_size):
  # convert hashcode to python integers
  hash_code = [int(value) for value in hash_code]
  # represent hash code as a single integer
  integer_hash_code = sum(hash_code[i] * bins_per_dimension ** i for i in range(len(hash_code)))
  # randomize the hash code by multiplying by the avalanching constant
  # take the result modulo the table size to give a random index
  index = (integer_hash_code * avalanche_constant) % hash_table_size
  return index
  
# find all stars within a radius centered on the given vector using the compressed course sky map
def get_nearby_stars_compressed_course(vector, radius):
  # create list of nearby stars
  nearby_star_ids = []
  # given error of at most radius in each dimension, compute the space of hash codes to lookup in the sky map
  hash_code_space = [range(max(low,0), min(high+1,2*num_course_sky_map_bins)) for (low, high) in zip(((vector + 1 - radius) * num_course_sky_map_bins).astype(np.int), ((vector + 1 + radius) * num_course_sky_map_bins).astype(np.int))]
  # iterate over hash code space, looking up partitions of the sky map that are within range of the given vector
  for hash_code in itertools.product(*hash_code_space):
    hash_index = hash_code_to_index(hash_code, 2*num_course_sky_map_bins, compressed_course_sky_map_hash_table_size)
    # iterate over the star lists in the given partition, adding them to
    # the nearby stars list if they're in the correct bin and within range of the vector
    for index in ((2 * (hash_index + offset ** 2)) % compressed_course_sky_map_hash_table_size for offset in itertools.count()):
      # if the current slot is empty, the bin does not exist
      if not compressed_course_sky_map[index]:
        break
      # otherwise, check if the indices correspond to the correct bin
      indices = compressed_course_sky_map[index:index+2]
      # extract the sublist of star ids given by the indices
      star_id_list = compressed_course_sky_map[slice(*indices)]
      # check if the hash code for the first star matches the bin's hash code
      first_star_vector = star_table[star_id_list[0]]
      first_star_hash_code = tuple(((first_star_vector+1)*num_course_sky_map_bins).astype(np.int))
      if first_star_hash_code == hash_code:
        # iterate over the stars in the sublist, adding them to
        # the nearby stars list if they're within range of the vector
        for star_id in star_id_list:
          if np.dot(vector, star_table[star_id]) > np.cos(radius):
            nearby_star_ids.append(star_id)
  return nearby_star_ids

# open the pattern catalog and fine sky map and test whether they are fully
# generated with the following parameters and if not, regenerate them
parameters = (max_fovs, 
              num_catalog_bins, 
              max_stars_per_fov, 
              magnitude_minimum, 
              min_angle, 
              pattern_size, 
              fine_sky_map_fill_factor, 
              num_fine_sky_map_bins,
              course_sky_map_fill_factor, 
              num_course_sky_map_bins)
# try opening the database files
try:
  pattern_catalog = np.load('pattern_catalog.npy')
  fine_sky_map = np.load('fine_sky_map.npy')
  compressed_course_sky_map = np.load('compressed_course_sky_map.npy')
  compressed_course_sky_map_hash_table_size = compressed_course_sky_map[-1]
  star_table = np.load('star_table.npy')
  stored_parameters = open('params.txt', 'r').read()
  # if it got this far, the reads didn't fail
  read_failed = 0
except:
  # loading from the files failed, so they either didn't existing or weren't complete
  read_failed = 1
# there are two cases in which the catalog needs to be regenerated:
# reading the stored files failed or the stored parameters
# are different than those specified above
if read_failed or str(parameters) != stored_parameters:
  # number of stars in BSC5 catalog
  STARN = 9110

  # BSC5 data storage format
  bsc5_data_type = [("XNO", np.float32),
                    ("SRA0", np.float64),
                    ("SDEC0", np.float64),
                    ("IS", np.int16),
                    ("MAG", np.int16),
                    ("XRPM", np.float32),
                    ("XDPM", np.float32)
                   ]
  
  # open BSC5 catalog file for reading
  bsc5_file = open('BSC5', 'rb')
  # skip first 28 header bytes
  bsc5_file.seek(28)
  # read BSC5 catalog into array
  bsc5 = np.fromfile(bsc5_file, dtype=bsc5_data_type, count=STARN)

  # year to calculate catalog for
  # should be relatively close to 1950
  year = 2016

  # retrieve star positions, magnitudes and ids from BSC5 catalog
  stars = []
  for star_num in range(STARN):
    # only use stars brighter (i.e. lower magnitude)
    # than the minimum allowable magnitude
    mag = bsc5[star_num][4] / 100.0
    if mag <= magnitude_minimum:
      # retrieve RA in 1950
      ra = bsc5[star_num][1]
      # correct RA to modern day
      ra += bsc5[star_num][5] * (year - 1950)
      # retrieve DEC in 1950
      dec = bsc5[star_num][2]
      # correct DEC to modern day
      dec += bsc5[star_num][6] * (year - 1950)
      # skip blank star entries
      if ra == 0.0 and dec == 0.0:
        continue
      # convert RA, DEC to (x,y,z)
      vector = np.array([np.cos(ra)*np.cos(dec), np.sin(ra)*np.cos(dec), np.sin(dec)])
      # retrieve star ID number in BSC5
      star_id = int(bsc5[star_num][0])
      # add vector, magnitude pair to list of stars
      stars.append((vector, mag, star_id))
        
  # fast method for removing double stars using sort
  # sort list by x component of star vectors
  stars.sort(key=lambda star: star[0][0])
  # create boolean indicator list for which star vectors are double stars
  doubles = [0] * len(stars)
  for star_num1 in range(len(stars)):
    for star_num2 in range(star_num1 + 1, len(stars)):
      # skip checking star pairs with x component differences which
      # are already larger than the minimum allowable angle
      if stars[star_num2][0][0] - stars[star_num1][0][0] >= min_angle:
        break
      # if the star pair forms a double star, add both to the indicator list
      if np.dot(stars[star_num1][0], stars[star_num2][0]) > np.cos(min_angle):
        doubles[star_num1] = 1
        doubles[star_num2] = 1
        break
  # use the double star indicator list to create a new star vectors list without double stars
  stars_no_doubles = [stars[i] for i in range(len(stars)) if not doubles[i]]

  # output how many stars will be stored in the star table and the fine and course sky maps
  print("number of stars in star table and sky maps: " + str(len(stars)))
  
  # add all non-double stars brighter than magnitude_minimum to the star table and sky maps
  star_table = np.zeros((STARN+1, 3), dtype=np.float32)
  # create fine sky map hash table, which maps vectors to star ids
  fine_sky_map = np.zeros(len(stars) / fine_sky_map_fill_factor, dtype=np.uint16)
  # create course sky map hash table, which maps vectors to star ids
  course_sky_map = {}
  for (vector, mag, star_id) in stars_no_doubles:
    # add star vector to star table in position corresponding to its id
    star_table[star_id] = vector
    # find which partition the star occupies in the fine sky map hash table
    hash_code = ((vector+1)*num_fine_sky_map_bins).astype(np.int)
    hash_index = hash_code_to_index(hash_code, 2*num_fine_sky_map_bins, fine_sky_map.size)
    # use quadratic probing to find an open space in the fine sky map to insert the star in
    for index in ((hash_index + offset ** 2) % fine_sky_map.size for offset in itertools.count()):
      # if the current slot is empty, add the star
      # otherwise, move on to the next slot
      if not fine_sky_map[index]:
        fine_sky_map[index] = star_id
        break
    # find which partition the star occupies in the course sky map hash table
    hash_code = tuple(((vector+1)*num_course_sky_map_bins).astype(np.int))
    # if the partition is empty, create a new list to hold the star
    # if the partition already contains stars, add the star to the list
    course_sky_map[hash_code] = course_sky_map.pop(hash_code, []) + [star_id]

  # create compressed version of course sky map by indirectly mapping vectors to star ids
  # the map consists of a hash table, a superlist of stars, and a number representing the size of the hash table
  # the hash table consists of pairs of indices which slice the superlist into the output star id lists
  compressed_course_sky_map_hash_table_size = 2 * len(course_sky_map.keys()) / course_sky_map_fill_factor
  compressed_course_sky_map = np.zeros(compressed_course_sky_map_hash_table_size + len(stars_no_doubles) + 1, dtype=np.uint16)
  compressed_course_sky_map[-1] = compressed_course_sky_map_hash_table_size
  # add the items of the course sky map to the compressed course sky map one at a time
  first_open_slot_in_superlist = compressed_course_sky_map_hash_table_size
  for (hash_code, star_id_list) in course_sky_map.items():
    # compute the indices for the slice of the superlist the star id list will occupy
    slice_indices = (first_open_slot_in_superlist, first_open_slot_in_superlist + len(star_id_list))
    # add the star id list to the superlist
    compressed_course_sky_map[slice(*slice_indices)] = star_id_list
    # increment the counter for the first open slot in the superlist
    first_open_slot_in_superlist += len(star_id_list)
    hash_index = hash_code_to_index(hash_code, 2*num_course_sky_map_bins, compressed_course_sky_map_hash_table_size)
    # use quadratic probing to find an open space in the hash table to insert the star in
    for index in ((2 * (hash_index + offset ** 2)) % compressed_course_sky_map_hash_table_size for offset in itertools.count()):
      # if the current slot is empty, add the slice indices to the hash table
      # otherwise, move on to the next slot
      if not compressed_course_sky_map[index]:
        compressed_course_sky_map[index:index+2] = slice_indices
        break
  
  # sort list by star magnitude, from brightest to dimmest
  stars_no_doubles.sort(key=lambda star: star[1])

  # find all stars within a radius centered on the given vector using the pruned course sky map
  def get_nearby_stars_pruned_course(vector, radius):
    # create list of nearby stars
    nearby_star_ids = []
    # given error of at most radius in each dimension, compute the space of hash codes to lookup in the sky map
    hash_code_space = [range(max(low,0), min(high+1,2*num_course_sky_map_bins)) for (low, high) in zip(((vector + 1 - radius) * num_course_sky_map_bins).astype(np.int),
                                                                                                       ((vector + 1 + radius) * num_course_sky_map_bins).astype(np.int))]
    # iterate over hash code space, looking up partitions of the sky map that are within range of the given vector
    for hash_code in itertools.product(*hash_code_space):
      # iterate over the stars in the given partition, adding them to
      # the nearby stars list if they're within range of the vector
      for star_id in pruned_course_sky_map.get(hash_code, []):
        if np.dot(vector, star_table[star_id]) > np.cos(radius):
          nearby_star_ids.append(star_id)
    return nearby_star_ids
  
  # generate pattern catalog
  print("generating catalog, this may take an hour...")
  # create temporary list to store the patterns
  pattern_list = np.zeros((100000000, pattern_size), dtype=np.uint16)
  # create counter, which records how many patterns have been created
  num_patterns_found = 0

  # generate a piece of the catalog for each fov specified
  for max_fov in max_fovs:
    print("computing " + str(max_fov) + " degree fov patterns...")
  
    # change field of view from degrees to radians
    max_fov_rad = max_fov * np.pi / 180
    
    # fast method for pruning high density areas of the sky
    # create a hash table of the sky, which divides the
    # unit cube around the celestial sphere
    # up into (2*num_course_sky_map_bins)^3 partitions
    pruned_course_sky_map = {}
    # insert the stars into the hash table
    for (vector, mag, star_id) in stars_no_doubles:
      # skip stars that have too many closeby, brighter stars
      if len(get_nearby_stars_pruned_course(vector, max_fov_rad / 2)) >= max_stars_per_fov:
        continue
      # find which partition the star occupies in the hash table
      hash_code = tuple(((vector+1)*num_course_sky_map_bins).astype(np.int))
      # if the partition is empty, create a new list to hold the star
      # if the partition already contains stars, add the star to the list
      pruned_course_sky_map[hash_code] = pruned_course_sky_map.pop(hash_code, []) + [star_id]
    # create a list of stars without high density areas of the sky
    star_ids_pruned = [star_id for sublist in pruned_course_sky_map.values() for star_id in sublist]
      
    # initialize pattern, which will contain pattern_size star ids
    pattern = [None] * pattern_size
    for pattern[0] in star_ids_pruned:
      # find which partition the star occupies in the sky hash table
      hash_code = tuple(np.floor((star_table[pattern[0]]+1)*num_course_sky_map_bins).astype(np.int))
      # remove the star from the sky hash table
      pruned_course_sky_map[hash_code].remove(pattern[0])
      # iterate over all possible patterns containing the removed star
      for pattern[1:] in itertools.combinations(get_nearby_stars_pruned_course(star_table[pattern[0]], max_fov_rad), pattern_size-1):
        # retrieve the vectors of the stars in the pattern
        vectors = [star_table[star_id] for star_id in pattern]
        # verify that the pattern fits within the maximum field-of-view
        # by checking the distances between every pair of stars in the pattern
        if all(np.dot(*star_pair) > np.cos(max_fov_rad) for star_pair in itertools.combinations(vectors[1:], 2)):
          pattern_list[num_patterns_found] = pattern
          num_patterns_found += 1
  # truncate pattern list to only contain valid values
  pattern_list = pattern_list[:num_patterns_found]

  # insert star patterns into pattern catalog hash table
  print("inserting patterns into catalog...")
  pattern_catalog = np.zeros((num_patterns_found / catalog_fill_factor, pattern_size), dtype=np.uint16)
  for pattern in pattern_list:
    # retrieve the vectors of the stars in the pattern
    vectors = np.array([star_table[star_id] for star_id in pattern])
    # calculate and sort the edges of the star pattern, which are the distances between its stars
    edges = np.sort([np.linalg.norm(np.subtract(*star_pair)) for star_pair in itertools.combinations(vectors, 2)])
    # extract the largest edge
    largest_edge = edges[-1]
    # divide the edges by the largest edge to create dimensionless ratios
    edge_ratios = edges[:-1] / largest_edge
    # convert edge ratio float to hash code by binning
    hash_code = tuple((edge_ratios * num_catalog_bins).astype(np.int))
    hash_index = hash_code_to_index(hash_code, num_catalog_bins, pattern_catalog.shape[0])
    # use quadratic probing to find an open space in the pattern catalog to insert the pattern in
    for index in ((hash_index + offset ** 2) % pattern_catalog.shape[0] for offset in itertools.count()):
      # if the current slot is empty, add the pattern
      if not pattern_catalog[index][0]:
        pattern_catalog[index] = pattern
        break
      # if the current slot contains a previously inserted
      # copy of the same pattern, don't add the pattern
      elif sorted(pattern_catalog[index]) == sorted(pattern):
        break
      # otherwise, continue the search by moving on to the next slot
      else:
        continue

  # save star table, sky maps, pattern catalog, and parameters to disk
  np.save('star_table.npy', star_table)
  np.save('fine_sky_map.npy', fine_sky_map)
  np.save('compressed_course_sky_map.npy', compressed_course_sky_map)
  np.save('pattern_catalog.npy', pattern_catalog)
  parameters = open('params.txt', 'w').write(str(parameters))
  
