#!/bin/bash -e

WDIR=$(dirname $0)
VERSION=$1
WITH_JAVA=$2

# Version by default is 11.10
[ -z $VERSION ] && VERSION=11.10
# By default, no java
[ -z $WITH_JAVA ] && WITH_JAVA=n

# Deploy the basename soft
$WDIR/deploy-soft.sh $VERSION

# Deploy home
$WDIR/deploy-home-folder.sh

# Deploy git config
$WDIR/deploy-git-config.sh

# Deploy emacs
$WDIR/deploy-emacs.sh

# Deploy stumpwm
$WDIR/deploy-stumpwm.sh

# Deploy conkeror
$WDIR/deploy-conkeror.sh

# Deploy byobu
$WDIR/deploy-byobu.sh

# Deploy clojure
$WDIR/deploy-clojure.sh

# Install java if asked
[ $WITH_JAVA = "y" ] && [ -f $WDIR/deploy-java-sun-$VERSION.sh ] && $WDIR/deploy-java-sun-$VERSION.sh

# Deploy gnome on 11.10
[ $VERSION = "11.10" ] && [ -f $WDIR/deploy-gnome-$VERSION.sh ] && $WDIR/deploy-gnome-$VERSION.sh