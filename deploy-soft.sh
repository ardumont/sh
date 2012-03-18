#!/bin/bash


# ubuntu
if [ -f /etc/lsb-release ]; then
    # First install aptitude
    sudo apt-get install aptitude

    sudo aptitude install git gitk chromium-browser localepurge tree deborphan \
    language-pack-en language-pack-fr gparted stalonetray  sweethome3d \
    inotify-tools ruby curl yajl-tools openssh-server sysvbanner most \
    graphviz audacious audacious-plugins gnuplot vim

    [ $DISTRIB_RELEASE = "11.10" ] && sudo aptitude install nautilus-dropbox gtalk meld dstat htop
fi

# debian
if [ -f /etc/debian_version ]; then
    su -c "apt-get install aptitude"
    su -c "aptitude install localpurge tree deborphan curl inotify-tools ruby curl yajl-tools sysvbanner most gtalk meld dstat htop"
fi
