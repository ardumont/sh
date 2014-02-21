#!/bin/bash -xe

PACKAGES="haskell-platform libghc-zlib-dev"

for package in $PACKAGES; do
  [ "$(package-installed.sh $package)" = "NOT" ] && install.sh $package
done

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install

# reload the path
source ~/.bashrc
