# oresat-star-tracker

This is the repository for all things related to the star tracker system for OreSat. The star tracker takes pictures of the local star field and returns the spacecraft's attitude (which way it's pointed). This is critical for both OreSat Live and the Cirrus Flux Camera missions which require the satellite to be pointed down to a specific location on the ground.

![Latest OreSat Star Tracker Board](https://github.com/oresat/oresat-star-tracker/blob/master/oresat-star-tracker-board.jpg)

Our hardware is all custom hardware for the open source "OreSat bus" that we're developing. The star tracker is one of our [Octavo OSD3358-1G-ISM](https://octavosystems.com/octavo_products/osd335x-sm/) "Linux box on a Chip" cards, with a custom camera setup based on the [On Semiconductor AR1030](https://www.onsemi.com/pub/Collateral/AR0130CS-D.PDF).

*Looking for what's running on this? Our star tracker software, based on [OpenStarTracker](https://openstartracker.org) from the University at Buffalo, was migrated to the [oresat-star-tracker-software](https://github.com/oresat/oresat-star-tracker-software) repository on 2/21/2020.*
"Looking for pru kernel module / firmware see [oresat-linux-prucam](https://github.com/oresat/oresat-linux-prucam)"

Where to find things:

- oresat-camera-hardware - directories related to hardware for OreSat camera system
- Old stuff
   - STM32F4-camera-system - OreSat camera system based on the STM32F4 MCU
   - archive - old files and projects no longer in use
   - camera_testing - files related to testing our AR0130-based cameras

