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
    remainder -= 256
final_data.append(remainder)

for i in range(num_blank):
    bus.send(can.Message(arbitration_id = 0x00, data = [0]))
bus.send(can.Message(arbitration_id = 0x01, data = final_data))
time.sleep(0.1)

print("Sent image size...")

# Send the image
while bytes_left > 0:

    # Send the appropriate data packet
    if bytes_left < 8:
        msg_data = []
        for i in range(bytes_left):
            msg_data.append(image[counter])
            counter += 1
            bytes_left -=1
        bus.send(can.Message(arbitration_id = 0x01, data = msg_data))
    else:
        bus.send(can.Message(arbitration_id = 0x01, data = [image[counter], image[counter + 1], image[counter + 2], image[counter + 3], image[counter + 4], image[counter + 5], image[counter + 6], image[counter + 7]]))
        counter += 8
        bytes_left -= 8

print("Image sent...")