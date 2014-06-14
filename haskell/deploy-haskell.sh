#!/bin/bash -xe

PACKAGES="haskell-platform libghc-zlib-dev hlint"

for package in $PACKAGES; do
  [ "$(package-installed.sh $package)" = "NOT" ] && install.sh $package
done

# init cabal
cabal update

# upgrade to latest version
cabal install cabal cabal-install haddock

# reload the path
source ~/.shrc-path
