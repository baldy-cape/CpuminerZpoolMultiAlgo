#/bin/bash +x
PAYCOIN="KMD"
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"
DURATION=900 # how long to test each algo in seconds

# - allium
# worked Mar 2021
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u$PAYADDR -p c=$PAYCOIN 

# - argon2d4096
# worked Mar 2021
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a argon2d4096 -o stratum+tcp://argon2d4096.eu.mine.zpool.ca:4240 -u$PAYADDR -p c=$PAYCOIN 

# - argon2d500
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a argon2d500 -o stratum+tcp://argon2d500.eu.mine.zpool.ca:4239 -u $PAYADDR -p c=$PAYCOIN

# - bcd
#GPU only

# - binarium-v1
# worked 2021
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
# worked 2021
cpuminer-opt-cpupower/cpuminer --time-limit=$DURATION -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p c=$PAYCOIN  

# - curve
cpuminer-curvehash/cpuminer --time-limit=$DURATION -r 0 -a curvehash -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p c=$PAYCOIN  

# - equihash
# GPU
# - equihash125
#GPU

# - equihash144
# GPU
# - equihash192
#GPU

# - ghostrider
cpuminer-gr/cpuminer --time-limit=$DURATION -r 0 -a gr -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 -u $PAYADDR -p c=$PAYCOIN  

# - groestl
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a groestl -o stratum+tcp://groestl.eu.mine.zpool.ca:5333 -u $PAYADDR -p c=$PAYCOIN 
 
# - hmq1725
# worked 2021
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a hmq1725 -o stratum+tcp://hmq1725.eu.mine.zpool.ca:3747 -u $PAYADDR -p c=$PAYCOIN  

# - keccak
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a keccak -o stratum+tcp://keccak.eu.mine.zpool.ca:5133 -u $PAYADDR -p c=$PAYCOIN  

# - lbry
# FPGA only

# - lyra2v2
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a lyra2rev2 -o stratum+tcp://lyra2v2.na.mine.zpool.ca:4533 -u $PAYADDR -p c=$PAYCOIN  

# - lyra2z
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a lyra2z -o stratum+tcp://lyra2z.eu.mine.zpool.ca:4553 -u $PAYADDR -p c=$PAYCOIN 

# - lyra2z330
cpuminer-opt/cpumine --time-limit=$DURATION  -r 0 -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $PAYADDR -p c=$PAYCOIN 

# - m7m
# worked 2021
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $PAYADDR -p c=$PAYCOIN 

# - megabtx
# GPU 

# - megamec
#GPU

# - myr-gr
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a myr-gr -o stratum+tcp://myr-gr.eu.mine.zpool.ca:5433 -u $PAYADDR -p c=$PAYCOIN

# - neoscrypt
# worked Mar 2021
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a neoscrypt -o stratum+tcp://neoscrypt.eu.mine.zpool.ca:4233 -u $PAYADDR -p c=$PAYCOIN 

# - power2b
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $PAYADDR -p c=$PAYCOIN 

# - quark
cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a quark -o stratum+tcp://quark.eu.mine.zpool.ca:4033 -u $PAYADDR -p c=$PAYCOIN 

# - qubit
# GPU

# - scrypt
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a scrypt -o stratum+tcp://scrypt.eu.mine.zpool.ca:3433 -u $PAYADDR -p c=$PAYCOIN

# - scryptn11
# GPU / Abandoned?

# - sha256
# GPU

# - sha256t
cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a sha256t -o stratum+tcp://sha256t.eu.mine.zpool.ca:3339 -u $PAYADDR -p c=$PAYCOIN
 
# - sha3d
 cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a sha3d -o stratum+tcp://sha3d.eu.mine.zpool.ca:3340 -u $PAYADDR -p c=$PAYCOIN 
 
# - skein
 cpuminer-opt/cpuminer   --time-limit=$DURATION-r 0 -a skein -o stratum+tcp://skein.eu.mine.zpool.ca:4933 -u $PAYADDR -p c=$PAYCOIN 
 
# - skein2
 cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a skein2 -o stratum+tcp://skein2.eu.mine.zpool.ca:5233 -u $PAYADDR -p c=$PAYCOIN 
 
# - skunk
 cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a skunk -o stratum+tcp://skunk.eu.mine.zpool.ca:8433 -u $PAYADDR -p c=$PAYCOIN 
 
# - tribus
 cpuminer-opt/cpuminer  --time-limit=$DURATION -r 0 -a tribus -o stratum+tcp://tribus.eu.mine.zpool.ca:8533 -u $PAYADDR -p c=$PAYCOIN 

# - x11
 cpuminer-opt/cpuminer   --time-limit=$DURATION -r 0 -a x11 -o stratum+tcp://x11.eu.mine.zpool.ca:3533 -u $PAYADDR -p c=$PAYCOIN 
 
# - x13
 cpuminer-opt/cpuminer   --time-limit=$DURATION -r 0 -a x13 -o stratum+tcp://x13.eu.mine.zpool.ca:3633 -u $PAYADDR -p c=$PAYCOIN 
 
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
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x21s  -o stratum+tcp://x21s.eu.mine.zpool.ca:3224 -u $PAYADDR -p c=$PAYCOIN

# - x25x
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a x25x -o stratum+tcp://x25x.eu.mine.zpool.ca:3423 -u $PAYADDR -p c=$PAYCOIN
# Mar 2021 - works
 
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
isotopec-cpuminer/cpuminer --time-limit=$DURATION -r 0 -a yespowerIC -o stratum+tcp://yespowerIC.eu.mine.zpool.ca:6243 -u $PAYADDR -p c=$PAYCOIN
# NOT WORKING

# - yespowerLNC
# worked 2021
isotopec-cpuminer/cpuminer --time-limit=$DURATION -r 0 -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u $PAYADDR -p c=$PAYCOIN

# - yespowerR16
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $PAYADDR -p c=$PAYCOIN

