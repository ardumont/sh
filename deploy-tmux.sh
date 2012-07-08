#!/bin/bash -x

WDIR=$(dirname $0)

# install

$WDIR/install.sh tmux

# setup

#echo 'set-option -g prefix C-q' > ~/.tmux.conf
