#!/bin/bash -x

install.sh texinfo build-essential automake autoconf libdbus-1-dev libgconf2-dev libgif-dev libgpm-dev libgtk2.0-dev libjpeg-dev libm17n-dev libncurses5-dev libotf-dev librsvg2-dev libtiff4-dev libXpm-dev

EMACS_SOURCE_FOLDER=$HOME/repo/perso/emacs

[ ! -d $EMACS_SOURCE_FOLDER ] && git clone git://git.savannah.gnu.org/emacs.git $EMACS_SOURCE_FOLDER

cd $EMACS_SOURCE_FOLDER

./configure --with-dir=$HOME/applications/emacs-snapshot
make
src/emacs --version
src/emacs --batch -q
sudo checkinstall
