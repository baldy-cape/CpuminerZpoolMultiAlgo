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

echo "Payments will be sent to $COIN $WALLET"

echo "Starting Benchmarks"
HASH=$(echo "$(/cpuminer-easy-binarium/cpuminer -a Binarium_hash_v1 --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "binarium $HASH MH/s"
FACTOR="binarium-v1=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt-cpupower/cpuminer -a cpupower --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "cpupower $HASH KH/s"
FACTOR="$FACTOR,cpupower=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# benchmark not reliable, instead mine for real. 
HASH=$(/cpuminer-curvehash/cpuminer -a curvehash -f 0x10000 -o stratum+tcp://curve.eu.mine.zpool.ca:4633 --time-limit=60 -u $WALLET -p c=$COIN  --no-color -q | grep "accepted: " | tail -1  | cut -f7 -d" ")
echo "curve $HASH KH/s"
FACTOR="$FACTOR,curve=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# benchmark not reliable, instead mine 
HASH=$(/cpuminer-gr/cpuminer -a gr  -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 --time-limit=60 -u $WALLET -p c=$COIN  --no-color --debug | grep "Miner " | tail -1  | cut -f7 -d" ")
echo "ghostrider $HASH KH/s"
FACTOR="$FACTOR,ghostrider=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# zpool uses MH/s for lyra2z330
HASH=$(echo "$(/cpuminer-opt/cpuminer -a lyra2z330 --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "lyra2z330 $HASH MH/s"
FACTOR="$FACTOR,lyra2z330=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

# zpool used MH/s for m7m
HASH=$(echo "$(/cpuminer-opt/cpuminer -a m7m --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000 / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "m7m $HASH MH/s"
FACTOR="$FACTOR,m7m=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a power2b --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "power2b $HASH KH/s"
FACTOR="$FACTOR,power2b=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yescrypt --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yescrypt $HASH KH/s"
FACTOR="$FACTOR,yescrypt=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yescryptr32 --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yescryptR32 $HASH KH/s"
FACTOR="$FACTOR,yescryptR32=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yespower --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespower $HASH KH/s"
FACTOR="$FACTOR,yespower=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/isotopec-cpuminer/cpuminer -a yespowerIC --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespowerIC $HASH KH/s"
FACTOR="$FACTOR,yespowerIC=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/isotopec-cpuminer/cpuminer -a yespowerltncg --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespowerLNC $HASH KH/s"
FACTOR="$FACTOR,yespowerLNC=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

HASH=$(echo "$(/cpuminer-opt/cpuminer -a yespowerr16 --benchmark --time-limit=60 2>&1 > /dev/null | tail -1) / 1000" | bc -l | awk '{printf "%.8f", $0}')
echo "yespowerR16 $HASH KH/s"
FACTOR="$FACTOR,yespowerR16=$(echo $HASH \* 1000 | bc -l | awk '{printf "%.2f", $0}')"
unset HASH

echo "Factor settings to be used: $FACTOR"

while true; 
do
 /cpuminer-easy-binarium/cpuminer -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt-cpupower/cpuminer -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-curvehash/cpuminer -r 0 -a curvehash -f 0x10000 -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-gr/cpuminer -r 0 -a gr -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /cpuminer-opt/cpuminer -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /isotopec-cpuminer/cpuminer -r 0 -a yespowerIC -o stratum+tcp://yespowerIC.eu.mine.zpool.ca:6243 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 /isotopec-cpuminer/cpuminer -r 0 -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN 
 /cpuminer-opt/cpuminer -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $WALLET -p $HOSTNAME,$FACTOR,c=$COIN
 sleep 5 # just room to breath if pool is down
done
