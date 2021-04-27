# CpuminerZpoolMultiAlgo
Docker image for CPU mining of crypto coins on Zpool mining pool. 

Supports a large number of CPU compatible crypto currencies via numerious forks of cpuminer. 

Zpool Mining Pool (https://zpool.ca/) has a MultiAlgo (Multiple Algorith https://zpool.ca/multialgo) feature which automatically switches to the most profitable algorith to mine. This is setup and working in this docker image. 

Payouts from zpool are possible in any crypto currency coin that they list but only guarenteed in BTC, LTC. DASH, DGB and KMD.

When starting the container, it will benchmark each algorithm before then starting to mine the most profitable. 

## Usage
Assuming you have docker installed (https://docs.docker.com/get-docker/)

### Build
```
$ docker build -t cpuminer https://github.com/baldy-cape/CpuminerZpoolMultiAlgo.git 
```
This may take some time as it downloads and compiles all the different versions of cpuminer 
 
### Run
```
$ docker run -d --restart always  --name mining cpuminer -c DGB -w DDsiPmx2cJmELsYvtwXXJgue6MKTL9qNr5
```
Where DDsiPmx2cJmELsYvtwXXJgue6MKTL9qNr5 is your wallet address for payouts and DGB is that wallets type of coin. 

To check the status 
```
$ docker logs mining
Payments will be sent to DGB DDsiPmx2cJmELsYvtwXXJgue6MKTL9qNr5
Starting Benchmarks
allium 0.34794400 MH/s
```
Initially you will see the benchmark being performed, then it will start mining the most profitable algorithm. 

Check your payouts on zpool -> https://zpool.ca/wallet searching for your wallet address. 

### Stop and start 
To stop the container 
```
$ docker stop mining
```
To start the container again
```
$ docker start mining
```
