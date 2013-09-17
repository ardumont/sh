#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))

$WDIR/add-apt-repository.sh ppa:cassou/emacs

$WDIR/install.sh emacs-snapshot-el emacs-snapshot-gtk emacs-snapshot

# check

emacs --version
