#/bin/bash

REMOVE_FLAG=$1

WDIR=$(dirname $0)

PACKAGES="gnome-control-center gnome-shell gnome-session-fallback gnome-tweak-tool"

[ -z "$REMOVE_FLAG" ] && $WDIR/install.sh $PACKAGES || $WDIR/remove.sh $PACKAGES
