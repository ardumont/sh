#!bash -x

install.sh texinfo build-essential automake autoconf libdbus-1-dev libgconf2-dev libgif-dev libgpm-dev libgtk2.0-dev libjpeg-dev libm17n-dev libncurses5-dev libotf-dev librsvg2-dev libtiff4-dev libXpm-dev

EMACS_SOURCE_FOLDER=$HOME/repo/perso/emacs

[ ! -d $EMACS_SOURCE_FOLDER ] && git clone git://git.savannah.gnu.org/emacs.git $EMACS_SOURCE_FOLDER

cd $EMACS_SOURCE_FOLDER

# to avoid "Emacs might crash when run in daemon mode and the X11 connection is unexpectedly lost. Using an Emacs configured with --with-x-toolkit=lucid does not have this problem."
./configure --with-dir=$HOME/applications/emacs-snapshot --with-x-toolkit=lucid
make
src/emacs --version
src/emacs --batch -q
sudo checkinstall
