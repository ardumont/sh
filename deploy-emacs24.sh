#!/bin/bash -x

WDIR=$(dirname $(readlink -f $0))

##################### Prepare

sudo add-apt-repository ppa:cassou/emacs

# Update since the sources have been modified
sudo aptitude update

##################### Install emacs

# Install emacs

$WDIR/install.sh "emacs-snapshot-el emacs-snapshot-gtk emacs-snapshot"

# check

emacs --version

#################### Setup emacs

$WDIR/setup-emacs24.sh
