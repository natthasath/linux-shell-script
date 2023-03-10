#!/bin/bash

# Rescan the SCSI bus to detect new disks
sudo rescan-scsi-bus.sh

# Get the device name of the new disk
DISK_NAME=$(dmesg | grep -oP 'sd\S+' | tail -n 1 | tr -d "]")

# Create a new partition on the new disk
sudo parted /dev/$DISK_NAME mklabel gpt
sudo parted -a opt /dev/$DISK_NAME mkpart primary 0% 100%
sudo mkfs.ext4 /dev/${DISK_NAME}1

# Create a physical volume (PV) from the new disk
sudo pvcreate /dev/$DISK_NAME

# Get the name of the volume group (VG) containing the root LV
VG_NAME=$(sudo vgdisplay -c | head -n 1 | cut -d ":" -f 1)

# Extend the VG to include the new PV
sudo vgextend $VG_NAME /dev/$DISK_NAME

# Get the name of the root LV
LV_NAME=$(sudo lvdisplay -c | head -n 1 | cut -d ":" -f 1)

# Extend the root LV to use all available free space
sudo lvextend -l +100%FREE $LV_NAME

# Resize the filesystem on the root LV
sudo resize2fs $LV_NAME
