#!/bin/bash

# Prompt for domain name and administrator credentials
read -p "Enter the domain name: " DOMAIN
read -p "Enter the ip primary domain name: " PRIMARY
read -p "Enter the ip secondary domain name: " SECONDARY
echo

# Install required packages
sudo apt-get update
sudo apt-get install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin krb5-user -y

# Configure the Kerberos client
sudo sed -i "s/default_realm = ATHENA.MIT.EDU/default_realm = $DOMAIN/" /etc/krb5.conf
sudo sed -i "/^\[realms\]$/a \
\ \t $DOMAIN = {\
\n\t\tkdc = $PRIMARY\
\n\t\tkdc = $SECONDARY\
\n\t\tadmin_server = $PRIMARY\
\n\t\tdefault_domain = $DOMAIN\
\n\t}" /etc/krb5.conf

# Join the domain
sudo realm join --user=Administrator $DOMAIN

# Verify domain join
sudo realm list
