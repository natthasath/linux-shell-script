#!/bin/bash

# Define the maximum number of login attempts
maxAttempts=3

# Get the IP addresses that have made excessive login attempts
blockedIPs=$(grep "Failed password" /var/log/auth.log | awk '{print $13}' | sort | uniq -c | awk '$1 > maxAttempts {print $2}')

for ip in $blockedIPs; do
    # Block each IP address that has exceeded the maximum number of attempts
    iptables -I INPUT -s $ip -j DROP
    # Log the IP address that was blocked
    echo "$(date) IP $ip was blocked due to excessive SSH login attempts." >> /var/log/ssh-block.log
done

# Prompt the user to enter a path this shell script for cron job
read -p "Enter the path this shell script for cron job: " path

# Add the command to the crontab
(crontab -l 2>/dev/null; echo "0 * * * * $path") | crontab -