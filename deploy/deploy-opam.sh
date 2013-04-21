#!/bin/bash -x

# Use
# deploy the ocaml package manager

FILE=/etc/apt/sources.list
CONTENT="deb [arch=amd64] http://www.recoil.org/~avsm/ wheezy main"

grep "$CONTENT" $FILE
if [ $? -ne 0 ]; then
    echo "$CONTENT" | sudo tee -a $FILE
fi

set -e

sudo aptitude update

sudo aptitude install -y opam
