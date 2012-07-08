#!/bin/bash -xe

# This script is destined to simplify the installation between debian and ubuntu
# Use: add-apt-repository.sh repository-url
# Ex:  add-apt-repository.sh "deb http://archive.canonical.com/ubuntu natty partner"

REPO=$1
[ -z "$REPO" ] && echo "No repository to add - STOP." && exit 1;

if [ -f "/etc/lsb-release" ]; then #ubuntu or linux mint
    sudo add-apt-repository $REPO
elif [ -f "/etc/debian_version" ]; then # debian
    su -c "add-apt-repository $REPO"
fi
