#!/bin/bash

if [ -f "/etc/lsb-release" ]; then #ubuntu
    # First install aptitude
    sudo apt-get install -y aptitude

    sudo aptitude install -y git gitk chromium-browser localepurge tree deborphan \
        language-pack-en language-pack-fr gparted stalonetray  sweethome3d \
        inotify-tools ruby curl yajl-tools openssh-server sysvbanner most \
        graphviz audacious audacious-plugins gnuplot vim latex latex-beamer \
        texlive-latex-extra texlive-fonts-recommended ttf-marvosym gnome-tweak-tool fonts-cantarell

    [ $DISTRIB_RELEASE -eq "11.10" ] && \
        sudo aptitude install -y nautilus-dropbox gtalk meld dstat htop

    [ $DISTRIB_RELEASE -eq "12.04" ] && \
        sudo aptitude install -y nautilus-dropbox gtalk meld dstat htop

    [ $DISTRIB_RELEASE -eq "13" ] && \
        sudo aptitude install -y nautilus-dropbox gtalk meld dstat htop

elif [ -f "/etc/debian_version" ]; then #debian
    su -c "apt-get install aptitude"
    su -c "aptitude install -y localpurge tree deborphan curl inotify-tools ruby curl yajl-tools sysvbanner most gtalk meld dstat htop"
fi
