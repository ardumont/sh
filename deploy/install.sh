#!/bin/bash

# This script is destined to simplify the installation between debian and ubuntu
# Use: install.sh list-of-packages
# Ex:  install.sh byobu tmux emacs23...

PACKAGES=$*
[ -z "$PACKAGES" ] && echo "Nothing to install - STOP." && exit 1;

function package-install() {
    sudo $apt_pref install -y $*
}

# ubuntu
if [ -f "/etc/lsb-release" ]; then #ubuntu or linux mint
    if [ $# -eq 1 ]; then
        # one software, we can check if it is already installed or not
        ( [ ! $(dpkg -l | grep -c "$PACKAGES") -eq 1 ] && echo "Installing package '$PACKAGES'..." && package-install $PACKAGES ) || echo "Package '$PACKAGES' already installed!"
    else
        package-install $PACKAGES
    fi
elif [ -f "/etc/debian_version" ]; then # debian
    su -c "$apt_pref install -y $PACKAGES"
fi
