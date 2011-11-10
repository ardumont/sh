#!/bin/bash -x

. $(dirname $0)/standard-functions.sh

# Install clojure
do-action "sudo aptitude install clojure inotify-tools ruby"

WDIR=$HOME/repositories/clones

# deploy tools to help
[ ! -d $HOME/repositories ] && do-action "mkdir -p $WDIR"
cd $WDIR

deploy-git-clone-or-update https://github.com/technomancy/leiningen.git $WDIR/leiningen

# will launch the download of all needed
cd $WDIR/leiningen
do-action "lein"

# install the plugin to make a server swank
do-action "lein plugin install swank-clojure 1.3.3"

# install cake
deploy-git-clone-or-update git://github.com/flatland/cake.git $WDIR/cake
destroy-link $HOME/bin/cake
do-action "ln -s $WDIR/cake/bin/cake $HOME/bin/"

# install midje-cake
deploy-git-clone-or-update git://github.com/marick/Midje.git $WDIR/Cake-midje
# retrieve the tasks.clj files from this project and copy it inside your project root
# add this files to the root of your project 
# wget https://github.com/marick/Midje/raw/master/examples/cake-midje/tasks.clj

# install faster-cake-autotest
deploy-git-clone-or-update git://github.com/denlab/faster-cake-autotest.git $WDIR/faster-cake-autotest
destroy-link $HOME/bin/cake-autotest
do-action "ln -s $WDIR/faster-cake-autotest/cake-autotest $HOME/bin/"
