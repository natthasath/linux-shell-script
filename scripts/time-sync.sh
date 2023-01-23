#!/bin/bash

# Get current NTP servers
ntp_servers=$(grep "^NTP=" /etc/systemd/timesyncd.conf | awk -F= '{print $2}')

# Add new NTP server to list
ntp_servers="$ntp_servers th.pool.ntp.org"

# Update timesyncd.conf file
sudo sed -i '/NTP/ s/^#//' /etc/systemd/timesyncd.conf
sudo sed -i "s/^NTP=.*/NTP=$ntp_servers/" /etc/systemd/timesyncd.conf

# Restart timesyncd service
sudo systemctl restart systemd-timesyncd

sudo timedatectl set-timezone Asia/Bangkok
sudo systemctl restart systemd-timesyncd