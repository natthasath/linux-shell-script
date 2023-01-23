#!/bin/bash

# Config new NTP Servers
config_ntp_servers="th.pool.ntp.org"

# Get current NTP servers
current_ntp_servers=$(grep "^NTP=" /etc/systemd/timesyncd.conf | awk -F= '{print $2}')

# Add new NTP server to list
new_ntp_servers=$config_ntp_servers

# Update timesyncd.conf file
sudo sed -i '/NTP/ s/^#//' /etc/systemd/timesyncd.conf
sudo sed -i "s/^NTP=.*/NTP=$new_ntp_servers/" /etc/systemd/timesyncd.conf

# Restart timesyncd service
sudo systemctl restart systemd-timesyncd

sudo timedatectl set-timezone Asia/Bangkok
sudo systemctl restart systemd-timesyncd