#!/usr/bin/env bash

EVM_FOLDER=/usr/local/evm
EVM_HOME=$HOME/.evm

# runtime deps when using evm
sudo apt-get install -y texinfo build-essential automake autoconf libdbus-1-dev libgconf2-dev libgif-dev libgpm-dev libgtk2.0-dev libjpeg-dev libm17n-dev libncurses5-dev libotf-dev librsvg2-dev libtiff5-dev libXpm-dev

[ ! -d $EVM_FOLDER ] && sudo mkdir $EVM_FOLDER && sudo chown $USER: $EVM_FOLDER

[ ! -d $EVM_HOME ] && (curl -fsSkL https://raw.github.com/rejeep/evm/master/go | bash)
