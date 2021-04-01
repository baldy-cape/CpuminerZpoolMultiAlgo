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

RUN git clone https://github.com/CURVEHASH/cpuminer-curvehash.git
RUN cd cpuminer-curvehash/; chmod +x autogen.sh build.sh ; ./build.sh

RUN git clone https://github.com/bubasik/cpuminer-easy-binarium
RUN cd cpuminer-easy-binarium/ && ./build-ubuntu.sh

RUN git clone https://github.com/npq7721/cpuminer-gr.git
RUN cd cpuminer-gr/ && ./build.sh 

RUN git clone https://github.com/isotopec-org/isotopec-cpuminer
RUN cd isotopec-cpuminer/ && ./build.sh

ADD https://raw.githubusercontent.com/baldy-cape/AutomaticAlgoCpuMining/master/test.sh /
RUN chmod +x /test.sh


CMD ALGOS="binarium-v1,cpupower,ghostrider,lyra2z330,m7m,power2b,yescrypt,yescryptr32,yespower,yespowerIC,yespowerltncg,yespowerr16";\
PAYCOIN="DGB";\
PAYADDR="DDsiPmx2cJmELsYvtwXXJgue6MKTL9qNr5";\
while true; \
do\
 cpuminer-easy-binarium/cpuminer -r 0 -a Binarium_hash_v1 -o stratum+tcp://binarium-v1.eu.mine.zpool.ca:6666 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 cpuminer-opt-cpupower/cpuminer -r 0 -a cpupower -o stratum+tcp://cpupower.eu.mine.zpool.ca:6240 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 # Curve unreliable
 #cpuminer-curvehash/cpuminer -r 0 -a curvehash -o stratum+tcp://curve.eu.mine.zpool.ca:4633 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 cpuminer-gr/cpuminer -r 0 -a gr -o stratum+tcp://ghostrider.eu.mine.zpool.ca:5354 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 cpuminer-opt/cpumine -r 0 -a lyra2z330 -o stratum+tcp://lyra2z330.eu.mine.zpool.ca:4563 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 cpuminer-opt/cpuminer -r 0 -a m7m -o stratum+tcp://m7m.eu.mine.zpool.ca:6033 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 cpuminer-opt/cpuminer -r 0 -a power2b -o stratum+tcp://power2b.eu.mine.zpool.ca:6242 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 cpuminer-opt/cpuminer -r 0 -a yescrypt -o stratum+tcp://yescrypt.eu.mine.zpool.ca:6233 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 cpuminer-opt/cpuminer -r 0 -a yescryptr32 -o stratum+tcp://yescryptr32.eu.mine.zpool.ca:6343 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 cpuminer-opt/cpuminer -r 0 -a yespower -o stratum+tcp://yespower.eu.mine.zpool.ca:6234 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 isotopec-cpuminer/cpuminer -r 0 -a yespowerIC -o stratum+tcp://yespowerIC.eu.mine.zpool.ca:6243 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
 isotopec-cpuminer/cpuminer -r 0 -a yespowerltncg -o stratum+tcp://yespowerLNC.eu.mine.zpool.ca:6245 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN ;\
 cpuminer-opt/cpuminer -r 0 -a yespowerr16 -o stratum+tcp://yespowerr16.eu.mine.zpool.ca:6534 -u $PAYADDR -p $HOSTNAME,$ALGOS,c=$PAYCOIN;\
done
