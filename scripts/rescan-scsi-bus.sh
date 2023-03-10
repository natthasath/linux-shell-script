#!/bin/bash

# Check if the sg module is loaded
if [ ! -e /sys/class/scsi_host/host0/scan ]; then
    modprobe sg
fi

# Rescan the SCSI bus for new disks
for host in /sys/class/scsi_host/*; do
    echo "- - -" > ${host}/scan
done
