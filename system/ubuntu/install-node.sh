#!/bin/bash

# Update node/npm (installs to /usr/local by default)
sudo apt install -y nodejs npm
sudo npm install n -g
#sudo n v6.11.5
sudo n v8.11.3
sudo npm install npm -g
