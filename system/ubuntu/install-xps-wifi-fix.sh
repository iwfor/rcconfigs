#!/bin/bash

echo "Installing XPS 13 workaround to reload iwlwifi kernel module on resume"

if [ ! -e /etc/systemd/system ] ; then
    echo "Expected /etc/systemd/system directory to exist. Using systemd?"
    exit 1
fi

sudo mkdir -p /etc/xps13
sudo cp resume_wifi /etc/xps13
sudo chmod +x /etc/xps13/resume_wifi

sudo cp resume-wifi-xps.service /etc/systemd/system/
sudo systemctl enable /etc/systemd/system/resume-wifi-xps.service
