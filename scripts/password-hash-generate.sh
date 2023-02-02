#!/bin/sh

echo "Choose an algorithm:"
echo "1. MD5"
echo "2. SHA-1"
echo "3. SHA-256"
echo "4. SHA-512"
read -p "Enter your choice (1-4): " choice

case $choice in
  1) algorithm="md5sum";;
  2) algorithm="sha1sum";;
  3) algorithm="sha256sum";;
  4) algorithm="sha512sum";;
  *) echo "Invalid choice"; exit 1;;
esac

read -s -p "Enter password: " password
hash=$(echo -n "$password" | $algorithm | awk '{print $1}')
echo "Password Hash: $hash"