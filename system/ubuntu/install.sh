#!/bin/bash

echo "America/Denver" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    autoconf \
    automake \
    build-essential \
    checkinstall \
    clang \
    curl \
    fbreader \
    git \
    gnupg \
    lftp \
    libcurl4-openssl-dev \
    libavcodec-dev \
    libavutil-dev \
    libdvdread4 \
    libexpat-dev \
    libfaac-dev \
    libgpac-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libreadline-dev \
    librtmp-dev \
    libsqlite3-dev \
    libssl-dev \
    libtheora-dev \
    libtool \
    libvorbis-dev \
    libx264-dev \
    libyaml-dev \
    mpg123 \
    mplayer \
    nodejs \
    p7zip-full \
    pkg-config \
    python-pip \
    python-virtualenv \
    screen \
    sqlite3 \
    subversion \
    texi2html \
    tmux \
    vim \
    vim-gtk \
    vlc \
    w3m-img \
    whois \
    xdotool \
    yasm \
    zlib1g-dev \
    zsh \
    ;

# If in a country that allows it, install deCSS for DVD play back:
#sudo /usr/share/doc/libdvdread4/install-css.sh

sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get install -y handbrake-gtk handbrake-cli

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# If you've accepted the Oracle license before, you can uncomment this line to
# skip the license prompt
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer

