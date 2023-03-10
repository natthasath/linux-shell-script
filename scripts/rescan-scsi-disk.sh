#!/bin/bash

# List all block devices including SCSI disks
lsblk

# List disk name, size, and mount point
lsblk -o NAME,SIZE,MOUNTPOINT

# Install sg3-utils package
sudo apt-get install sg3-utils

# Rescan the SCSI bus to detect new disks
sudo rescan-scsi-bus.sh
