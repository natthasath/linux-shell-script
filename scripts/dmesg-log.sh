#!/bin/bash

# Store the current date in a variable
TODAY=$(date +%Y-%m-%d)

# Store the output of the dmesg command in a variable
LOGS=$(dmesg -T --level=emerg,alert,crit,err)

# Export the logs to a file named "dmesg_logs_$TODAY.txt"
echo "$LOGS" > dmesg_logs_$TODAY.txt

# Delete logs older than 7 days
find /path/to/dmesg_logs -type f -mtime +7 -delete

# Prompt the user to enter a path this shell script for cron job
read -p "Enter the path this shell script for cron job: " path

# Add the command to the crontab
(crontab -l 2>/dev/null; echo "0 0 * * * $path") | crontab -