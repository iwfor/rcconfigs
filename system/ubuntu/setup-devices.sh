#!/bin/bash

echo 'ACTION=="add", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0042", SYMLINK+="mega2560"' | sudo tee /etc/udev/rules.d/80-arduino-mega-2560.rules
echo 'ACTION=="add", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="ad02", SYMLINK+="pc_receiver"' | sudo tee /etc/udev/rules.d/80-pc-receiver.rules
