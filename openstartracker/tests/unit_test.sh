#!/bin/bash

CALIBRATE=0
IMG_TEST=0

while getopts ":ci" opt; do
  case $opt in
    c)
	  CALIBRATE=1
      ;;
    i)
	  IMG_TEST=1
      ;;
   \?)
      echo "Usage: ./unit_test.sh [options] testdir [cmd]"
      echo -e ""
      echo -e "\t-c\tCalibrate based on images in testdir/samples/"
      echo -e "\t-i\tRun image test"
      echo -e ""
      echo -e "Example cmd:"
	  echo -e "\tmassif-visualizer: valgrind --tool=massif"
	  echo -e "\tkcachegrind: valgrind --tool=cachegrind"
      echo -e ""
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
if [[ $IMG_TEST == 1 ]]; then
	pushd beast >/dev/null
	./go || exit
	popd>/dev/null
fi

if [[ $CALIBRATE == 1 ]]; then
	time python2.7 calibrate.py $TESTDIR || exit
fi

if [[ $IMG_TEST == 1 ]]; then
	$@ python2.7 startracker.py $TESTDIR/calibration.txt 1991.25 $TESTDIR/median_image.png &
	KILLPID="$!"
	sleep 10
	#make sure we dont crash when given an image w/ no stars
	echo "rgb.solve_image('$TESTDIR/median_image.png')" | nc 127.0.0.1 8010
	sleep 0.5
	for i in $TESTDIR/samples/*; do
		echo "rgb.solve_image('$i')" | nc 127.0.0.1 8010
		sleep 0.5
	done
	echo 'quit()' | nc 127.0.0.1 8010
fi

if [ "$KILLPID" != "" ] ; then 
	kill $KILLPID
fi

popd>/dev/null