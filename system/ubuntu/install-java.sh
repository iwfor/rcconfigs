#!/bin/bash

echo "===> Installing Java"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
# Skip the license prompt
if [ "$1" = "-y" -o "$1" = '--yes' ] ; then
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
fi
sudo apt install -y oracle-java8-installer
