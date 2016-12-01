#!/bin/bash

# Install typical set of packages for Ubuntu 16.04

echo "America/Denver" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
    arduino \
    autoconf \
    automake \
    build-essential \
    checkinstall \
    clang \
    curl \
    dfu-programmer \
    dfu-util \
    fbreader \
    fonts-hack-otf \
    fonts-hack-ttf \
    fonts-hack-web \
    ghc \
    git \
    gnupg \
    lftp \
    libavcodec-dev \
    libavutil-dev \
    libcurl4-openssl-dev \
    libdvdread4 \
    libexpat1-dev \
    libfaac-dev \
    libgpac-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libotr5-bin \
    libreadline-dev \
    librtmp-dev \
    libsqlite3-dev \
    libssl-dev \
    libtheora-dev \
    libtool \
    libvorbis-dev \
    libx264-dev \
    libyaml-dev \
    mediainfo \
    mpg123 \
    mpc \
    mpd \
    mplayer \
    ncmpcpp \
    nodejs \
    npm \
    p7zip-full \
    pandoc \
    pandoc-citeproc \
    pass \
    pidgin \
    pidgin-dev \
    pidgin-openpgp \
    pidgin-otr \
    pidgin-plugin-pack \
    pkg-config \
    python-pip \
    python-virtualenv \
    qt5-default \
    screen \
    sqlite3 \
    subversion \
    texi2html \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-luatex \
    texlive-xetex \
    thunderbird \
    tmux \
    ttf-mscorefonts-installer \
    unison \
    unzip \
    vim \
    vim-gtk \
    vlc \
    w3m-img \
    whois \
    xdotool \
    xserver-xorg-dev \
    yasm \
    zlib1g-dev \
    zsh \
    ;

# Disable mpd running as system
sudo update-rc.d mpd disable
sudo /etc/init.d/mpd stop

# If in a country that allows it, install deCSS for DVD play back:
#sudo apt-get install libdvd-pkg
#sudo dpkg-reconfigure libdvd-pkg

# Add repository for graphics drivers
sudo apt-add-repository -y ppa:graphics-drivers/ppa

sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get install -y handbrake-gtk handbrake-cli

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# If you've accepted the Oracle license before, you can uncomment this line to
# skip the license prompt
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer
