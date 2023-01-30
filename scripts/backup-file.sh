#!/bin/bash

# Prompt for the file to backup
read -p "Enter the path to the file to backup: " file_path

# Check if the file exists
if [ ! -f $file_path ]; then
  echo "Error: $file_path does not exist."
  exit 1
fi

# Create a backup of the file with a timestamp
backup_file="$file_path-$(date +%Y%m%d%H%M%S).bak"
cp $file_path $backup_file

# Confirm the backup was created
if [ -f $backup_file ]; then
  echo "Backup created: $backup_file"
else
  echo "Error: Failed to create backup."
  exit 1
fi