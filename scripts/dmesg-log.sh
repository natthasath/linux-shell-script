#!/bin/bash

log_file="dmesg_log_$(date +\%Y\%m\%d_\%H\%M\%S).txt"

# Run dmesg with specified options and redirect output to log file
dmesg -T --level=emerg,alert,crit,err > $log_file

echo "dmesg log saved to $log_file"

# Prompt the user to enter a path this shell script for cron job
read -p "Enter the path this shell script for cron job: " path

# Add the command to the crontab
(crontab -l 2>/dev/null; echo "* * * * * $path") | crontab -