#/bin/bash +x
PAYCOIN="KMD"
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"
DURATION=600 # how long to test each algo in seconds

# - allium
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u$PAYADDR -p c=$PAYCOIN

# - argon2d4096

# - argon2d500
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a argon2d500 -o stratum+tcp://argon2d500.eu.mine.zpool.ca:4239 -u $PAYADDR -p c=$PAYCOIN 

# - bcd
#GPU only

# - binarium-v1
cpuminer-easy-binarium/cpuminer --time-limit=$DURATION -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $PAYADDR -p c=$PAYCOIN

# - blake2b
#GPU only 

# - blake2s
#GPU only 

# - blakecoin
#GPU only 

# - bmw512
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a bmw512 -o stratum+tcp://bmw512.eu.mine.zpool.ca:5787 -u $PAYADDR -p c=$PAYCOIN 

# - cpupower
cpuminer-opt-cpupower/cpuminer --time-limit=$DURATION -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p c=$PAYCOIN 

# - curve
cpuminer-curvehash/cpuminer --time-limit=$DURATION -r 0 -a curvehash -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p c=$PAYCOIN 

# - equihash
# - equihash125
# - equihash144
# - equihash192
# - ghostrider
# - groestl

# - hmq1725
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a hmq1725 -o stratum+tcp://hmq1725.eu.mine.zpool.ca:3747 -u $PAYADDR -p c=$PAYCOIN 

# - keccak
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a keccak -o stratum+tcp://keccak.eu.mine.zpool.ca:5133 -u $PAYADDR -p c=$PAYCOIN 

# - lbry
# FPGA only

# - lyra2v2

# - lyra2z
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a lyra2z -o stratum+tcp://lyra2z.eu.mine.zpool.ca:4553 -u $PAYADDR -p c=$PAYCOIN 

# - lyra2z330

# - m7m
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $PAYADDR -p c=$PAYCOIN

# - megabtx
# - megamec

# - myr-gr
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a myr-gr -o stratum+tcp://myr-gr.eu.mine.zpool.ca:5433 -u $PAYADDR -p c=$PAYCOIN

# - neoscrypt
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a neoscrypt -o stratum+tcp://neoscrypt.eu.mine.zpool.ca:4233 -u $PAYADDR -p c=$PAYCOIN

# - power2b
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $PAYADDR -p c=$PAYCOIN

# - quark
cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a quark -o stratum+tcp://quark.eu.mine.zpool.ca:4033 -u $PAYADDR -p c=$PAYCOIN

# - qubit
# - scrypt
# - scryptn11
# - sha256
# - sha256t
# - sha3d
# - skein
# - skein2
# - skunk
# - tribus

# - x11
# - x13

# - x16r
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x16r -o stratum+tcp://x16r.eu.mine.zpool.ca:3636 -u $PAYADDR -p c=$PAYCOIN

# - x16rv2
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x16rv2 -o stratum+tcp://x16rv2.eu.mine.zpool.ca:3637 -u $PAYADDR -p c=$PAYCOIN

# - x16s
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x16s -o stratum+tcp://x16s.na.mine.zpool.ca:3423 -u $PAYADDR -p c=$PAYCOIN

# - x17
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x17 -o stratum+tcp://x17.eu.mine.zpool.ca:3737 -u $PAYADDR -p c=$PAYCOIN
# Mar 2021 worked

# - x21s
# Only GPU?

# - x25x
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x25x -o stratum+tcp://x25x.eu.mine.zpool.ca:3423 -u $PAYADDR -p c=$PAYCOIN

# - xevan
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a xevan -o stratum+tcp://xevan.eu.mine.zpool.ca:3739 -u $PAYADDR -p c=$PAYCOIN
# Mar 2021 - works

# - yescrypt
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $PAYADDR -p c=$PAYCOIN
# Mar 2021 - works

# - yescryptR32
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $PAYADDR -p c=$PAYCOIN
# Mar 2021 - works

# - yespower
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $PAYADDR -p c=$PAYCOIN

# - yespowerIC
# https://github.com/isotopec-org/isotopec-cpuminer
# NOT WORKING

# - yespowerLNC
# /cpuminer-RKZ/cpuminer  -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8 -p c=KMD
## NOT WORKING

# - yespowerR16
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $PAYADDR -p c=$PAYCOIN

