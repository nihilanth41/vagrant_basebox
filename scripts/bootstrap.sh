#!/bin/bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/configs/variables" ]; then
  . "$SHARED_DIR"/configs/variables
fi

if [ ! -d "$DOWNLOAD_DIR" ]; then
  mkdir -p "$DOWNLOAD_DIR"
fi

# Set aptitude for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Update
aptitude -y update && aptitude -y upgrade

# SSH
aptitude -y install openssh-server

# Build tools
aptitude -y install build-essential #automake libtool

# Git vim
aptitude -y install git vim

# Java (Oracle)
aptitude install -y software-properties-common
aptitude install -y python-software-properties
add-apt-repository -y ppa:webupd8team/java
aptitude update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
aptitude install -y oracle-java8-installer
update-java-alternatives -s java-8-oracle
aptitude install -y oracle-java8-set-default
# Set JAVA_HOME variable both now and for when the system restarts
export JAVA_HOME
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment

# Wget and curl
aptitude -y install wget curl

# More helpful packages
aptitude -y install htop tree dos2unix unzip pv parallel

# Apache/PHP
aptitude -y install apache2 php5 libapache2-mod-php5
service apache2 restart 

