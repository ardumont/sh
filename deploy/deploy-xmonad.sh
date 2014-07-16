#!/usr/bin/env bash

install.sh suckless-tools xmobar libxinerama-dev libxrandr-dev libxft-dev

deploy-wm.sh xmonad

cabal update && cabal install xmonad-contrib
