#!/bin/bash -e

. standard-functions.sh

WDIR=$1
[ -z $WDIR ] && WDIR=$HOME/repositories/perso
[ ! -d $WDIR ] && mkdir -p $WDIR

cd $WDIR

