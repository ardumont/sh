#!/bin/bash -x

WDIR=$(dirname $(readlink -f $0))

$WDIR/add-apt-repository.sh ppa:cassou/emacs

$WDIR/install.sh emacs24 emacs24-el

# check

emacs --version
