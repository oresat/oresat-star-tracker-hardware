#/bin/bash
export PRU_CGT=/usr/share/ti/cgt-pru
cd PRU_code
./deploy.sh
cd ..
make
sleep .25
./mem_alloc.out
