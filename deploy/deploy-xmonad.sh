#!/bin/bash

WDIR=$(dirname $0)

$WDIR/install.sh suckless-tools

$WDIR/deploy-wm.sh xmonad
