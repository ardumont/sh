#!/bin/bash

install.sh suckless-tools

deploy-wm.sh xmonad

cabal install xmonad-contrib
