#!/bin/bash

install.sh suckless-tools

deploy-wm.sh xmonad

cabal update && cabal install xmonad-contrib
