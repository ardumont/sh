#!/bin/bash

install.sh suckless-tools xmobar

deploy-wm.sh xmonad

cabal update && cabal install xmonad-contrib
