#!/bin/bash

# Get the input new user
user=$1

# Update the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install essential packages
sudo apt-get install -y build-essential git curl wget unzip net-tools

# Install additional software
sudo apt-get install -y htop glances iftop nmap chkrootkit nano tree neovim clamav

# Install development tools
sudo apt-get install -y python3 python3-pip

# Create a new user
sudo adduser $user
sudo usermod -aG sudo $user

# Set up SSH for the new user
sudo su $user
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit

# Install a firewall
sudo apt-get install -y ufw
sudo ufw allow ssh
sudo ufw enable

# Enable automatic security updates
sudo apt-get install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades