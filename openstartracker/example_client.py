# Imports
import sys
import signal
import os
import time
from pydbus import SystemBus
from gi.repository import GLib

# Set up interface
INTERFACE_NAME = "org.OreSat.StarTracker"
bus = SystemBus()
loop = GLib.MainLoop()

# Set up signal handler
def graceful_exit(signal, frame):
    print("\nStopping property reading.\n")
    sys.exit()
signal.signal(signal.SIGINT, graceful_exit)

# Try connecting to the star tracker server
try:
    startracker = bus.get(INTERFACE_NAME)
except:
    sys.exit("Could not connect to Dbus interface. Aborting...")

# Read properties until exited
while True:
    dec, ra, ori, timestamp, path = startracker.coor
    print("\nSolved: {}\nDEC: {}\nRA: {}\nORI: {}\nTimestamp: {}".format(path, dec, ra, ori, timestamp))
    time.sleep(0.5)
