#!/bin/bash

# run.sh - Bash script to coordinate and test star tracker (assumes server is running)
# by Umair Khan, from the Portland State Aerospace Society
# based on OpenStarTracker from Andrew Tennenbaum at the University of Buffalo
# openstartracker.org

# Get flags
CALIBRATE=0
IMG_TEST=0
RECOMPILE=0

while getopts ":cir" opt; do
  case $opt in
    c)
	  CALIBRATE=1
      ;;
    i)
	  IMG_TEST=1
      ;;
    r)
	  RECOMPILE=1
      ;;
   \?)
      echo "Usage: ./run.sh [options] testdir"
      echo -e ""
      echo -e "\t-c\tCalibrate based on images in datasets/testdir/samples/"
      echo -e "\t-i\tRun OpenStarTracker client using datasets/testdir"
      echo -e "\t-r\tRecompile the backend"
      exit
      ;;
  esac
done
shift "$[$OPTIND-1]"

# Get into the root directory
pushd "`dirname $0`" > /dev/null

# Check the given directory
TESTDIR="$1"
if [ ! -d "datasets/$TESTDIR" ]; then
	echo "'$TESTDIR' is not a valid directory"
	exit
fi
shift

# Recompile the backend
if [[ $RECOMPILE == 1 ]]; then
	pushd beast >/dev/null
	make clean
  make
	popd > /dev/null
fi

# Calibrate the star tracker
if [[ $CALIBRATE == 1 ]]; then
	time python3 calibrate.py $TESTDIR || exit
fi

# Run the star tracker client
if [[ $IMG_TEST == 1 ]]; then
	python3 startracker_client.py $TESTDIR || exit
fi

# Exit directory
popd > /dev/null
