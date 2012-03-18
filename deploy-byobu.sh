#!/bin/bash

CMD="aptitude install byobu landscape-common update-motd"

# ubuntu
if [ -f /etc/lsb-release ]; then #ubuntu
    sudo $CMD
elif [ -f /etc/debian_version ]; then # debian
    su -c "$CMD"
fi

echo 'escape ``' > ~/.screenrc
