#!/bin/bash 

scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/gensort root@54.89.147.12:/root
scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/valsort root@54.89.147.12:/root
scp -i hadoop.pem /home/snehal/pa2/SparkCode.scala root@54.89.147.12:/root