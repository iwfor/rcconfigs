#!/bin/bash

# Install typical set of packages for Ubuntu 17.04

#echo "America/Denver" | sudo tee /etc/timezone
#sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt update
sudo apt upgrade -y
# Make sure the system is remotely accessible before continuing onto bigger install
sudo apt install -y \
    inetutils-tools \
    openssh-server \
    screen \
    vim \
    zsh
# Now install the big package list
sudo apt install -y \
    arduino \
    autoconf \
    automake \
    btrfs-tools \
    bridge-utils \
    build-essential \
    checkinstall \
    clang \
    cscope \
    curl \
    dfu-programmer \
    dfu-util \
    espeak \
    ethtool \
    exfat-fuse \
    exfat-utils \
    fbreader \
    firefox \
    fonts-hack-otf \
    fonts-hack-ttf \
    fonts-hack-web \
    gconf2 \
    ghc \
    git \
    gnome-keyring \
    gnome-themes-standard \
    gnupg \
    gvfs-bin \
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
    libjsoncpp-dev \
    libmagic-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libotr5-bin \
    libpango1.0-0 \
    libpq-dev \
    libpulse-dev \
    libqt5webkit5-dev \
    libqwt-qt5-dev \
    libreadline-dev \
    librtmp-dev \
    libsqlite3-dev \
    libssl-dev \
    libtheora-dev \
    libtool \
    libudev-dev \
    libvorbis-dev \
    libwebkitgtk-dev \
    libx264-dev \
    libxv-dev \
    libyaml-dev \
    mdadm \
    mediainfo \
    mpg123 \
    mplayer \
    mtpfs \
    net-tools \
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
    sox \
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
    vim-gtk3 \
    vlc \
    w3m-img \
    whois \
    xdotool \
    xfsprogs \
    xserver-xorg-dev \
    xterm \
    yasm \
    zenity \
    zlib1g-dev \
    ;

# Install Intel microcode updates
sudo apt install -y intel-microcode

# Install freeglut3 so slic3r works
sudo apt install -y freeglut3

# Webex prerequisites. based on http://askubuntu.com/questions/115094/webex-desktop-sharing-on-64-bit-ubuntu
sudo apt install -y openjdk-8-jre:i386 libxmu6:i386 icedtea-8-plugin
sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so

# Add repository for graphics drivers
sudo apt-add-repository -y ppa:graphics-drivers/ppa

# Disable the global mpd service since we only run it as a user
sudo service mpd stop
sudo update-rc.d mpd disable
