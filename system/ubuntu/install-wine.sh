#!/bin/bash

# Add the wine ppa (Not working in 17.04)
echo "===> Setting up Wine"
sudo dpkg --add-architecture i386
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ `lsb_release -sc` main"
sudo apt update
sudo apt install --install-recommends -y winehq-stable playonlinux
