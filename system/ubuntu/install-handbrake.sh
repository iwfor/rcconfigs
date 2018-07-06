#!/bin/bash

# If in a country that allows it, install deCSS for DVD play back:
if [ "$1" = "-y" -o "$1" = '--yes' ] ; then
    sudo apt install -y libdvd-pkg
    sudo dpkg-reconfigure libdvd-pkg
fi

echo "===> Installing HandBrake"
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo apt update
sudo apt install -y handbrake-gtk handbrake-cli

