#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install -y docker-ce docker-compose
sudo usermod -aG docker ${USER}

declare DOCKERCFG=/etc/grub.d/42_docker
echo '# Enable Linux kernel swap memory limit for docker' | sudo tee $DOCKERCFG
echo 'GRUB_CMDLINE_LINUX="${GRUB_CMDLINE_LINUX} cgroup_enable=memory swapaccount=1"' | sudo tee -a $DOCKERCFG
sudo update-grub

#sudo systemctl status docker
