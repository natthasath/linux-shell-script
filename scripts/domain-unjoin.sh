#!/bin/bash

# Unjoin the domain
sudo realm leave -U Administrator

# Verify domain join
sudo realm list