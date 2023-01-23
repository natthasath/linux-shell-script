#!/bin/bash

# Config new password for the user
new_password="changeme"

# Get a list of all users
users=$(cut -d: -f1 /etc/passwd)

# Iterate through the list of users
for user in $users; do
    # Skip the root user
    if [ $user == "root" ]; then
        continue
    fi
    echo "Resetting password for user: $user"
    # Set the new password for the user
    echo "$user:$new_password" | chpasswd
done