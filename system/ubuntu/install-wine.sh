#!/bin/bash

# Add the wine ppa (Not working in 17.04)
echo "===> Setting up Wine"
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install -y \
    wine2.0 \
    playonlinux \
    winbind \
    wine-gecko2.21 \
    wine-mono0.0.8 \

