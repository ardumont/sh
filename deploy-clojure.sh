#!/bin/bash -xe

. standard-functions.sh

# Install clojure
do-action "sudo aptitude install clojure inotify-tools ruby"

# deploy tools to help
[ ! -d ~/repositories ] && do-action "mkdir -p ~/repositories/clones"
cd ~/repositories/clones

[ ! -d ~/repositories/clones/leiningen ] && do-action "git clone https://github.com/technomancy/leiningen.git ~/repositories/clones/leiningen" || git reset --hard HEAD && git pull

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
deploy-git-clone-or-update git://github.com/ninjudd/cake.git ~/repositories/clones/cake
destroy-link ~/bin/cake
ln -s ~/repositories/clones/cake/bin/cake ~/bin/cake

# install midje-cake
deploy-git-clone-or-update https://github.com/marick/Midje/wiki/Cake-midje ~/repositories/clones/Cake-midje

# install faster-cake-autotest
deploy-git-clone-or-update git://github.com/denlab/faster-cake-autotest.git ~/repositories/clones/faster-cake-autotest
destroy-link ~/bin/cake-autotest
ln -s ~/repositories/clones/faster-cake-autotest/cake-autotest ~/bin/cake-autotest

# add this files to the root of your project 

# wget https://github.com/marick/Midje/raw/master/examples/cake-midje/tasks.clj
