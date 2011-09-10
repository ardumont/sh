#!/bin/bash -xe

. standard-functions.sh

# Install clojure
do-action "sudo aptitude install clojure"

# deploy tools to help
[ ! -d ~/repositories ] && do-action "mkdir -p ~/repositories/clones"
cd ~/repositories/clones

[ ! -d ~/repositories/clones/leiningen ] && do-action "git clone https://github.com/technomancy/leiningen.git" || git reset --hard HEAD && git pull

# will launch the download of all needed
cd leiningen
do-action "lein"

# install the plugin to make a server swank
do-action "lein plugin install swank-clojure 1.3.1"

# FIXME find a way to install plugin emacs offline
# Install clojure mode in emacs
# M-x list-packages
# select clojure-mode I
# x to install

# install cake
[ ! -d ~/repositories/clones/cake ] && do-action "git clone git://github.com/ninjudd/cake.git" || git reset --hard HEAD && git pull

# create a link
destroy-link ~/repositories/clones/cake/bin/cake
ln -s ~/repositories/clones/cake/bin/cake ~/bin/cake

