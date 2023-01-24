#!/bin/bash

# Remove unnecessary packages
sudo apt-get autoremove -y

# Remove old kernels
sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d') -y

# Clear the package cache
sudo apt-get clean

# Remove temporary files
sudo rm -rf /tmp/*
sudo rm -rf ~/.cache/thumbnails/*

# Remove old log files
sudo find /var/log -type f -name "*.log" -delete
sudo find /var/log -type f -name "*.gz" -delete

# Remove old backups
sudo find ~ -name "*~" -delete