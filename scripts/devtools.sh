#!/bin/bash

# Sets up a developer environment

# Set apt-get for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Create a configuration script to help get a Git environment set up
sudo tee /usr/local/bin/git-config > /dev/null << GIT_CONFIG_EOF
#! /bin/bash

if [ "\$#" -eq 3 ]; then
  NAME="\$1"
  EMAIL="\$2"
  PUSH="\$3"
elif [ "\$#" -eq 2 ]; then
  NAME="\$1"
  EMAIL="\$2"
  PUSH="simple"
else
  echo 'Usage: git-config "Your Name" "your@email.com" [PUSH_DEFAULT]'
  exit 1
fi

git config --global user.name "\$NAME"
git config --global user.email "\$EMAIL"
git config --global push.default "\$PUSH"

GIT_CONFIG_EOF

chmod 755 /usr/local/bin/git-config


