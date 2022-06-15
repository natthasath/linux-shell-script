#!/bin/bash
source configuration.sh
sudo umount /iscsi-disk/
sudo iscsiadm -m node -o show
sudo iscsiadm -m node -u
sudo iscsiadm -m node -o delete