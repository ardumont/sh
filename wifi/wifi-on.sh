#!/bin/bash -x

WDIR=$(dirname $0)

$WDIR/wifi-off.sh

nm-applet &
