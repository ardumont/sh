#!/bin/bash -e

WDIR=$1
[ -z $WDIR ] && WDIR=$HOME/repositories/perso
[ ! -d $WDIR ] && mkdir -p $WDIR

cd $WDIR

[ ! -d $WDIR/my-org-files ] && git clone git@github.com:ardumont/my-org-files.git
[ ! -d $WDIR/my-org-files ] && git clone git@github.com:ardumont/reading-pro-git.git
[ ! -d $WDIR/fest-assert-goodies ] && git clone git@github.com:ardumont/fest-assert-goodies.git
[ ! -d $WDIR/slash-my-home-slash-bin ] && git clone git@github.com:ardumont/slash-my-home-slash-bin.git
[ ! -d $WDIR/stumpwm-config ] && git clone git@github.com:ardumont/stumpwm-config.git
[ ! -d $WDIR/my-mockito-lab ] && git clone git@github.com:ardumont/my-mockito-lab.git
[ ! -d $WDIR/my-assert-goodies ] && git clone git@github.com:ardumont/fest-assert-goodies.git
[ ! -d $WDIR/my-saner-defaults ] && git clone git@github.com:ardumont/conkeror-saner-defaults.git
[ ! -d $WDIR/my-project-euler-lab ] && git clone git@github.com:ardumont/my-project-euler-lab.git
[ ! -d $WDIR/my-node-js-lab ] && git clone git@github.com:ardumont/my-node-js-lab.git
[ ! -d $WDIR/clojure-plays-checkers ] && git clone git@github.com:denlab/clojure-plays-checkers.git
[ ! -d $WDIR/clojure-dojo-at-lunch ] && git clone git@github.com:denlab/clojure-dojo-at-lunch.git
[ ! -d $WDIR/my-pallet-stevedore-lab ] && git clone git@github.com:ardumont/my-pallet-stevedore-lab.git
[ ! -d $WDIR/luhnybin ] && git clone git@github.com:ardumont/luhnybin.git
