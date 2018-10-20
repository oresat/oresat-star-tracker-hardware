#/bin/bash
cd PRU_code
./deploy.sh
cd ..
make
sleep 1
./mem_alloc.out
