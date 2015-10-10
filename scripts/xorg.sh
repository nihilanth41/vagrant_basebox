#!/bin/bash

# Set apt-get for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Install xorg 
aptitude -y install xorg 

# Install a window manager
aptitude -y install icewm icewm-themes 


