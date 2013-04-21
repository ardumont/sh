#!/bin/bash -e

WDIR=$(dirname $0)

$WDIR/install.sh ditaa

sudo mkdir -p /usr/share/emacs/24.1/lisp/contrib/scripts/

sudo ln -s /usr/share/ditaa/ditaa.jar /usr/share/emacs/24.1/lisp/contrib/scripts/
