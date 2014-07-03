#!/bin/sh

install.sh dropbox nemo-dropbox nautilus-dropbox

# increase the max number of file watches
echo fs.inotify.max_user_watches=1000000 | sudo tee -a /etc/sysctl.conf;

sudo sysctl -p /etc/sysctl.conf
