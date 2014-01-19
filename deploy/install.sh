#!/bin/bash

# This script is destined to simplify the installation between debian and ubuntu
# Use: install.sh list-of-packages
# Ex:  install.sh byobu tmux emacs23...

CMD=$*
[ -z "$CMD" ] && echo "Nothing to install - STOP." && exit 1;

function package-install() {
    sudo aptitude install -y $*
}

# ubuntu
if [ -f "/etc/lsb-release" ]; then #ubuntu or linux mint
    if [ $# -eq 1 ]; then
        # one software, we can check if it is already installed or not
        ( [ ! $(dpkg -l | grep -c "$CMD") -eq 1 ] && echo "Installing package '$CMD'..." && package-install $CMD ) || echo "Package '$CMD' already installed!"
    else
        package-install $CMD
    fi
elif [ -f "/etc/debian_version" ]; then # debian
    su -c "aptitude install -y $CMD"
fi
