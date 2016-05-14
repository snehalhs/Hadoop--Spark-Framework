#!/bin/bash

sudo mkfs.ext4 /dev/xvdd
sudo mke2fs -F  -t  ext4 /dev/xvdd
sudo mkdir /mountsize
sudo mount /dev/xvdd /mountsize
sudo chmod 777 /mountsize
cd /home/ubuntu/hadoop-2.7.2/etc/hadoop
sudo vim slaves
cd /etc
sudo vim hosts
cd /home/ubuntu 
eval "$(ssh-agent)"
ssh-keygen  -t rsa
eval "$(ssh-agent)"
ssh-add hadoop.pem
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-52-90-68-182.compute-1.amazonaws.com
chmod 600 ~/.ssh/authorized_keys