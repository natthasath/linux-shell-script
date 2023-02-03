#!/bin/bash

# Read the iSCSI target's IQN
read -p "Enter the iSCSI target's IQN: " IQN

# Disconnect from the iSCSI target
iscsiadm --mode node --targetname "$IQN" --portal all --logout

# Check if the disconnect was successful
if [ $? -eq 0 ]; then
  echo "Successfully disconnected from iSCSI target with IQN $IQN"
else
  echo "Failed to disconnect from iSCSI target with IQN $IQN"
fi