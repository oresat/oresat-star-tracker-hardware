#Astropy is awesome: http://docs.astropy.org/en/stable/coordinates/angles.html

import struct
from astropy import units as u
from astropy.coordinates import Angle

with open("BSC5", "rb") as binary_file:
    # Read the whole file at once
    
    #in this file a bytes in a block are read from right to left, but bits in a byte are read from left to right. Some sort of endian bullshit...
    #1b is last byte in header!
    
    headerLen = 28 #num of bytes in header
    starLen = 32 #num of bytes in star catalogue
    
    #data struct formats for unpacking, see: https://docs.python.org/2/library/struct.html
    headerFmt = "=iiiiiii"
    starFmt = "=fddcchff"
    
    #header data location offset
    numStars = 2
    
    #star data location offsets
    starNum = 0
    RA = 1
    DEC = 2    
    
    data = bytearray(binary_file.read())
    
    
    #testDat = bytearray(data)
    
    #create new star catalogue file
    starCat = open("BSC5new", "wb")
    starCat.write(data)
    starCat.close()


    
    
  
    #print(type(testDat))
    #read 28 byte header
    binary_file.seek(0)
    header = binary_file.read(28)
    header = struct.unpack( headerFmt , header )
    print("header:")
    print(header)



    #for i in range(0, abs(header[numStars])): #cycle through all stars in catalogue
    for i in range(0, 1): #for testing
    	star = binary_file.seek(headerLen + starLen*i)
    	star = binary_file.read(starLen)
    	star = struct.unpack( starFmt , star)
    	a = Angle(star[RA], u.radian)
    	print(a.radian)
    	print(a.to_string(unit=u.hour))
    	
    
    	



    '''
    #read 1st entry(32 bytes)
    binary_file.seek(28)
    first = binary_file.read(32)
    first = struct.unpack( starFmt , first)
    #print("byte:")
    #print(first)
    '''
    	
    



