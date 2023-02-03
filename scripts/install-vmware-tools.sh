#!/bin/bash

# Install VMware Tools
sudo apt-get install open-vm-tools -y

# Check if VMware Tools is running
if pgrep -x "vmtoolsd" > /dev/null
then
    echo "VMware Tools is running."
else
    echo "VMware Tools is not running."
fi

# Check the version of VMware Tools
vmware-toolbox-cmd -v