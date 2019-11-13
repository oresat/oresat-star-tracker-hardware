# Imports
import sys
import os
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

startracker = bus.get(INTERFACE_NAME)

print("Attempting to solve tests/downsample/samples/1.bmp...")
reply = startracker.solve_image("tests/downsample/samples/1.bmp")
print("Returned: {}\n".format(reply)))

print("Calling quit method...")
startracker.Quit()