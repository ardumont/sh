#!/usr/bin/env bash

WDIR=$(dirname $(readlink -f $0))

$WDIR/uninstall.sh ruby1.8

$WDIR/install.sh ruby1.9.3 rubygems
