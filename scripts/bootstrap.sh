#!/bin/bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/configs/variables" ]; then
  . "$SHARED_DIR"/configs/variables
fi

if [ ! -d "$DOWNLOAD_DIR" ]; then
  mkdir -p "$DOWNLOAD_DIR"
fi

yum -y install git vim wget

curl http://download.opensuse.org/repositories/utilities/CentOS_6/utilities.repo -O /etc/yum.repos.d/utilities.repo
yum -y install rcm

