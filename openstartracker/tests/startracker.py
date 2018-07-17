from time import time
import sys, traceback
import socket, select, os, gc
import cv2
import numpy as np
import numpy.linalg as LA
import cStringIO
import fcntl
import beast

P_MATCH_THRESH = 0.99

def trace(frame, event, arg):
	print>>sys.stderr,"%s, %s:%d" % (event, frame.f_code.co_filename, frame.f_lineno)
	return trace

CONFIGFILE = sys.argv[1]
YEAR = float(sys.argv[2])

# Set up the server
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('127.0.0.1', 8010))
server.listen(5)
server.setblocking(0)

# Prepare star tracker
print "\nLoading config" 
beast.load_config(CONFIGFILE)

print "Loading hip_main.dat" 
S_DB = beast.star_db()
S_DB.load_catalog("hip_main.dat", YEAR)

print "Filtering stars" 
SQ_RESULTS = beast.star_query(S_DB)
SQ_RESULTS.kdmask_filter_catalog()
SQ_RESULTS.kdmask_uniform_density(beast.cvar.REQUIRED_STARS)
S_FILTERED = SQ_RESULTS.from_kdmask()

print "Generating DB" 
C_DB = beast.constellation_db(S_FILTERED, 2 + beast.cvar.DB_REDUNDANCY, 0)

print "Ready"

###########
# Note: SWIG's policy is to garbage collect objects created with
# constructors, but not objects created by returning from a function
###########

# Print orientation
def print_ori(body2ECI):
	
	DEC = np.degrees(np.arcsin(body2ECI[0,2]))
	RA = np.degrees(np.arctan2(body2ECI[0,1],body2ECI[0,0]))
	ORIENTATION = np.degrees(-np.arctan2(body2ECI[1,2],body2ECI[2,2]))

	if ORIENTATION > 180:
		ORIENTATION = ORIENTATION - 360

	# rotation about the y axis (-90 to +90)
	print >>sys.stderr, "DEC = " + str(DEC)

	# rotation about the z axis (-180 to +180)
	print >>sys.stderr, "RA = " + str(RA)

	# rotation about the camera axis (-180 to +180)
	print >>sys.stderr, "ORIENTATION = " + str(ORIENTATION)

# Define an image
class star_image:

	def __init__(self, imagefile, median_image):

		b_conf = [time(), beast.cvar.PIXSCALE, beast.cvar.BASE_FLUX]
		self.img_stars = beast.star_db()
		self.img_data = []
		self.match = None
		self.db_stars = None
		
		# Placeholders so that these don't get garbage collected by SWIG
		self.fov_db = None
		
		# TODO: improve memory efficiency
		if "://" in imagefile:
			import urllib
			img = cv2.imdecode(np.asarray(bytearray(urllib.urlopen(imagefile).read()), dtype="uint8"), cv2.IMREAD_COLOR)
		else: 
			img = cv2.imread(imagefile)

		if img is None:
			print >>sys.stderr, "Invalid image, using blank dummy image"
			img = median_image
			
		img = np.clip(img.astype(np.int16) - median_image, a_min = 0, a_max = 255).astype(np.uint8)
		img_grey = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
		
		# remove areas of the image that don't meet our brightness threshold
		ret, thresh = cv2.threshold(img_grey, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE, 255, cv2.THRESH_BINARY)
		contours, heirachy = cv2.findContours(thresh, 1, 2);

		for c in contours:
			M = cv2.moments(c)

			if M['m00'] > 0:

				# this is how the x and y position are defined by cv2
				cx = M['m10'] / M['m00']
				cy = M['m01'] / M['m00']

				# see https://alyssaq.github.io/2015/computing-the-axes-or-orientation-of-a-blob/ for how to convert these into eigenvectors/values
				u20 = M["m20"] / M["m00"] - cx ** 2
				u02 = M["m02"] / M["m00"] - cy ** 2
				u11 = M["m11"] / M["m00"] - cx * cy

				# The center pixel is used as the approximation of the brightest pixel
				self.img_stars += beast.star(cx - beast.cvar.IMG_X / 2.0, (cy - beast.cvar.IMG_Y / 2.0), float(cv2.getRectSubPix(img_grey, (1,1), (cx,cy))[0,0]), -1)
				self.img_data.append(b_conf + [cx, cy, u20, u02, u11] + cv2.getRectSubPix(img, (1,1),(cx,cy))[0,0].tolist())
		
	def match_near(self, x, y, z, r):

		SQ_RESULTS.kdsearch(x, y, z, r, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)
		
		# estimate density for constellation generation
		C_DB.results.kdsearch(x, y, z, r,beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)
		fov_stars = SQ_RESULTS.from_kdresults()
		self.fov_db = beast.constellation_db(fov_stars, C_DB.results.r_size(), 1)
		C_DB.results.clear_kdresults()
		SQ_RESULTS.clear_kdresults()
		
		img_const = beast.constellation_db(self.img_stars, beast.cvar.MAX_FALSE_STARS + 2, 1)
		near = beast.db_match(self.fov_db, img_const)

		if near.p_match > P_MATCH_THRESH:
			self.match = near
			self.db_stars = near.winner.from_match()
		
	def match_lis(self):

		# For the first pass, we only want to use the brightest MAX_FALSE_STARS + REQUIRED_STARS
		img_stars_n_brightest = self.img_stars.copy_n_brightest(beast.cvar.MAX_FALSE_STARS + beast.cvar.REQUIRED_STARS)
		img_const_n_brightest = beast.constellation_db(img_stars_n_brightest, beast.cvar.MAX_FALSE_STARS + 2, 1)
		lis = beast.db_match(C_DB, img_const_n_brightest)

		if lis.p_match > P_MATCH_THRESH and lis.winner.size() >= beast.cvar.REQUIRED_STARS:
			x = lis.winner.R11
			y = lis.winner.R21
			z = lis.winner.R31
			self.match_near(x, y, z, beast.cvar.MAXFOV / 2)
				
	def print_match(self, bodyCorrection = None, angrate_string = ""):
		
		if bodyCorrection is None:
			bodyCorrection = np.eye(3)

		if self.match is not None:
			self.match.winner.print_ori()

# Define the star camera
class star_camera:

	def __init__(self, median_file, source = "RGB"):

		self.source = source
		self.current_image = None
		self.last_match = None
		self.median_image = cv2.imread(median_file)
	
	def solve_image(self, imagefile, lis = 1, quiet = 0):

		starttime = time()
		self.current_image = star_image(imagefile, self.median_image)
		self.current_image.match_lis()
		self.current_image.print_match()

		if self.current_image.match is not None:
			self.last_match = self.current_image
		else:
			self.last_match = None

		print>>sys.stderr, "Time: " + str(time() - starttime)

rgb = star_camera(sys.argv[3])

CONNECTIONS = {}

# Define connections - tracks activity on a file descriptor and allows TCP read/writes
class connection:

	# Create connection to track file descriptor activity
	def __init__(self, conn, epoll):

		self.conn = conn
		self.fd = self.conn.fileno()
		epoll.register(self.fd, select.EPOLLIN)
		self.epoll = epoll
		CONNECTIONS[self.fd] = self

	# Complete non-blocking read on file descriptor
	def read(self):

		fl = fcntl.fcntl(self.fd, fcntl.F_GETFL)
		fcntl.fcntl(self.fd, fcntl.F_SETFL, fl | os.O_NONBLOCK)
		data = ''

		try:
			while True:
				lastlen = len(data)
				data += os.read(self.fd, 1024)
				if len(data) == lastlen:
					break
		except OSError, e:
			if e.errno == 11: # no more data
				pass 													
			elif e.errno == 104:
				print >>sys.stderr, "WARNING: ABNORMAL DISCONNECT"
			else:
				raise

		return data

	# Blocking write on the file descriptor
	def write(self, data):
		
		if len(data) == 0: return

		if self.fd == 0:
			os.write(1, data)
			return

		fl = fcntl.fcntl(self.fd, fcntl.F_GETFL)
		fcntl.fcntl(self.fd, fcntl.F_SETFL, fl & ~os.O_NONBLOCK)
		os.write(self.fd, data)

	# Close connection with file descriptor
	def close(self):

		self.epoll.unregister(self.fd)
		self.conn.close()
		if CONNECTIONS[self.fd]:
			del CONNECTIONS[self.fd]

epoll = select.epoll()
epoll.register(server.fileno(), select.EPOLLIN)

try:
	connection(sys.stdin,epoll)
except IOError:
	pass

while True:

	events = epoll.poll()

	for fd, event_type in events:

		# Activity on the master socket means a new connection.
		if fd == server.fileno():
			conn, addr = server.accept()
			connection(conn, epoll)
		elif fd in CONNECTIONS:
			w = CONNECTIONS[fd]
			data = w.read()
			print>>sys.stderr, data

			if len(data) > 0:
				stdout_redir = cStringIO.StringIO()
				stdout_old = sys.stdout
				sys.stdout = stdout_redir

				try:
					exec(data)
				except:
					traceback.print_exc(file = sys.stdout)

				sys.stdout = stdout_old
				data_out = stdout_redir.getvalue()
				print>>sys.stderr, data_out
				w.write(data_out)
			else:
				w.close()