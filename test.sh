#/bin/bash
PAYCOIN="KMD"
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"
DURATION=600 # how long to test each algo in seconds

## allium 
cpuminer-opt/cpuminer --time-limit=$DURATION -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u$PAYADDR -pc=$PAYCOIN
## argon2d4096
#GPU only

exit

## argon2d500u
Hash rate       8283.32h/s   8301.23h/s   (5957.30h/s)

## bcd
GPU only

## binarium-v1
./cpuminer-easy/cpuminer -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8 -p c=KMD

## blake2b
GPU only 

## blake2s
GPU only 

## blakecoin
GPU only 

## bmw512
36.7 MH/s

## cpupower
335.1 H/s

## curve
Connects but not accepted using rplant. 

root@fedora:/SRBMiner-Multi-0-5-8#  ./SRBMiner-MULTI --disable-gpu --algorithm curvehash --pool stratum+tcp://curve.eu.mine.zpool.ca:4633 --wallet RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8 --password c=KMD
Internet not found! Please insert internet into miner


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
