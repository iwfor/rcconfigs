#!/bin/bash

echo "America/Denver" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    autoconf \
    automake \
    build-essential \
    clang \
    curl \
    fbreader \
    git \
    gnupg \
    lftp \
    libcurl4-openssl-dev \
    libdvdread4 \
    libexpat-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libyaml-dev \
    mpg123 \
    mplayer \
    nodejs \
    p7zip-full \
    python-pip \
    python-virtualenv \
    screen \
    sqlite3 \
    subversion \
    tmux \
    vim \
    vim-gtk \
    vlc \
    w3m-img \
    whois \
    zlib1g-dev \
    zsh \
    ;

# If in a country that allows it, install deCSS for DVD play back:
#sudo /usr/share/doc/libdvdread4/install-css.sh

sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get install -y handbrake-gtk handbrake-cli
