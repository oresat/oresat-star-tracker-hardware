import os

dev = os.open("/dev/prucam", os.O_RDWR)
img = os.read(dev, 1280*960)
print(len(img))

os.close(dev)

fd = os.open("img.file", os.O_RDWR) 
num = os.write(fd, img)
print("wrote: ", num)
