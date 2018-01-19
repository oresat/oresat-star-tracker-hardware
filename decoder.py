import struct


with open("BSC5", "rb") as binary_file:
    # Read the whole file at once
    data = binary_file.read()
    #print(data[10])
    
    #in this file a bytes in a block are read from right to left, but bits in a byte are read from left to right. Some sort of endian bullshit...
    #1b is last byte in header!
    
    headerLen = 28 #num of bytes in header
    starLen = 32 #num of bytes in star catalogue
    
    #data struct formats for unpacking, see: https://docs.python.org/2/library/struct.html
    headerFmt = "=iiiiiii"
    starFmt = "=fddcchff"
  
    #read 28 byte header
    binary_file.seek(0)
    header = binary_file.read(28)
    header = struct.unpack( headerFmt , header )
    print("header:")
    print(header)
    print(abs(header[2]))
    

    #read 1st entry(32 bytes)
    binary_file.seek(28)
    first = binary_file.read(32)
    first = struct.unpack( starFmt , first)
    #print("byte:")
    #print(first)
    
    for i in range(0, abs(header[2])):
    	print(i)
    	star = binary_file.seek(headerLen + starLen*i)
    	star = binary_file.read(starLen)
    	star = struct.unpack( starFmt , star)
    	#print("star:")
    	print(star)
    	
    

    '''
    headerLen = 28
    header = []
    
    #headerbyte offsets ; Specify end because they are read backwards
    
    numStarsEnd = 11
    numStarsStart = 7
    numStarsLen = 4
    numStarsBin = []
    numStarsVal = 0
    
    unpack
    '''
    
    '''
    
    
    for i in range(0, headerLen):
    	header.append(data[i])
    	#print('0x' + format(header[i], '02x'))
    	#print(i)00000000 00000000 00101101 10000010

    #print(len(header))
    
    for i in range(0, numStarsLen):
    	numStarsBin.append(data[numStarsEnd - i])   	
    	#print(data[numStarsEnd - i])
    	#print(i)
    #print(numStarsBin)
    
    for i in range(0, numStarsLen):
    	numStarsVal += data[numStarsStart + i] * (2^(8*i)) 	
    	
    
    #print(format(numStarsVal, '032b'))
    
    #numStarsVal += numStarsbin
    '''
    	
    
    	

    
    '''
    # Seek position and read N bytes
    binary_file.seek(10)  # Go to beginning
    couple_bytes = binary_file.read(2)
    #print(couple_bytes)
    
    #read 28 byte header
    binary_file.seek(0)
    header = binary_file.read(28)
    #print(header)
    
    #read 1st entry(32 bytes)
    binary_file.seek(28)
    first = binary_file.read(32)
    print(first)
    '''



