#/bin/bash
export PRU_CGT=/usr/share/ti/cgt-pru
cd PRU_code
echo "Compiling and Uploading PRU firmware...."
$(./deploy.sh > /dev/null) || exit 1
cd ..
echo "Compiling and Running ARM Program...."
make || exit 1
sleep .25
./camera_arm.out
