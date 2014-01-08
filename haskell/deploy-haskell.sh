#!/bin/bash -xe

#$WDIR/install.sh haskell-platform
install.sh haskell-platform

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install

# reload the path
source ~/.bashrc
