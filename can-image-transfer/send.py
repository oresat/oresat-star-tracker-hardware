# Imports
import can
import math
import time

# Set up the CAN bus
bus = can.interface.Bus(bustype = "socketcan", channel = "can1", bitrate = 1000000)

# Get the image as an array of bytes
with open("to_send.pgm", "rb") as image_raw:
    f = image_raw.read()
    image = bytearray(f)

# Set up variables
bytes_left = len(image)
num_frames = int(math.ceil(len(image) / 8))
counter = 0

# Send the number of CAN frames
num_blank = num_frames // 2048
remainder = num_frames % 2048

final_data = []
while remainder > 256:
    final_data.append(256)
final_data.append(remainder)

for i in range(num_blank):
    bus.send(can.Message(arbitration_id = 0x00, data = [0]))
    time.sleep(0.0001)
bus.send(can.Message(arbitration_id = 0x01, data = final_data))
time.sleep(0.1)

print("Sent image size...")

# Send the image
while bytes_left > 0:

    # Get the number of bytes to send in this loop
    num_to_add = 8
    if bytes_left < 8:
        num_to_add = bytes_left

    # Add the data to the list to send
    msg_data = []
    for i in range(num_to_add):
        msg_data.append(image[counter])
        counter += 1
        bytes_left -=1

    # Create and send the CAN message
    bus.send(can.Message(arbitration_id = 0x01, data = msg_data))
    time.sleep(0.0001)

print("Image sent...")