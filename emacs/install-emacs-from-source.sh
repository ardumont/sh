#!/bin/bash -x

install.sh textinfo build-essential automake autoconf libdbus-1-dev libgconf2-dev libgif-dev libgpm-dev libgtk2.0-dev libjpeg62-dev libm17n-dev libncurses5-dev libotf-dev librsvg2-dev libtiff4-dev libXpm-dev

./configure --with-dir=$HOME/applications/emacs-snapshot
make
src/emacs --version
src/emacs --batch -q
checkinstall
