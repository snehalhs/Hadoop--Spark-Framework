#!/bin/bash 

wget www-eu.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz
tar -xzvf spark-1.6.1-bin-hadoop2.6.tgz
chmod 400 /home/ubuntu/hadoop.pem 
eval `ssh-agent -s`
chmod 600 'hadoop.pem'
ssh-add 'hadoop.pem'
cd /spark-1.6.1-bin-hadoop2.6/ec2 
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
./spark-ec2 -k hadoop -i /home/ubuntu/hadoop.pem -s 16 -t c3.large --spot-price=0.03 -z us-west-2c launch Spark
./spark-ec2 -k hadoop -i /home/ubuntu/hadoop.pem login hadoop 

