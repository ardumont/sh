#!/bin/bash -xe

WDIR=$(dirname $(readlink -f $0))

$WDIR/install.sh haskell-platform
