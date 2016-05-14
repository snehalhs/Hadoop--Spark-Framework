#!/bin/bash 

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
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-52-90-143-48.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-165-7-232.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-165-65-45.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-85-106-15.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-173-231-189.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-173-132-3.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-173-95-125.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-89-112-24.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-52-91-137-40.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-172-66-178.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-52-90-169-137.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-89-122-163.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-173-68-102.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-52-90-141-123.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-85-72-182.compute-1.amazonaws.com
ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@ec2-54-173-128-111.compute-1.amazonaws.com
chmod 600 ~/.ssh/authorized_keys
cd /home/ubuntu/hadoop-2.7.2/bin
./hdfs namenode -format
cd /home/ubuntu/hadoop-2.7.2/sbin/
./start-dfs.sh 
./start-yarn.sh
cd /home/ubuntu
./gensort -a 1000000000 /data/input
cd /home/ubuntu/hadoop-2.7.2/
bin/hadoop fs -mkdir -p /user/ubuntu/gutenberg
bin/hadoop dfs -copyFromLocal /data/dataset /user/ubuntu/gutenberg
bin/hadoop jar /home/ubuntu/HadoopTerasort.jar 
bin/hadoop dfs -getmerge /user/ubuntu/gutenberg-output /data/result
./valsort /data/result
cd /data
head -10 result
tail -10f result