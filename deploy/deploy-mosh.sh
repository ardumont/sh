#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))

$WDIR/add-apt-repository.sh ppa:keithw/mosh

$WDIR/install.sh mosh
