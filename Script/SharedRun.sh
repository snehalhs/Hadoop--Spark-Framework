#!/bin/bash 

sudo apt-get update
sudo apt-get install default-jdk 
sudo mkfs.ext4 /dev/xvdd
sudo mke2fs -F  -t  ext4 /dev/xvdd
sudo mkdir /data
sudo mount /dev/xvdd /data
sudo chmod 777 /data
./gensort -a 100000000 /data/input
cd /home/ubuntu/hadoop-2.7.2/
bin/hadoop fs -mkdir -p /user/ubuntu/gutenberg
bin/hadoop dfs -copyFromLocal /data/input /user/ubuntu/gutenberg
cd /home/ubuntu
javac SharedMemorySort.java
javac SplitThread.java 
java SharedMemorySort 1
bin/hadoop dfs -getmerge /user/ubuntu/gutenberg-output /data/result
cd /home/ubuntu
./valsort /data/result
head -10 /data/result
tail -10f /data/result