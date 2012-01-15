#!/bin/bash -xe

###############################################################################
#
# Check the ubuntu version and stop if it's not ubuntu
#
###############################################################################

WDIR=$(dirname $(readlink -f $0))

UBUNTU_VERSION=$($WDIR/ubuntu-version-name.sh)
if [ -z $UBUNTU_VERSION ];
then
  set +x;
  echo;
  echo "Sorry, can't find your ubuntu version name, exiting ...";
  echo;
  exit 1;
fi
