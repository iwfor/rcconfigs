#!/bin/bash

# Install typical set of packages for Ubuntu 16.04

#echo "America/Denver" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get update
sudo apt-get upgrade -y
# Make sure the system is remotely accessible before continuing onto bigger install
sudo apt-get install -y \
    openssh-server \
    screen \
    vim \
    zsh
# Now install the big package list
sudo apt-get install -y \
    arduino \
    autoconf \
    automake \
    btrfs-tools \
    build-essential \
    checkinstall \
    clang \
    cscope \
    curl \
    dfu-programmer \
    dfu-util \
    exfat-fuse \
    exfat-utils \
    fbreader \
    firefox \
    fonts-hack-otf \
    fonts-hack-ttf \
    fonts-hack-web \
    ghc \
    git \
    gnome-keyring \
    gnupg \
    indicator-application \
    jfsutils \
    jmtpfs \
    lftp \
    libappindicator1 \
    libavcodec-dev \
    libavutil-dev \
    libclang-3.8-dev \
    libcurl4-openssl-dev \
    libdvdread4 \
    libexpat1-dev \
    libfaac-dev \
    libgcrypt20-dev \
    libgnome-keyring-dev \
    libgpac-dev \
    libicu-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libotr5-bin \
    libqt5webkit5-dev \
    libqwt-qt5-dev \
    libreadline-dev \
    librtmp-dev \
    libsqlite3-dev \
    libssl-dev \
    libtheora-dev \
    libtool \
    libvorbis-dev \
    libwebkit-dev \
    libx264-dev \
    libyaml-dev \
    mediainfo \
    mpc \
    mpd \
    mpg123 \
    mplayer \
    mtpfs \
    ncmpcpp \
    nodejs \
    npm \
    ntfs-3g \
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
    python-apt \
    python-pip \
    python-virtualenv \
    qt5-default \
    smartmontools \
    sqlite3 \
    sshfs \
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
    vim-gtk \
    vlc \
    w3m-img \
    whois \
    xdotool \
    xfsprogs \
    xserver-xorg-dev \
    xterm \
    yasm \
    zlib1g-dev \
    ;

# Webex prerequisites. based on http://askubuntu.com/questions/115094/webex-desktop-sharing-on-64-bit-ubuntu
sudo apt-get install -y openjdk-8-jre:i386 libxmu6:i386 icedtea-8-plugin
sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so

# Add the wine ppa
echo "===> Setting up Wine"
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install -y \
    wine1.8 \
    playonlinux \
    winbind \
    wine-gecko2.21 \
    wine-mono0.0.8 \

# Disable mpd running as system
sudo update-rc.d mpd disable
sudo /etc/init.d/mpd stop

# If in a country that allows it, install deCSS for DVD play back:
#sudo apt-get install -y libdvd-pkg
#sudo dpkg-reconfigure libdvd-pkg

# Add repository for graphics drivers
sudo apt-add-repository -y ppa:graphics-drivers/ppa

echo "===> Installing HandBrake"
sudo add-apt-repository -y ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get install -y handbrake-gtk handbrake-cli

echo "===> Installing Java"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# If you've accepted the Oracle license before, you can uncomment this line to
# skip the license prompt
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Update node/npm (installs to /usr/local by default)
sudo npm install n -g
sudo n v6.9.4
sudo npm install npm -g

# Disable the global mpd service since we only run it as a user
sudo service mpd stop
sudo update-rc.d mpd disable
