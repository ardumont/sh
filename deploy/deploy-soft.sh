#!/bin/bash

WDIR=$(dirname $0)

ALL=$1

$WDIR/install.sh git gitk tig meld chromium localepurge tree deborphan lsb-languages gparted stalonetray inotify-tools curl yajl-tools openssh-server sysvbanner most graphviz gnuplot vim latex latex-beamer texlive-latex-extra texlive-fonts-recommended ttf-marvosym dstat htop zip unzip rar unrar p7zip p7zip-rar xclip gpointing-device-settings enca scrot xserver-xephyr nethogs multitail tasksel unetbootin acpi autojump mc exuberant-ctags augeas-tools fortune zsh checkinstall apt-file sbcl autoconf texinfo rlwrap fbreader libnss-myhostname xterm xautolock mrxvt xscreensaver keychain ssh-askpass-fullscreen xosview gnome-power-manager

# optional
[ ! -z "$ALL" ] && $WDIR/install.sh sweethome3d audacious audacious-plugins nautilus-dropbox xfce4 gnome-power-manager
