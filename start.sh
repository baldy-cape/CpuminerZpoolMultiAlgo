#!/bin/bash

function help {
 echo "Script to perform MultiAlgo CPU mining on Zpool.ca
laurence.baldwin@gmail.com April 2021.
==================================================
-c Coin to be paid in 
-w Wallet address for payments
-h help" 
 exit 1
}

while getopts ':c:w:h' opt; do
    case $opt in
      (h)   help;;
      (w)   WALLET=$OPTARG;;
      (c)   COIN=$OPTARG;;
    esac
done

if [  -z "$WALLET" ]; then WALLET="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8"; fi
if [  -z "$COIN" ]; then COIN="KMD"; fi
BMSEC=60
BMRETRY=5

echo "Payments will be sent to $COIN $WALLET"

echo "Starting Benchmarks"
HASH=$(echo "$(/cpuminer-opt/cpuminer -a allium --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "allium $HASH MH/s"
FACTOR="allium=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a argon2d4096 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "argon2d4096 $HASH MH/s"
FACTOR="$FACTOR,argon2d4096=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a argon2d500 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "argon2d500 $HASH MH/s"
FACTOR="$FACTOR,argon2d500=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-easy-binarium/cpuminer -a Binarium_hash_v1 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "binarium $HASH MH/s"
FACTOR="$FACTOR,binarium-v1=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a bmw512 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 /1000" | bc -l | awk '{printf "%.8f", $0}')
echo "bmw512 $HASH GH/s"
FACTOR="$FACTOR,bmw512=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

for i in {1..$BMRETRY}; do 
  # Benchmark is buggy and randomly gives 0, as a work around try 3 times
  HASH=$(echo "$(/cpuminer-opt-cpupower/cpuminer -a cpupower --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
  if [ $HASH != "0.00000000" ]; then break; fi 
  echo "cpupower benchmark failed: Attempt $i" 
done
echo "cpupower $HASH KH/s"
FACTOR="$FACTOR,cpupower=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# benchmark not reliable, instead mine for real. 
HASH=$(/cpuminer-curvehash/cpuminer -a curvehash -f 0x10000 -o stratum+tcp://curve.eu.mine.zpool.ca:4633 --time-limit=$BMSEC -u $WALLET -p c=$COIN  --no-color -q | grep "accepted: " | tail -1  | cut -f7 -d" ")
echo "curve $HASH KH/s"
FACTOR="$FACTOR,curve=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# Disable Ghostrider as payout is too slow. 
#for i in {1..$BMRETRY}; do
#  # Benchmark is buggy and randomly gives 0, as a work around try 3 times
#  HASH=$(echo "$(/cpuminer-gr/cpuminer -a gr --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 " | bc -l | awk '{printf "%.8f", $0}')
#  if [ $HASH != "0.00000000" ]; then break; fi
#  echo "ghostrider benchmark failed: Attempt $i"
#done
#echo "ghostrider $HASH KH/s"
#FACTOR="$FACTOR,ghostrider=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
#unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a keccakc --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 /1000" | bc -l | awk '{printf "%.8f", $0}')
echo "keccakc $HASH GH/s"
FACTOR="$FACTOR,keccakc=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a lyra2rev3 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 /1000" | bc -l | awk '{printf "%.8f", $0}')
echo "lyra2v3 $HASH GH/s"
FACTOR="$FACTOR,lyra2v3=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a lyra2z --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 /1000" | bc -l | awk '{printf "%.8f", $0}')
echo "lyra2z $HASH GH/s"
FACTOR="$FACTOR,lyra2z=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# zpool uses MH/s for lyra2z330
HASH=$(echo "$(/cpuminer-opt/cpuminer -a lyra2z330 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "lyra2z330 $HASH MH/s"
FACTOR="$FACTOR,lyra2z330=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# zpool used MH/s for m7m
HASH=$(echo "$(/cpuminer-opt/cpuminer -a m7m --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "m7m $HASH MH/s"
FACTOR="$FACTOR,m7m=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a power2b --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "power2b $HASH KH/s"
FACTOR="$FACTOR,power2b=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a phi2 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "phi2 $HASH MH/s"
FACTOR="$FACTOR,phi2=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a x11gost --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "sib $HASH GH/s"
FACTOR="$FACTOR,sib=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a x14 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "x14 $HASH GH/s"
FACTOR="$FACTOR,x14=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a x21s --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "x21s $HASH MH/s"
FACTOR="$FACTOR,x21s=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a x16r --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "x16r $HASH GH/s"
FACTOR="$FACTOR,x16r=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a x25x --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "x25x $HASH MH/s"
FACTOR="$FACTOR,x25x=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yescrypt --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yescrypt $HASH KH/s"
FACTOR="$FACTOR,yescrypt=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yescryptr32 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yescryptr32 $HASH KH/s"
FACTOR="$FACTOR,yescryptR32=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yespower --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespower $HASH KH/s"
FACTOR="$FACTOR,yespower=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

for i in {1..$BMRETRY}; do
  # Benchmark is buggy and randomly gives 0, as a work around try 3 times
  HASH=$(echo "$(/isotopec-cpuminer/cpuminer -a yespowerIC --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
  if [ $HASH != "0.00000000" ]; then break; fi
  echo "yespowerIC benchmark failed: Attempt $i"
done
echo "yespowerIC $HASH KH/s"
FACTOR="$FACTOR,yespowerIC=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

for i in {1..$BMRETRY}; do
  # Benchmark is buggy and randomly gives 0, as a work around try 5 times
  HASH=$(echo "$(/isotopec-cpuminer/cpuminer -a yespowerltncg --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
  if [ $HASH != "0.00000000" ]; then break; fi
  echo "yespowerltncg  benchmark failed: Attempt $i"
done
echo "yespowerLNC $HASH KH/s"
FACTOR="$FACTOR,yespowerLNC=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yespowerr16 --benchmark --time-limit=$BMSEC 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespowerr16 $HASH KH/s"
FACTOR="$FACTOR,yespowerR16=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

echo "Factor settings to be used: $FACTOR"

while true; 
do
 /cpuminer-opt/cpuminer -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a argon2d4096 -o stratum+tcp://argon2d4096.eu.mine.zpool.ca:4240 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a argon2d500 -o stratum+tcp://argon2d500.eu.mine.zpool.ca:4239 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-easy-binarium/cpuminer -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a bmw512 -o stratum+tcp://bmw512.eu.mine.zpool.ca:5787 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt-cpupower/cpuminer -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-curvehash/cpuminer -r 0 -a curvehash -f 0x10000 -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
# /cpuminer-gr/cpuminer -r 0 -a gr -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a keccakc -o stratum+tcp://keccakc.eu.mine.zpool.ca:5134 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a lyra2rev3 -o stratum+tcp://lyra2v3.eu.mine.zpool.ca:4550 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a lyra2z -o stratum+tcp://lyra2z.eu.mine.zpool.ca:4553 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a phi2 -o stratum+tcp://phi2.eu.mine.zpool.ca:8332 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a x11gost -o stratum+tcp://sib.eu.mine.zpool.ca:5033 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a x14 -o stratum+tcp://x14.eu.mine.zpool.ca:3933 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a x21s  -o stratum+tcp://x21s.eu.mine.zpool.ca:3224-u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a x16r -o stratum+tcp://x16r.eu.mine.zpool.ca:3636 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a x25x -o stratum+tcp://x25x.eu.mine.zpool.ca:3423 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /isotopec-cpuminer/cpuminer -r 0 -a yespowerIC -o stratum+tcp://yespowerIC.eu.mine.zpool.ca:6243 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /isotopec-cpuminer/cpuminer -r 0 -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 sleep 5 # just room to breath if pool is down
done
