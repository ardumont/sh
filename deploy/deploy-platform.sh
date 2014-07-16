#!/usr/bin/env bash -e

WDIR=$(dirname $0)
VERSION=$1
#WITH_JAVA=$2

# Version by default is 13.04
#[ -z $VERSION ] && VERSION=13.04
# By default, no java
#[ -z $WITH_JAVA ] && WITH_JAVA=n

$WDIR/deploy-soft.sh

$WDIR/deploy-home-folder.sh

$WDIR/deploy-git-config.sh

$WDIR/deploy-emacs24.sh

$WDIR/deploy-stumpwm.sh

#$WDIR/deploy-conkeror.sh

#$WDIR/deploy-byobu.sh

$WDIR/deploy-clojure.sh

$WDIR/../haskell/deploy-haskell.sh

$WDIR/deploy-scala.sh

# Install java if asked
#[ $WITH_JAVA = "y" ] && [ -f $WDIR/deploy-java-sun-$VERSION.sh ] && $WDIR/deploy-java-sun-$VERSION.sh

# Deploy gnome on 11.10
[ $VERSION \> "11.10" ] && [ -f $WDIR/deploy-gnome-alternative.sh ] && $WDIR/deploy-gnome-alternative.sh
