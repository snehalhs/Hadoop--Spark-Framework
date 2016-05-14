#!/bin/bash

sudo apt-get update
sudo apt-get install default-jdk
sudo apt-get install gcc -y
sudo apt-get install ssh
sudo apt-get install vim
ssh-keygen -t rsa -P ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
eval `ssh-agent -s`
chmod 400 hadoop.pem
ssh-add hadoop.pem
cd /home/ubuntu
wget archive.apache.org/dist/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz
tar -zxvf hadoop-2.7.2.tar.gz
chmod 777 hadoop-2.7.2
sudo mkfs.ext4 /dev/xvdd
sudo mke2fs -F  -t  ext4 /dev/xvdd
sudo mkdir /data
sudo mount /dev/xvdd /data
sudo chmod 777 /data
sudo vim .bashrc
cd /home/ubuntu/hadoop-2.7.2/etc/hadoop
sudo vim core-site.xml
sudo vim hadoop-env.sh
sudo vim hdfs-site.xml
sudo vim mapred-site.xml
sudo vim yarn-site.xml
