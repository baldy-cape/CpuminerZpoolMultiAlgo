#!/bin/sh
PAYCOIN="KMD"
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"
DURATION=1200
cpuminer-easy-binarium/cpuminer -r 0 --time-limit=$DURATION -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $PAYADDR -p c=$PAYCOIN;\
cpuminer-opt-cpupower/cpuminer -r 0 --time-limit=$DURATION -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p c=$PAYCOIN;\
cpuminer-curvehash/cpuminer -r 0 --time-limit=$DURATION -a curvehash -f 0x10000 -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p c=$PAYCOIN;\
cpuminer-gr/cpuminer -r 0 --time-limit=$DURATION -a gr -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 -u $PAYADDR -p c=$PAYCOIN;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $PAYADDR -p c=$PAYCOIN;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $PAYADDR -p c=$PAYCOIN ;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $PAYADDR -p c=$PAYCOIN ;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $PAYADDR -p c=$PAYCOIN ;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $PAYADDR -p c=$PAYCOIN ;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $PAYADDR -p c=$PAYCOIN ;\
isotopec-cpuminer/cpuminer -r 0 --time-limit=$DURATION -a yespowerIC -o stratum+tcp://yespowerIC.eu.mine.zpool.ca:6243 -u $PAYADDR -p c=$PAYCOIN;\
isotopec-cpuminer/cpuminer -r 0 --time-limit=$DURATION -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u $PAYADDR -p c=$PAYCOIN ;\
cpuminer-opt/cpuminer -r 0 --time-limit=$DURATION -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $PAYADDR -p c=$PAYCOIN;\
