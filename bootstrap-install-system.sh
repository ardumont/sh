#!/bin/bash -xe

# This is a bootstrap script to install the needed script
# for installing my overall system.
# To deploy this script, download it directly from github and make it executable.
# wget https://github.com/ardumont/sh/bootstrap-install-system.sh
# chmod +x bootstrap-install-system.sh
# then execute it.

sudo aptitude install -y git tig emacs24 tmux ruby gitk

# you must have pre-setup your ssh key to access the github account
CLONE_DIR=$HOME/repo/perso

[ ! -d $CLONE_DIR/sh ] && git clone git@github.com:ardumont/sh.git $CLONE_DIR/sh && ln -s $CLONE_DIR/sh $HOME/bin

$HOME/bin/deploy/deploy-dot-files.sh

source $HOME/.bashrc

$HOME/bin/deploy/deploy-all.sh
