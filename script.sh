#!/bin/bash


sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo apt-get install python3 python3.9-venv -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

sudo usermod -a -G docker ec2-user

cd /home/ubuntu

sudo -u ubuntu git clone  https://${gitLogin}:${gitPass}@github.com/MaksimAstapkovich/InfrastructureJenkins.git


cd InfrastructureJenkins/container

sed -i "s/lolol/${gitPass}/" ./scripts/scr_02_cred.groovy
sed -i "s/kokok/${gitPass}/" ./scripts/scr_02_cred.groovy

var=`docker ps | grep jenkins | cut -d" " -f1`

echo MY_IP_I=`curl https://ipecho.net/plain ` > ./envv

docker-compose up -d

sudo docker exec -it `docker ps | grep jenkins | cut -d" " -f1` apt-get update

sudo docker exec -it `docker ps | grep jenkins | cut -d" " -f1` apt-get install -y docker.io

