#!/bin/bash

# Read the mount point
read -p "Enter the mount point: " MOUNT_POINT

# Mount the iSCSI target
mount /dev/sdb "$MOUNT_POINT"

# Check if the mount was successful
if [ $? -eq 0 ]; then
  echo "Successfully mounted iSCSI target"
else
  echo "Failed to mount iSCSI target"
fi