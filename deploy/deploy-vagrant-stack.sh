#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))

$WDIR/install.sh libxslt-dev libxml2-dev libghc-zlib-dev

$WDIR/deploy-ruby.sh

$WDIR/install.sh virtualbox

sudo gem install vagrant vagrant-snap virtualbox

sudo gem install veewee
