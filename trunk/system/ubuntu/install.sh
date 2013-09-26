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
    git \
    gnupg \
    lftp \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libyaml-dev \
    nodejs \
    p7zip-full \
    screen \
    sqlite3 \
    subversion \
    tmux \
    vim \
    whois \
    zlib1g-dev \
    zsh \
    ;
