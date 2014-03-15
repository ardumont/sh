#!/bin/bash

EVM_FOLDER=/usr/local/evm
EVM_HOME=$HOME/.evm

[ ! -d $EVM_FOLDER ] && sudo mkdir $EVM_FOLDER && sudo chown $USER: $EVM_FOLDER

[ ! -d $EVM_HOME ] && (curl -fsSkL https://raw.github.com/rejeep/evm/master/go | bash)
