#!/bin/bash -xe

#$WDIR/install.sh haskell-platform
install.sh haskell-compiler cabal-install zlibc libghc-bzlib-dev libghc-zlib-bindings-dev

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install
