#!/bin/bash

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
      echo "Usage: ./unit_test.sh [options] testdir [cmd]"
      echo -e ""
      echo -e "\t-c\tCalibrate based on images in testdir/samples/"
      echo -e "\t-i\tRun image test"
      echo -e "\t-r\tRecompile the backend"
      exit
      ;;
  esac
done
shift "$[$OPTIND-1]"

pushd "`dirname $0`">/dev/null

TESTDIR="$1"
if [ ! -d "$TESTDIR" ]; then
	echo "'$TESTDIR' is not a valid directory "
	exit
fi

shift

KILLPID=""
if [[ $RECOMPILE == 1 ]]; then
	pushd beast >/dev/null
	./go || exit
	popd>/dev/null
fi

if [[ $CALIBRATE == 1 ]]; then
	time python2.7 calibrate.py $TESTDIR || exit
fi

if [[ $IMG_TEST == 1 ]]; then
	python2.7 startracker.py $TESTDIR/calibration.txt 1991.25 $TESTDIR/median_image.png
fi

if [ "$KILLPID" != "" ] ; then 
	kill $KILLPID
fi

popd>/dev/null
