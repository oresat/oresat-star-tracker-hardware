# Imports
import can

# Set up the CAN bus
bus = can.interface.Bus(bustype = "socketcan", channel = "can0", bitrate = 1000000)
current_id = 0x00
image = bytearray()
print("Ready...")

# Receive the image size
num_msgs = 0
while current_id == 0x00:
	msg = bus.recv()
	if msg.arbitration_id == 0x00:
		num_msgs += 2048
	if msg.arbitration_id == 0x01:
		num_msgs += sum(msg.data)
		current_id = 0x01

# Receive the image
while num_msgs > 0:
	msg = bus.recv()
	for i in msg.data:
		image.append(i)
	num_msgs -= 1

print(len(image))

# Save the image
image_file = open("received.pgm", "wb")
image_file.write(image)
image_file.close()