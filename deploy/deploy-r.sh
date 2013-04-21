#!/bin/bash -x

# Use
# deploy the r package

WDIR=$(dirname $0)

$WDIR/deploy-apt-repo.sh deb http://cran.univ-paris1.fr/bin/linux/ubuntu quantal/

sudo aptitude install -y r-base
