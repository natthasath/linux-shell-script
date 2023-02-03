#!/bin/bash

# Read the string from the user
read -p "Enter the string: " string

# Navigate to the desired directory
cd <input directory path>

# Delete all files containing the specified string
for file in *; do
  if [[ $file == *"$string"* ]]; then
    rm -rf "$file"
  fi
done