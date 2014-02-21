#!/bin/bash -xe

[ "$(package-installed.sh haskell-platform)" = "NOT" ] && install.sh haskell-platform

[ "$(package-installed.sh libghc-zlib-dev)" = "NOT" ] && install.sh libghc-zlib-dev

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install

# reload the path
source ~/.bashrc
