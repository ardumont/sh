#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))
source $WDIR/check-ubuntu-version.sh

yes | sudo aptitude install python-software-properties
sudo add-apt-repository ppa:cassou/emacs
sudo tee -a /etc/apt/sources.list <<EOF

# For Emacs 24
deb http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $UBUNTU_VERSION main
EOF

# Update since the sources have been modified
sudo aptitude update

##################### Install emacs

# Install git and emacs
yes | sudo aptitude install emacs-snapshot

emacs --version

#################### Setup emacs

$WDIR/setup-emacs24.sh
