### Dependencies

Make sure you have `python-can` installed before proceeding (e.g. `pip install python-can`), as well as the [FLIF](https://github.com/FLIF-hub/FLIF) encoder/decoder tool.

---

### CAN Setup - computer

Once the CANable is connected and powered via USB, run the following commands to get the CAN bus up and running:

```
sudo slcand -o -c -s8 /dev/serial/by-id/*CANtact*-if00 can0
sudo ifconfig can0 up
```

To disable the CAN bus when finished:

```
sudo ifconfig can0 down
```

### CAN Setup - PocketBeagle

Run the following commands after startup:

```
sudo config-pin P2_09 can
sudo config-pin P2_11 can
sudo ip link set can1 up type can bitrate 1000000
sudo ifconfig can1 up
sudo ifconfig can1 txqueuelen 10000
```

Note that the CAN bus doesn't seem to work unless it is specifically named `can1`. To disable when finished:

```
sudo ifconfig can1 down
```

---

To run the demo, first run `python3 receive.py` on the receiving side, then `python3 send.py` on the send side (with the image to send in the same directory). When finished, the received image will be written to `received.pgm`.