#!/bin/bash

# Ask the user which protect or unprotect to use
echo "Do you want to protect or unprotect a file/directory?"
echo "1. Protect"
echo "2. Unprotect"
read -p "Enter your choice (1-2): " choice

if [ $choice -eq 1 ]; then
  read -p "Enter the path of the file/directory you want to protect:" path
  chattr +i $path
  echo "File/Directory protected successfully."
elif [ $choice -eq 2 ]; then
  read -p "Enter the path of the file/directory you want to unprotect:" path
  chattr -i $path
  echo "File/Directory unprotected successfully."
else
  echo "Invalid choice."
fi