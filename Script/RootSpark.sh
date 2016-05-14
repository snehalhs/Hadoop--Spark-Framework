#!/bin/bash  

sudo mkfs.ext4 /dev/xvdp
sudo mke2fs -F  -t  ext4 /dev/xvdp
sudo mkdir /data
sudo mount /dev/xvdp /data
sudo chmod 777 /data
./gensort -a 100000000 /data/input
cd /ephemeral-hdfs
bin/hadoop fs -mkdir -p /user/ubuntu/gutenberg
bin/hadoop fs -Ddfs.replication=1 -put /data/input /user/ubuntu/gutenberg
cd /root/spark
cd /bin
./spark-shell -i /root/SparkCode.scala
cd /ephemeral-hdfs
bin/hadoop dfs -getmerge /user/ubuntu/output /data/result
head -10 /data/result 
tail -10f /data/result 