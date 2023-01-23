#!/bin/bash

# Create new user
sudo adduser admin

# Add user to sudo group
sudo usermod -aG sudo admin

# Set password for new user
sudo passwd admin

# Verify new user and permissions
sudo cat /etc/group | grep sudo