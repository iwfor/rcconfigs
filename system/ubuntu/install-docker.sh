#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install -y docker-ce docker-compose
sudo usermod -aG docker ${USER}

declare DOCKERCFG=/etc/grub.d/42_docker
sudo cp assets/42_docker $DOCKERCFG
sudo chmod 0755 $DOCKERCFG
sudo update-grub

#sudo systemctl status docker
