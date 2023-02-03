#!/bin/bash

# Read the iSCSI target's IQN
read -p "Enter the iSCSI target's IQN: " IQN

# Read the iSCSI target's IP address
read -p "Enter the iSCSI target's IP address: " IP_ADDRESS

# Connect to the iSCSI target
iscsiadm --mode node --targetname "$IQN" --portal "$IP_ADDRESS":3260 --login

# Check if the connection was successful
if [ $? -eq 0 ]; then
  echo "Successfully connected to iSCSI target with IQN $IQN"
else
  echo "Failed to connect to iSCSI target with IQN $IQN"
fi