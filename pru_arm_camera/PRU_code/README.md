must login to root:
$sudo -s

export PRU_CGT variable
$export PRU_CGT=/usr/share/ti/cgt-pru

then run deploy.sh
$./deploy.sh

NOTES:
- For some reason PRU compiler is C89 spec, so you can't do some things like declare a var in a for loop call i.e. 'for(int i = 0 ; ...'
