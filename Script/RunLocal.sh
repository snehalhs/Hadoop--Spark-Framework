#!/bin/bash 

scp -i hadoop.pem /home/snehal/pa2/hadoop.pem ubuntu@54.84.51.237:/home/ubuntu
scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/gensort ubuntu@54.84.51.237:/home/ubuntu
scp -i hadoop.pem /home/snehal/pa2/gensort-linux-1.5/64/valsort ubuntu@54.84.51.237:/home/ubuntu

