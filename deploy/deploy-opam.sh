#!/bin/bash -x

# Use
# deploy the ocaml package manager

WDIR=$(dirname $0)

$WDIR/deploy-apt-repo.sh "deb [arch=amd64] http://www.recoil.org/~avsm/ wheezy main"

sudo aptitude install -y opam
