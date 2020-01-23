#!/usr/bin/python3

import os
import io
from PIL import Image 

path="/dev/prucam"
pixels=1280*960

fd = os.open(path, os.O_RDWR)

fio = io.FileIO(fd, closefd = False)

img = bytearray(pixels)

fio.readinto(img)

# write it back to file
#f = os.open("img.file", os.O_RDWR) 
#num = os.write(f, img)
#print("wrote: ", num)
