### Introduction

This is a modified version of [OpenStarTracker](https://openstartracker.org), originally developed by Andrew Tennenbaum at the University at Buffalo. Some of the information below comes from the original README file in the [OpenStarTracker repository](https://github.com/UBNanosatLab/openstartracker).

### Dependencies

- [Python 3](https://www.python.org/)
    - [NumPy](https://numpy.org/)
    - [SciPy](https://www.scipy.org/)
    - [pydbus](https://github.com/LEW21/pydbus)
    - [Astropy](https://www.astropy.org/)
- [OpenCV](https://opencv.org/) (with Python wrappers)
- [SWIG](http://swig.org/) (version 4.0.1 or greater)
- [astrometry.net](http://astrometry.net/)

These should be readily available from your OS package repositories, or via `pip` in the case of the Python packages.

Once you have installed astrometry.net, you must also grab the corresponding FITS files and place them in the appropriate directory. For example:

```
cd /usr/share/astrometry
sudo wget http://data.astrometry.net/4100/index-4112.fits
sudo wget http://data.astrometry.net/4100/index-4113.fits
sudo wget http://data.astrometry.net/4100/index-4114.fits
sudo wget http://data.astrometry.net/4100/index-4115.fits
sudo wget http://data.astrometry.net/4100/index-4116.fits
sudo wget http://data.astrometry.net/4100/index-4117.fits
sudo wget http://data.astrometry.net/4100/index-4118.fits
sudo wget http://data.astrometry.net/4100/index-4119.fits
```

Technically, you should only need the FITS files which correspond to your camera's FOV, but it doesn't hurt to just get them all.

### Setting up cameras

Each "camera" is represented by a subdirectory in the `datasets` directory. To set up a fresh dataset:

```
cd datasets
mkdir yourcamera
mkdir yourcamera/samples
mkdir yourcamera/calibration_data
```

Then, add 3-10 star images of different parts of the sky taken with your camera to `yourcamera/samples`.

### Running the star tracker

Things are mainly coordinated via two Bash scripts: `run.sh` and `server.sh`. Both scripts take one positional argument, the name of the camera directory to work with (e.g. `yourcamera`). `run.sh` uses flags in addition.

The very first thing you should do is compile the backend using the `-r` flag in `run.sh`

```
./run.sh -r yourcamera
```

Assuming you are setting up a fresh camera or dataset, you will also need to run the calibration script:

```
./run.sh -c yourcamera
```

The final step is to launch the star tracker. Currently, there is a star tracker "server" and "client", which use D-Bus to communicate. The server must be started before the client. (The default client simply solves all the images in `yourcamera/samples`).

```
./server.sh yourcamera
(in a separate shell)
./run.sh -i yourcamera
```

Obviously, flags can be combined when using `run.sh`. For example, to recompile the backend and run the client:

```
./run.sh -ri yourcamera
```