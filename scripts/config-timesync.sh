#!/bin/bash

# NTP servers to add
servers=("time.navy.mi.th" "clock.nectec.or.th" "time.uni.net.th")

# Clear the current NTP server entries
sed -i '/^NTP=/d' /etc/systemd/timesyncd.conf

# Add the new NTP servers
for server in "${servers[@]}"
do
    echo "NTP=$server" >> /etc/systemd/timesyncd.conf
done

# Set the timezone
sudo timedatectl set-timezone Asia/Bangkok

# Restart the timesyncd service
systemctl restart systemd-timesyncd