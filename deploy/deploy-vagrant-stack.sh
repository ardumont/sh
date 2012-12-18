#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))

$WDIR/install.sh libxslt-dev libxml2-dev libghc-zlib-dev

sudo gem install vagrant vagrant-snap virtualbox

sudo gem install veewee
