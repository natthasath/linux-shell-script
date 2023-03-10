#!/bin/bash

# Rescan the SCSI bus to detect any new disks
sudo rescan-scsi-bus.sh

# Get the device name of the new disk that matches sd*
DEVICE_NAME=$(dmesg | grep -oP 'sd\S+' | tail -n 1)

# Check if a device name was found
if [[ -n "$DEVICE_NAME" ]]; then
  DEVICE_NAME=$(echo "$DEVICE_NAME" | tr -d "]")
  echo "New disk device name: $DEVICE_NAME"
else
  echo "No new disk found."
fi