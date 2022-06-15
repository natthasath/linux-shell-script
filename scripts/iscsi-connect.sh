#!/bin/bash
source configuration.sh
sudo iscsiadm -m discovery -t st -p TARGET
sudo iscsiadm -m node -o show
sudo iscsiadm -m node -l