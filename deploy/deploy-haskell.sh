#!/bin/bash -xe

#$WDIR/install.sh haskell-platform
install.sh haskell-compiler cabal-install

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install
