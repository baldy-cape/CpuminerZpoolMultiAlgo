FROM ubuntu:20.04
LABEL maintainer="laurence.baldwin@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq 
RUN apt-get install -qy build-essential git libtool libjansson-dev libssl-dev libcurl4-openssl-dev libncurses5-dev libgmp-dev automake libz-dev sudo bc vim libglib2.0-0 libglib2.0-data libicu66 libxml2 pkg-config shared-mime-info tzdata xdg-user-dirs autoconf g++ lib32z1-dev

RUN git clone https://github.com/JayDDee/cpuminer-opt 
RUN cd cpuminer-opt && ./build.sh  

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

COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY test.sh /test.sh
RUN chmod +x /test.sh


ENTRYPOINT ["/start.sh"]

