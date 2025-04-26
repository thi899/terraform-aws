#!/usr/bin/bash

sudo sudo
yum update -yum
yum install -y docker
service docker start
usermod -a -G docker ec2-user

docker run -p 80:8080 thiago8999/public-api:latest
