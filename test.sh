#/bin/bash
PAYCOIN="KMD"
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"
DURATION=600 # how long to test each algo in seconds

## allium 
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u$PAYADDR -p c=$PAYCOIN

## argon2d4096
#GPU only

## argon2d500u
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a argon2d500 -o stratum+tcp://argon2d500.eu.mine.zpool.ca:4239 -u $PAYADDR -p c=$PAYCOIN 

## bcd
#GPU only

## binarium-v1
cpuminer-easy/cpuminer --time-limit=$DURATION -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $PAYADDR -p c=$PAYCOIN

## blake2b
#GPU only 

## blake2s
#GPU only 

## blakecoin
#GPU only 

## bmw512
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a bmw512 -o stratum+tcp://bmw512.eu.mine.zpool.ca:5787 -u $PAYADDR -p c=$PAYCOIN 

## cpupower
cpuminer-opt-cpupower/cpuminer --time-limit=$DURATION -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p c=$PAYCOIN 

## curve
cpuminer-curvehash/cpuminer --time-limit=$DURATION -r 0 -a curvehash -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p c=$PAYCOIN 

exit



equihash

equihash125

equihash144

ghostrider

groestl

hmq1725

keccak

lbry

lyra2v2

lyra2z

lyra2z330

m7m

megabtx

megamec

myr-gr

neoscrypt

odocrypt

power2b

quark

qubit

scrypt

scryptn11

sha256

sha256t

sha3d

sib

skein

skein2

skunk

tribus

x11

x13

x16r

x16s

x17

x25x

xevan

yescrypt

yescryptR32

yespower

yespowerLNC

yespowerR16
