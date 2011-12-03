#!/bin/bash

. standard-functions.sh

WDIR=$1
[ -z $WDIR ] && WDIR=$HOME/repositories/perso
[ ! -d $WDIR ] && mkdir -p $WDIR

cd $WDIR

deploy-git-clone-or-update-soft git@github.com:ardumont/my-org-files.git $WDIR/my-org-files
deploy-git-clone-or-update-soft git@github.com:ardumont/reading-pro-git.git $WDIR/reading-pro-git
deploy-git-clone-or-update-soft git@github.com:ardumont/fest-assert-goodies.git $WDIR/fest-assert-goodies
deploy-git-clone-or-update-soft git@github.com:ardumont/slash-my-home-slash-bin.git $WDIR/slash-my-home-slash-bin
deploy-git-clone-or-update-soft git@github.com:ardumont/stumpwm-config.git $WDIR/stumpwm-config
deploy-git-clone-or-update-soft git@github.com:ardumont/my-mockito-lab.git $WDIR/my-mockito-lab
deploy-git-clone-or-update-soft git@github.com:ardumont/conkeror-saner-defaults.git $WDIR/conkeror-saner-defaults
deploy-git-clone-or-update-soft git@github.com:ardumont/my-project-euler-lab.git $WDIR/my-project-euler-lab
deploy-git-clone-or-update-soft git@github.com:ardumont/my-node-js-lab.git $WDIR/my-node-js-lab
deploy-git-clone-or-update-soft git@github.com:ardumont/my-pallet-stevedore-lab.git $WDIR/my-pallet-stevedore-lab
deploy-git-clone-or-update-soft git@github.com:ardumont/luhnybin.git $WDIR/luhnybin
deploy-git-clone-or-update-soft git@github.com:denlab/clojure-plays-checkers.git $WDIR/clojure-plays-checkers
deploy-git-clone-or-update-soft git@github.com:denlab/clojure-dojo-at-lunch.git $WDIR/clojure-dojo-at-lunch
deploy-git-clone-or-update-soft git@github.com:ardumont/luhn-challenge.git $WDIR/luhn-challenge
