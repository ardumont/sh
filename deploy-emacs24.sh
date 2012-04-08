#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))
source /etc/lsb-release

sudo  aptitude install -y python-software-properties

sudo tee -a /etc/apt/sources.list <<EOF

# For Emacs 24
deb http://ppa.launchpad.net/cassou/emacs/ubuntu $DISTRIB_RELEASE main
deb-src http://ppa.launchpad.net/cassou/emacs/ubuntu $DISTRIB_RELEASE main
EOF

# Update since the sources have been modified
sudo aptitude update

##################### Install emacs

# Install git and emacs
sudo aptitude install -y emacs-snapshot

emacs --version

#################### Setup emacs

$WDIR/setup-emacs24.sh
