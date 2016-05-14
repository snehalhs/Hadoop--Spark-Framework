#!/bin/bash 


sudo apt-get update
sudo apt-get install default-jdk  
sudo apt-get install gcc -y
sudo apt-get install ssh
eval `ssh-agent -s`
chmod 600 'hadoop.pem'
ssh-add 'hadoop.pem'
ssh-keygen -t rsa -P ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
wget archive.apache.org/dist/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz
tar -zxvf hadoop-2.7.2.tar.gz
chmod 777 hadoop-2.7.2
sudo vim .bashrc
cd /home/ubuntu/hadoop-2.7.2/etc/hadoop
sudo vim core-site.xml
sudo vim hadoop-env.sh
sudo vim hdfs-site.xml
sudo vim mapred-site.xml
sudo vim yarn-site.xml
cd /home/ubuntu 
sudo mkfs.ext4 /dev/xvdd
sudo mke2fs -F  -t  ext4 /dev/xvdd
sudo mkdir /data
sudo mount /dev/xvdd /data
sudo chmod 777 /data
cd /home/ubuntu/hadoop-2.7.2/bin/
./hdfs namenode -format
cd /home/ubuntu/hadoop-2.7.2/sbin/
./start-dfs.sh 
./start-yarn.sh
cd /home/ubuntu/hadoop-2.7.2/
bin/hadoop fs -mkdir -p /user/ubuntu/gutenberg
cd /home/ubuntu 
./gensort -a 100000000 /data/input1 
cd /home/ubuntu/hadoop-2.7.2/
bin/hadoop dfs -copyFromLocal /data/input1 /user/ubuntu/gutenberg
bin/hadoop jar /home/ubuntu/HadoopTerasort.jar terasort /user/ubuntu/gutenberg /user/ubuntu/gutenberg-output
bin/hadoop dfs -getmerge /user/ubuntu/gutenberg-output /home/ubuntu/result
head -10 /home/ubuntu/result
tail -10f /home/ubuntu/result

