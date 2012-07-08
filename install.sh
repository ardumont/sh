#!/bin/bash -x

# This script is destined to simplify the installation between debian and ubuntu
# Use: install.sh list-of-packages
# Ex:  install.sh byobu tmux emacs23...

CMD=$1
[ -z $1 ] && echo "Nothing to install - STOP." && exit 1;

# ubuntu
if [ -f /etc/lsb-release ]; then #ubuntu
    sudo aptitude install -y $CMD
elif [ -f /etc/debian_version ]; then # debian
    su -c "aptitude install -y $CMD"
fi
