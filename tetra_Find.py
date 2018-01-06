import numpy as np
import itertools
from PIL import Image
import scipy.ndimage
import scipy.optimize
import scipy.stats
import glob

# directory containing input images
image_directory = './pics'

# run the tetra star tracking algorithm on the given image
def tetra(image_file_name):
  # read image from file and convert to black and white
  image = np.array(Image.open(image_file_name).convert('L'))
  # extract height (y) and width (x) of image
  height, width = image.shape

  # flatten image by subtracting median filtered image
  # clip image so size is a multiple of downsample_factor
  # note that this may shift the center of the image
  height = height - height % downsample_factor
  width = width - width % downsample_factor
  image = image[:height, :width]
  # downsample image for median filtering
  downsampled_image = image.reshape((height//downsample_factor,downsample_factor,width//downsample_factor,downsample_factor)).mean(axis=3).mean(axis=1)
  # apply median filter to downsampled image
  median_filtered_image = scipy.ndimage.filters.median_filter(downsampled_image, size=filter_width, output=image.dtype)
  # upsample median filtered image back to original image size
  upsampled_median_filtered_image = median_filtered_image.repeat(downsample_factor, axis=0).repeat(downsample_factor, axis=1)
  # subtract the minimum of the image pixel and the local median to prevent values less than 0
  normalized_image = image - np.minimum.reduce([upsampled_median_filtered_image, image])

  # find all groups of pixels brighter than 5 sigma
  bright_pixels = zip(*np.where(normalized_image > 5 * np.std(normalized_image)))
  # group adjacent bright pixels together
  # create a dictionary mapping pixels to their group
  pixel_to_group = {}
  # iterate over the pixels from upper left to lower right
  for pixel in bright_pixels:
    # check whether the pixels above or to the left are part of
    # an existing group, which the current pixel will be added to
    left_pixel = (pixel[0]  , pixel[1]-1)
    up_pixel   = (pixel[0]-1, pixel[1]  )
    in_left_group = left_pixel in pixel_to_group
    in_up_group = up_pixel in pixel_to_group
    # if both are part of existing, disjoint groups, add the current pixel and combine the groups
    if in_left_group and in_up_group and id(pixel_to_group[left_pixel]) != id(pixel_to_group[up_pixel]):
      # add the current pixel to the upper pixel's group
      pixel_to_group[up_pixel].append(pixel)
      # append the upper pixel group onto the left pixel group
      pixel_to_group[left_pixel].extend(pixel_to_group[up_pixel])
      # replace all of the upper pixel group's dictionary entries
      # with references to the left pixel group
      for up_group_pixel in pixel_to_group[up_pixel]:
        pixel_to_group[up_group_pixel] = pixel_to_group[left_pixel]
    # if exactly one of the left pixel or upper pixels is part of an existing group,
    # add the current pixel to that group and add the current pixel to the dictionary
    elif in_left_group:
      pixel_to_group[left_pixel].append(pixel)
      pixel_to_group[pixel] = pixel_to_group[left_pixel]
    elif in_up_group:
      pixel_to_group[up_pixel].append(pixel)
      pixel_to_group[pixel] = pixel_to_group[up_pixel]
    # if neither of the left pixel or upper pixel are in an existing group,
    # add the current pixel to its own group and store it in the dictionary
    else:
      pixel_to_group[pixel] = [pixel]
  # iterate over the dictionary to extract all of the unique groups
  seen = set()
  groups = [seen.add(id(group)) or group for group in pixel_to_group.values() if id(group) not in seen]

  # find the brightest pixel for each group containing at least
  # the minimum number of pixels required to be classified as a star
  star_center_pixels = [max(group, key=lambda pixel: normalized_image[pixel]) for group in groups if len(group) > min_pixels_in_group]
  # find the centroid, or center of mass, of each star
  window_size = window_radius * 2 + 1
  # pixel values are weighted by their distances from the left (x) and top (y) of the window
  x_weights = np.fromfunction(lambda y,x:x+.5,(window_size, window_size))
  y_weights = np.fromfunction(lambda y,x:y+.5,(window_size, window_size))
  star_centroids = []
  for (y,x) in star_center_pixels:
    # throw out star if it's too close to the edge of the image
    if y < window_radius or y >= height - window_radius or \
       x < window_radius or x >= width  - window_radius:
      continue
    # extract the window around the star center from the image
    star_window = normalized_image[y-window_radius:y+window_radius+1, x-window_radius:x+window_radius+1]
    # find the total mass, or brightness, of the window
    mass = np.sum(star_window)
    # calculate the center of mass of the window in the x and y dimensions separately
    x_center = np.sum(star_window * x_weights) / mass - window_radius
    y_center = np.sum(star_window * y_weights) / mass - window_radius
    # correct the star center position using the calculated center of mass to create a centroid
    star_centroids.append((y + y_center, x + x_center))    

		#Below original line was giving me a deprecation error because the index evaluated to a float, to I added the int() type casts. --Oliver
  	#star_centroids.sort(key=lambda yx:-np.sum(normalized_image[yx[0]-window_radius:yx[0]+window_radius+1, yx[1]-window_radius:yx[1]+window_radius+1]))
    star_centroids.sort(key=lambda yx:-np.sum(normalized_image[int(yx[0]-window_radius):int(yx[0]+window_radius+1), int(yx[1]-window_radius):int(yx[1]+window_radius+1)]))

  # compute list of (i,j,k) vectors given list of (y,x) star centroids and
  # an estimate of the image's field-of-view in the x dimension
  # by applying the pinhole camera equations
  def compute_vectors(star_centroids, fov):
    center_x = width / 2.
    center_y = height / 2.
    fov_rad = fov * np.pi / 180
    scale_factor = np.tan(fov_rad / 2) / center_x
    star_vectors = []
    for (star_y, star_x) in star_centroids:
      j_over_i = (center_x - star_x) * scale_factor
      k_over_i = (center_y - star_y) * scale_factor
      i = 1. / np.sqrt(1 + j_over_i**2 + k_over_i**2)
      j = j_over_i * i
      k = k_over_i * i
      star_vectors.append(np.array([i,j,k]))
    return star_vectors

  # generate star patterns in order of brightness
  def centroid_pattern_generator(star_centroids, pattern_size):
    # break if there aren't enough centroids to make even one pattern
    if len(star_centroids) < pattern_size:
      return
    star_centroids = np.array(star_centroids)
    # create a list of the pattern's centroid indices
    # add the lower and upper index bounds as the first
    # and last elements, respectively
    pattern_indices = [-1] + list(range(pattern_size)) + [len(star_centroids)]
    # output the very brightest centroids before doing anything else
    yield star_centroids[pattern_indices[1:-1]]
    # iterate until the very dimmest centroids have been output
    # which occurs when the first pattern index has reached its maximum value
    while pattern_indices[1] < len(star_centroids) - pattern_size:
      # increment the pattern indices in order
      for index_to_change in range(1, pattern_size + 1):
        pattern_indices[index_to_change] += 1
        # if the current set of pattern indices is valid, use them
        if pattern_indices[index_to_change] < pattern_indices[index_to_change + 1]:
          break
        # otherwise, incrementing caused a conflict with the next pattern index
        # resolve the conflict by resetting the current pattern index and moving on
        else:
          pattern_indices[index_to_change] = pattern_indices[index_to_change - 1] + 1
      # output the centroids corresponding to the current set of pattern indices
      yield star_centroids[pattern_indices[1:-1]]
          
  # iterate over every combination of size pattern_size of the brightest max_pattern_checking_stars stars in the image
  for pattern_star_centroids in centroid_pattern_generator(star_centroids[:max_pattern_checking_stars], pattern_size):
    # iterate over possible fields-of-view
    for fov_estimate in max_fovs:
      # compute star vectors using an estimate for the field-of-view in the x dimension
      pattern_star_vectors = compute_vectors(pattern_star_centroids, fov_estimate)
      # calculate and sort the edges of the star pattern, which are the Euclidean distances between its stars' vectors
      pattern_edges = np.sort([np.linalg.norm(np.subtract(*star_pair)) for star_pair in itertools.combinations(pattern_star_vectors, 2)])
      # extract the largest edge
      pattern_largest_edge = pattern_edges[-1]
      # divide the pattern's edges by the largest edge to create dimensionless ratios for lookup in the catalog
      pattern_edge_ratios = pattern_edges[:-1] / pattern_largest_edge
      # given error of at most max_error in the edge_ratios, compute the space of hash codes to lookup in the catalog
      hash_code_space = [range(max(low,0), min(high+1,num_catalog_bins)) for (low, high) in zip(((pattern_edge_ratios - max_error) * num_catalog_bins).astype(np.int),
                                                                                                ((pattern_edge_ratios + max_error) * num_catalog_bins).astype(np.int))]
      # iterate over hash code space, only looking up non-duplicate codes that are in sorted order
      for hash_code in set([tuple(sorted(code)) for code in itertools.product(*hash_code_space)]):
        hash_code = tuple(hash_code)
        hash_index = hash_code_to_index(hash_code, num_catalog_bins, pattern_catalog.shape[0])
        # use quadratic probing to find all slots that patterns with the given hash code could appear in
        for index in ((hash_index + offset ** 2) % pattern_catalog.shape[0] for offset in itertools.count()):
          # if the current slot is empty, we've already
          # seen all patterns that match the given hash code
          if not pattern_catalog[index][0]:
            break
          # retrieve the star ids of possible match from pattern catalog
          catalog_pattern = pattern_catalog[index]
          # retrieve the vectors of the stars in the catalog pattern
          catalog_vectors = np.array([star_table[star_id] for star_id in catalog_pattern])
          # find the centroid, or average position, of the star pattern
          centroid = np.mean(catalog_vectors, axis=0)
          # calculate each star's radius, or Euclidean distance from the centroid
          radii = [np.linalg.norm(vector - centroid) for vector in catalog_vectors]
          # use the radii to uniquely order the catalog vectors
          catalog_sorted_vectors = catalog_vectors[np.argsort(radii)]
          # calculate and sort the edges of the star pattern, which are the distances between its stars
          catalog_edges = np.sort([np.linalg.norm(np.subtract(*star_pair)) for star_pair in itertools.combinations(catalog_vectors, 2)])
          # extract the largest edge
          catalog_largest_edge = catalog_edges[-1]
          # divide the edges by the largest edge to create dimensionless ratios
          catalog_edge_ratios = catalog_edges[:-1] / catalog_largest_edge
          # verify star patterns match to within the given maximum allowable error
          # note that this also filters out star patterns from colliding bins
          if any([abs(val) > max_error for val in (catalog_edge_ratios - pattern_edge_ratios)]):
            continue
          # compute the actual field-of-view using least squares optimization
          # compute the catalog pattern's edges for error estimation
          catalog_edges = np.append(catalog_edge_ratios * catalog_largest_edge, catalog_largest_edge)
          # helper function that calculates a list of errors in pattern edge lengths
          # with the catalog edge lengths for a given fov
          def fov_to_error(fov):
            # recalculate the pattern's star vectors given the new fov
            pattern_star_vectors = compute_vectors(pattern_star_centroids, fov)
            # recalculate the pattern's edge lengths
            pattern_edges = np.sort([np.linalg.norm(np.subtract(*star_pair)) for star_pair in itertools.combinations(pattern_star_vectors, 2)])
            # return a list of errors, one for each edge
            return catalog_edges - pattern_edges
          # find the fov that minimizes the squared error, starting with the given estimate
          fov = scipy.optimize.leastsq(fov_to_error, fov_estimate)[0][0]
          # convert newly computed fov to radians
          fov_rad = fov * np.pi / 180
          # find half diagonal fov of image in radians
          fov_half_diagonal_rad = fov_rad * np.sqrt(width ** 2 + height ** 2) / (2 * width)
          # recalculate star vectors using the new field-of-view
          pattern_star_vectors = compute_vectors(pattern_star_centroids, fov)
          # find the centroid, or average position, of the star pattern
          pattern_centroid = np.mean(pattern_star_vectors, axis=0)
          # calculate each star's radius, or Euclidean distance from the centroid
          pattern_radii = [np.linalg.norm(star_vector - pattern_centroid) for star_vector in pattern_star_vectors]
          # use the radii to uniquely order the pattern's star vectors so they can be matched with the catalog vectors
          pattern_sorted_vectors = np.array(pattern_star_vectors)[np.argsort(pattern_radii)]
          
          # calculate the least-squares rotation matrix from the catalog frame to the image frame
          def find_rotation_matrix(image_vectors, catalog_vectors):
            # find the covariance matrix H between the image vectors and catalog vectors
            H = np.sum([np.dot(image_vectors[i].reshape((3,1)), catalog_vectors[i].reshape((1,3))) for i in range(len(image_vectors))], axis=0)
            # use singular value decomposition to find the rotation matrix
            U, S, V = np.linalg.svd(H)
            rotation_matrix = np.dot(U, V)
            # correct reflection matrix if determinant is -1 instead of 1
            # by flipping the sign of the third column of the rotation matrix
            rotation_matrix[:,2] *= np.linalg.det(rotation_matrix)
            return rotation_matrix
          
          # use the pattern match to find an estimate for the image's rotation matrix
          rotation_matrix = find_rotation_matrix(pattern_sorted_vectors, catalog_sorted_vectors)
          # calculate all star vectors using the new field-of-view
          all_star_vectors = compute_vectors(star_centroids, fov)
          
          def find_matches(all_star_vectors, rotation_matrix):
            # rotate each of the star vectors into the catalog frame by
            # using the inverse (transpose) of the tentative rotation matrix
            rotated_star_vectors = [np.dot(rotation_matrix.T, star_vector) for star_vector in all_star_vectors]
            # retrieve matching catalog vectors for each image vector
            catalog_vectors = []
            for rotated_star_vector in rotated_star_vectors:
              hash_code_space = [range(max(low,0), min(high+1,2*num_fine_sky_map_bins)) for (low, high) in zip(((rotated_star_vector + 1 - match_radius) * num_fine_sky_map_bins).astype(np.int),
                                                                                                               ((rotated_star_vector + 1 + match_radius) * num_fine_sky_map_bins).astype(np.int))]
              # iterate over hash code space, only looking up non-duplicate codes that are in sorted order
              matching_stars = []
              for hash_code in [code for code in itertools.product(*hash_code_space)]:
                hash_index = hash_code_to_index(hash_code, 2*num_fine_sky_map_bins, fine_sky_map.size)
                # use quadratic probing to find an open space in the fine sky map to insert the star in
                for index in ((hash_index + offset ** 2) % fine_sky_map.size for offset in itertools.count()):
                  # if the current slot is empty, all of the matching stars have been found
                  # otherwise, move on to the next slot
                  if not fine_sky_map[index]:
                    break
                  # only accept stars within the match radius
                  elif np.dot(star_table[fine_sky_map[index]], rotated_star_vector) > np.cos(match_radius * fov_rad):
                    matching_stars.append(star_table[fine_sky_map[index]])
              catalog_vectors.append(matching_stars)
            # stars must uniquely match a catalog star brighter than magnitude_minimum
            matches = [(image_vector, catalog_star[0]) for (image_vector, catalog_star) in zip(all_star_vectors, catalog_vectors) if len(catalog_star) == 1]
            # catalog stars must uniquely match image stars
            matches_hash = {}
            # add the matches to the hash one at a time
            for (image_vector, catalog_vector) in matches:
              # exactly one image vector must match
              if tuple(catalog_vector) in matches_hash:
                matches_hash[tuple(catalog_vector)] = "multiple matches"
              else:
                matches_hash[tuple(catalog_vector)] = image_vector
            # reverse order so that image vector is first in each pair
            matches = []
            for (catalog_vector, image_vector) in matches_hash.items():
              # filter out catalog stars with multiple image star matches

              #below original gave a deprecation error
              #if image_vector == "multiple matches":

              if (type(image_vector) is str):
                continue
              matches.append((image_vector, np.array(catalog_vector)))
            return matches
          
          matches = find_matches(all_star_vectors, rotation_matrix)
          # calculate loose upper bound on probability of mismatch assuming random star distribution
          # find number of catalog stars appear in a circumscribed circle around the image
          image_center_vector = np.dot(rotation_matrix.T, np.array((1,0,0)))
          num_nearby_catalog_stars = len(get_nearby_stars_compressed_course(image_center_vector, fov_half_diagonal_rad))
          # calculate probability of a single random image centroid mismatching to a catalog star
          single_star_mismatch_probability = 1 - num_nearby_catalog_stars * match_radius ** 2 * width / height
          # apply binomial theorem to calculate probability upper bound on this many mismatches
          # three of the matches account for the dimensions of freedom: position, rotation, and scale
          mismatch_probability_upper_bound = scipy.stats.binom.cdf(len(star_centroids) - (len(matches) - 3), len(star_centroids) - 3, single_star_mismatch_probability)
          # if a high probability match has been found, recompute the attitude using all matching stars
          if mismatch_probability_upper_bound < max_mismatch_probability:
            # diplay mismatch probability in scientific notation
            print ("mismatch probability: %.4g" % mismatch_probability_upper_bound)
            # recalculate the rotation matrix using the newly identified stars
            rotation_matrix = find_rotation_matrix(*zip(*matches))
            # recalculate matched stars given new rotation matrix
            matches = find_matches(all_star_vectors, rotation_matrix)
            # extract right ascension, declination, and roll from rotation matrix and convert to degrees
            ra = (np.arctan2(rotation_matrix[0][1], rotation_matrix[0][0]) % (2 * np.pi)) * 180 / np.pi
            dec = np.arctan2(rotation_matrix[0][2], np.sqrt(rotation_matrix[1][2]**2 + rotation_matrix[2][2]**2)) * 180 / np.pi
            roll = (np.arctan2(rotation_matrix[1][2], rotation_matrix[2][2]) % (2 * np.pi)) * 180 / np.pi
            # print out attitude and field-of-view to 4 decimal places
            print("RA:   %.4f" % ra)
            print("DEC:  %.4f" % dec)
            print("ROLL: %.4f" % roll)
            print("FOV:  %.4f" % fov)
            # display input image with green circles around matched catalog stars
            # and red circles around unmatched catalog stars
            if show_solution:
              # draws circles around where the given vectors appear in an image
              def draw_circles(image, vectors, color, circle_fidelity, circle_radius):
                # calculate the pixel position of the center of the image
                image_center_x = width / 2.
                image_center_y = height / 2.
                # calculate conversion ratio between pixels and distance in the unit celestial sphere
                scale_factor = image_center_x / np.tan(fov_rad / 2)
                # iterate over the vectors, adding a circle for each one that appears in the image frame
                for (i, j, k) in vectors:
                  # find the center pixel for the vector's circle
                  circle_center_x = np.floor(image_center_x - (j / i) * scale_factor)
                  circle_center_y = np.floor(image_center_y - (k / i) * scale_factor)
                  # draw a circle of the given color with the given fidelity
                  for angle in np.array(range(circle_fidelity)) * 2 * np.pi / circle_fidelity:
                    # find the x and y coordinates for the pixel that will be drawn
                    pixel_x = int(circle_center_x + circle_radius * np.sin(angle))
                    pixel_y = int(circle_center_y + circle_radius * np.cos(angle))
                    # verify the pixel is within the image bounds
                    if pixel_x < 0 or pixel_x >= width or pixel_y < 0 or pixel_y >= height:
                      continue
                    # draw the pixel
                    image.putpixel((pixel_x, pixel_y), color)
              # plot the image with green circles around matched stars
              # and red circles around stars that weren't matched
              rgb_image = Image.fromarray(image).convert('RGB')
              # the circle is drawn using the corners of an n-gon, where the circle fidelity is n
              circle_fidelity = 100
              # star centroids that appear within the circle radius would match with the circle's corresponding catalog vector
              circle_radius = match_radius * width + 1
              # find which catalog stars could appear in the image
              image_center_vector = np.dot(rotation_matrix.T, np.array((1,0,0)))
              nearby_catalog_stars = get_nearby_stars_compressed_course(image_center_vector, fov_half_diagonal_rad)
              # rotate the vectors of all of the nearby catalog stars into the image frame
              rotated_nearby_catalog_vectors = [np.dot(rotation_matrix, star_table[star_id]) for star_id in nearby_catalog_stars]
              # color all of the circles red by default
              color_all = (255, 0, 0)
              draw_circles(rgb_image, rotated_nearby_catalog_vectors, color_all, circle_fidelity, circle_radius)
              # rotate the matched catalog stars into the image frame
              matched_rotated_catalog_vectors = [np.dot(rotation_matrix, catalog_vector) for (image_vector, catalog_vector) in matches]
              # recolor matched circles green
              color_matched = (0, 255, 0)
              draw_circles(rgb_image, matched_rotated_catalog_vectors, color_matched, circle_fidelity, circle_radius)
     
                 
              #turn off show image for testing
              rgb_image.show()
            return

  # print failure message
  print("failed to determine attitude")

for image_file_name in glob.glob(image_directory + '/*'):
  print(image_file_name)
  tetra(image_file_name)
