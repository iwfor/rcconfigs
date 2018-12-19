#!/bin/bash

# Update node/npm (installs to /usr/local by default)
sudo apt install -y nodejs npm
sudo npm install n -g
sudo n lts
sudo npm install npm -g
