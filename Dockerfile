FROM ubuntu:20.04
LABEL maintainer="laurence.baldwin@gmail.com"
RUN apt-get update -qq 
RUN apt-get install -qy build-essential git libtool libjansson-dev libssl-dev libcurl4-openssl-dev libncurses5-dev libgmp-dev automake libz-dev 

RUN git clone https://github.com/JayDDee/cpuminer-opt 
RUN cd cpuminer-opt && ./build.sh  

RUN apt-get install -qy autoconf g++ lib32z1-dev
RUN git clone https://github.com/cpu-pool/cpuminer-opt-cpupower.git
RUN chmod +x /cpuminer-opt-cpupower/build.sh
RUN cd cpuminer-opt-cpupower/ && ./build.sh

ADD https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.11/cpuminer-opt-linux.tar.gz /
RUN tar xvzf /cpuminer-opt-linux.tar.gz

RUN git clone https://github.com/binariumpay/cpuminer-easy.git
RUN cd cpuminer-easy/ && ./build-ubuntu.sh

ADD https://github.com/doktor83/SRBMiner-Multi/releases/download/0.7.1/SRBMiner-Multi-0-7-1-Linux.tar.xz /
RUN tar vxf SRBMiner-Multi-0-7-1-Linux.tar.xz

CMD ALGOS="allium,argon2d500,binarium-v1,bmw512,curve,hmq1725,keccak,lyra2z,lyra2z330,m7m,myr-gr,neoscrypt,power2b,quark,scrypt,sha256t,sha3d,skein,skein2,skunk,tribus,x11,x13,x16rv2,x16s,x17,x21s,x25x,xevan,yescrypt,yescryptr32,yespower,yespowerr16,cpupower";\
PAYCOIN="KMD";\
PAYADDR="RLHaW85aMae4TBTU8KXgd3utfZQ7pexSY8";\
while true; \
do\
 cpuminer-easy/cpuminer -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 /cpuminer-avx2  -r 0 -a curvehash -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt-cpupower/cpuminer -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a allium -o stratum+tcp://allium.eu.mine.zpool.ca:6433 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a argon2d500 -o stratum+tcp://argon2d500.eu.mine.zpool.ca:4239 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a bmw512 -o stratum+tcp://bmw512.eu.mine.zpool.ca:5787 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a hmq1725 -o stratum+tcp://hmq1725.eu.mine.zpool.ca:3747 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a keccak -o stratum+tcp://keccak.eu.mine.zpool.ca:5133 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a lyra2z -o stratum+tcp://lyra2z.eu.mine.zpool.ca:4553 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a myr-gr -o stratum+tcp://myr-gr.eu.mine.zpool.ca:5433 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a neoscrypt -o stratum+tcp://neoscrypt.eu.mine.zpool.ca:4233 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a quark -o stratum+tcp://quark.eu.mine.zpool.ca:4033 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 #cpuminer-opt/cpuminer -r 0 -a qubit -o stratum+tcp://qubit.eu.mine.zpool.ca:4733 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a scrypt -o stratum+tcp://scrypt.eu.mine.zpool.ca:3433 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a sha256t -o stratum+tcp://sha256t.eu.mine.zpool.ca:3339 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a sha3d -o stratum+tcp://sha3d.eu.mine.zpool.ca:3340 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a skein -o stratum+tcp://skein.eu.mine.zpool.ca:4933 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a skein2 -o stratum+tcp://skein2.eu.mine.zpool.ca:5233 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a skunk -o stratum+tcp://skunk.eu.mine.zpool.ca:8433 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a tribus -o stratum+tcp://tribus.eu.mine.zpool.ca:8533 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x11 -o stratum+tcp://x11.eu.mine.zpool.ca:3533 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x13 -o stratum+tcp://x13.eu.mine.zpool.ca:3633 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x16rv2 -o stratum+tcp://x16rv2.eu.mine.zpool.ca:3637 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x16s -o stratum+tcp://x16s.eu.mine.zpool.ca:3663 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x17 -o stratum+tcp://x17.eu.mine.zpool.ca:3737 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x21s -o stratum+tcp://x21s.eu.mine.zpool.ca:3224 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a x25x -o stratum+tcp://x25x.eu.mine.zpool.ca:3423 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a xevan -o stratum+tcp://xevan.eu.mine.zpool.ca:3739 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
 cpuminer-opt/cpuminer -r 0 -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN --no-color -q;\
done
