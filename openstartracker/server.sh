#!/bin/bash

# server.sh - Bash script to start the star tracker Dbus server
# by Umair Khan, from the Portland State Aerospace Society
# based on OpenStarTracker from Andrew Tennenbaum at the University of Buffalo
# openstartracker.org

python3 startracker_server.py datasets/$1/calibration.txt 1991.25 datasets/$1/median_image.png
