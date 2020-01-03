# Imports
import sys
import os
import glob
from pydbus.generic import signal
from pydbus import SystemBus
from gi.repository import GLib

# Set up interface
INTERFACE_NAME = "org.example.project.oresat"
bus = SystemBus()
loop = GLib.MainLoop()

# Signal callback
def signal_callback(*args):
    print("Data: ", args[4])

# Try connecting to the star tracker server
try:
    startracker = bus.get(INTERFACE_NAME)
except:
    sys.exit("Could not connect to Dbus interface. Aborting...")

# Loop through samples in given directory
filepaths = [path for path in glob.glob("datasets/" + sys.argv[1] + "/samples/*")]
filepaths.sort()

for path in filepaths:
    print("\nAttempting to solve {}...".format(path))
    reply = startracker.solve_image(path)
    print("Returned: {}\n".format(reply))

print("Calling quit method...")
startracker.Quit()