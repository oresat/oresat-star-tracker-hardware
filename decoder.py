#Astropy is awesome: http://docs.astropy.org/en/stable/coordinates/angles.html
# open env with: 
# source ~/envs/star-tracker/bin/activate
import struct
from astropy import units as u
from astropy.coordinates import Angle

with open("BSC5orig", "rb") as binary_file:
    # Read the whole file at once
    
    #in this file a bytes in a block are read from right to left, but bits in a byte are read from left to right. Some sort of endian bullshit...
    #1b is last byte in header!
    
    headerLen = 28 #num of bytes in header
    starLen = 32 #num of bytes in star catalogue
    
    #data struct formats for unpacking, see: https://docs.python.org/2/library/struct.html
    headerFmt = "=iiiiiii"
    starFmt = "=fddcchff"
    
    #header data location offset
    numStars = 2 #location of count of stars in catalogue
    
    #star sorting params
    minRA = 152
    maxRA = 332
    matchs = 0
    
    data = bytearray() #init data file that will be written

    #read 28 byte header
    binary_file.seek(0)
    header = binary_file.read(28)
    headerRead = struct.unpack( headerFmt , header )
    print("header:")
    print(headerRead)
    
    data += header #write header(not unpacked) to data file

    for i in range(0, abs(headerRead[numStars])): #cycle through all stars in catalogue
    #for i in range(0, 30): #for testing
    	#read the star entry from the catalogue
    	binary_file.seek(headerLen + starLen*i)
    	star = binary_file.read(starLen)
    	starRead = struct.unpack( starFmt , star)
    	
    	#assign values star catalogue location offsets
    	starNum = starRead[0] # Number 
    	RA = starRead[1] # Right Ascension
    	DEC = starRead[2] # Declination
    	spectral1 = starRead[3] # Spectral Type
    	spectral2 = starRead[4] # Spectral Type
    	magnitude = starRead[5] # Magnitude
    	RAproperMotion = starRead[6] # RA proper motion
    	DECproperMotion = starRead[7] # DEC proper motion

    	#need to unpack params, filter, and assign sequential star number to matches
    	   	
    	starRA = Angle(RA, u.radian) #assign radians to Angle data
    	starRA = starRA.degree #convert from radians to degrees	
    	
    	if (starRA > minRA and starRA < maxRA): #write any entries that match the sort params
    		
    		print("match found!")
    		starNum = matchs + 1
    		print(starNum)
    		#repack params into binary format
    		starWrite = struct.pack( starFmt, starNum, RA, DEC, spectral1, spectral2, magnitude, RAproperMotion, DECproperMotion)
    		
    		data += starWrite #write binary star info into final data
    		matchs += 1
    		
    print(matchs) #print number of matching stars

    #create and write to new star catalogue file
    starCat = open("BSC5", "wb")
    starCat.write(data)
    starCat.close()

