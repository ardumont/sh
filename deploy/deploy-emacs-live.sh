#!bash -e

# Use: This script deploy emacs-live and emacs-live-packs from my git repositories

HREPO=$HOME/repo/perso

# First clone the repositories
[ ! -d $HREPO/emacs-live ] && git clone git@github.com:ardumont/emacs-live.git $HREPO/emacs-live
[ ! -d $HREPO/emacs-live-packs ] && git clone git@github.com:ardumont/emacs-live-packs.git --recurse-submodules $HREPO/emacs-live-packs

# Then links to them in $HOME
ln -nsf $HREPO/emacs-live ~/.emacs.d

# deploy
$HREPO/emacs-live-packs/deploy.sh
