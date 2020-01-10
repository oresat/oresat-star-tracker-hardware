# startracker_server.py - main front-end for the star tracker
# by Umair Khan, from the Portland State Aerospace Society
# based on OpenStarTracker from Andrew Tennenbaum at the University of Buffalo
# openstartracker.org

# Imports
import sys
import os
import time
import threading
import numpy as np
import cv2
from pydbus.generic import signal
from pydbus import SystemBus
from gi.repository import GLib
import beast



# --------------------------------
#       STAR TRACKER SETUP
# --------------------------------

# Prepare constants and get system arguments
P_MATCH_THRESH = 0.99
CONFIGFILE = sys.argv[1]
YEAR = float(sys.argv[2])
MEDIAN_IMAGE = cv2.imread(sys.argv[3])
b_conf = [time.time(), beast.cvar.PIXSCALE, beast.cvar.BASE_FLUX]

# Prepare star tracker
print("\nLoading config")
beast.load_config(CONFIGFILE)

print("Loading hip_main.dat")
S_DB = beast.star_db()
S_DB.load_catalog("hip_main.dat", YEAR)

print("Filtering stars")
SQ_RESULTS = beast.star_query(S_DB)
SQ_RESULTS.kdmask_filter_catalog()
SQ_RESULTS.kdmask_uniform_density(beast.cvar.REQUIRED_STARS)
S_FILTERED = SQ_RESULTS.from_kdmask()

print("Generating DB")
C_DB = beast.constellation_db(S_FILTERED, 2 + beast.cvar.DB_REDUNDANCY, 0)

print("Ready")



# --------------------------------
#           D-BUS SETUP
# --------------------------------

# Set up interface
INTERFACE_NAME = "org.example.project.oresat"
bus = SystemBus()
loop = GLib.MainLoop()

# Define XML for server
class Server_XML(object):

    # XML definition
    dbus = """
    <node>
        <interface name='org.example.project.oresat'>
            <method name='solve_image'>
                <arg type='s' name='filepath' direction='in' />
                <arg type='b' name='status' direction='out' />
            </method>
            <signal name='error'>
                <arg type='s' />
            </signal>
            <property name='DEC' type='d' access='read' />
            <property name='RA' type='d' access='read' />
            <property name='ORI' type='d' access='read' />
            <method name='Quit'/>
        </interface>
    </node>
    """

    # Initialize properties and worker thread
    def __init__(self):

        # Properties
        self.dec = 0.0
        self.ra = 0.0
        self.ori = 0.0
        self.solve_file = ""

        # Set up worker thread
        self.lock = threading.Lock()
        self.running = True
        self.worker = threading.Thread(target = self.worker_thread)

        # Start worker thread
        self.worker.start()


    # D-Bus method to solve image
    def solve_image(self, filepath):
        self.lock.acquire()
        self.solve_file = filepath
        self.lock.release()
        return True

    # Worker thread
    def worker_thread(self):
        while(self.running):
            if self.solve_file != "":
                self.lock.acquire()
                print("\nSolving {}".format(self.solve_file))
                self.dec, self.ra, self.ori = solve(self.solve_file)
                print("DEC: {}".format(self.dec))
                print("RA: {}".format(self.ra))
                print("ORI: {}".format(self.ori))
                self.solve_file = ""
                self.lock.release()

    # Stop threads in preparation to exit
    def end(self):
        self.running = False
        if self.worker.is_alive():
            self.worker.join()

    # Method to quit
    def Quit(self):
        loop.quit()
        self.end()

    # Signals
    error = signal()

    # Declination
    @property
    def DEC(self):
        self.lock.acquire()
        return self.dec
        self.lock.release()

    # Right ascension
    @property
    def RA(self):
        self.lock.acquire()
        return self.ra
        self.lock.release()

    # Orientation
    @property
    def ORI(self):
        self.lock.acquire()
        return self.ori
        self.lock.release()


# Create object
emit = Server_XML()
bus.publish(INTERFACE_NAME, emit)

# Function to send error
def send_error(error):
    emit.error(error)
    print("Sent error: {}".format(error))



# --------------------------------
#          STAR TRACKER
# --------------------------------

# See if an image is worth attempting to solve
def check_image(img):

    # Generate test parameters
    height, width, channels = img.shape
    total_pixels = height * width
    blur_check = int(total_pixels * 0.99996744)
    too_many_check = int(total_pixels * 0.99918619)

    # Convert and threshold the image
    img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
    ret, threshold = cv2.threshold(img, 80, 255, cv2.THRESH_BINARY)

    # Count the number of black pixels in the thresholded image
    threshold_black = total_pixels - cv2.countNonZero(threshold)

    # Check the test values and return appropriate value
    if threshold_black > blur_check:
        blur = cv2.Laplacian(img, cv2.CV_64F).var()
        if blur != 0 and blur < 5:
            send_error("image too blurry")
        else:
            send_error("image contains too few stars")
        return 0
    elif threshold_black < too_many_check:
        send_error("unsuitable image")
        return 0

    return 1


# Solution function
def solve(filepath):

    # Keep track of solution time
    starttime = time.time()

    # Create and initialize variables
    img_stars = beast.star_db()
    match = None
    fov_db = None

    # Load the image
    orig_img = cv2.imread(filepath)
    if type(orig_img) == type(None):
        send_error("could not open image at {}".format("filepath"))
        return 0, 0, 0

    # Check the image to see if it is fit for processing
    result = check_image(orig_img)
    if result == 0:
        print("Image unfit for processing")
        print("Time: {}".format(time.time() - starttime))
        return 0, 0, 0

    # Process the image for solving
    img = np.clip(orig_img.astype(np.int16) - MEDIAN_IMAGE, a_min = 0, a_max = 255).astype(np.uint8)
    img_grey = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

    # Remove areas of the image that don't meet our brightness threshold and then extract contours
    ret, thresh = cv2.threshold(img_grey, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE, 255, cv2.THRESH_BINARY)
    thresh_contours, contours, hierarchy = cv2.findContours(thresh, 1, 2);

    # Process the contours
    for c in contours:

        M = cv2.moments(c)

        if M["m00"] > 0:

            # this is how the x and y position are defined by cv2
            cx = M["m10"] / M["m00"]
            cy = M["m01"] / M["m00"]

            # see https://alyssaq.github.io/2015/computing-the-axes-or-orientation-of-a-blob/ for how to convert these into eigenvectors/values
            u20 = M["m20"] / M["m00"] - cx ** 2
            u02 = M["m02"] / M["m00"] - cy ** 2
            u11 = M["m11"] / M["m00"] - cx * cy

            # The center pixel is used as the approximation of the brightest pixel
            img_stars += beast.star(cx - beast.cvar.IMG_X / 2.0, cy - beast.cvar.IMG_Y / 2.0, float(cv2.getRectSubPix(img_grey, (1,1), (cx,cy))[0,0]), -1)

    # We only want to use the brightest MAX_FALSE_STARS + REQUIRED_STARS
    img_stars_n_brightest = img_stars.copy_n_brightest(beast.cvar.MAX_FALSE_STARS + beast.cvar.REQUIRED_STARS)
    img_const_n_brightest = beast.constellation_db(img_stars_n_brightest, beast.cvar.MAX_FALSE_STARS + 2, 1)
    lis = beast.db_match(C_DB, img_const_n_brightest)

    # Generate the match
    if lis.p_match > P_MATCH_THRESH and lis.winner.size() >= beast.cvar.REQUIRED_STARS:

        x = lis.winner.R11
        y = lis.winner.R21
        z = lis.winner.R31
        r = beast.cvar.MAXFOV / 2

        SQ_RESULTS.kdsearch(x, y, z, r, beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)

        # Estimate density for constellation generation
        C_DB.results.kdsearch(x, y, z, r,beast.cvar.THRESH_FACTOR * beast.cvar.IMAGE_VARIANCE)
        fov_stars = SQ_RESULTS.from_kdresults()
        fov_db = beast.constellation_db(fov_stars, C_DB.results.r_size(), 1)
        C_DB.results.clear_kdresults()
        SQ_RESULTS.clear_kdresults()

        img_const = beast.constellation_db(img_stars, beast.cvar.MAX_FALSE_STARS + 2, 1)
        near = beast.db_match(fov_db, img_const)

        if near.p_match > P_MATCH_THRESH:
            match = near

    # Print solution
    if match is not None:

        match.winner.calc_ori()
        dec = match.winner.get_dec()
        ra = match.winner.get_ra()
        ori = match.winner.get_ori()

        # For reference:
        # - dec         - rotation about the y-axis
        # - ra          - rotation about the z-axis
        # - ori         - rotation about the camera axis

    else:
        send_error("no match found")
        print("Time: {}".format(time.time() - starttime))
        return 0, 0, 0

    # Calculate how long it took to process
    print("Time: {}".format(time.time() - starttime))

    # Return solution
    return dec, ra, ori



# --------------------------------
#          D-BUS SERVER
# --------------------------------

# Run loop with graceful exiting
try:
    print("\nStarting D-Bus loop...")
    loop.run()
except KeyboardInterrupt as e:
    loop.quit()
    emit.end()
    print("\nExit by Ctrl-C\n")
