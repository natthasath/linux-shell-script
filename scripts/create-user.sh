#!/bin/bash

# Get the input new user
user=$1

# Create new user
sudo adduser $user

# Add user to sudo group
sudo usermod -aG sudo $user

# Set password for new user
sudo passwd $user

# Verify new user and permissions
sudo cat /etc/group | grep sudo