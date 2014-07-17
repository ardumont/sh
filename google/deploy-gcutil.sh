#!/usr/bin/env bash

GCUTIL=gcutil-1.8.0.tar.gz
URL=https://code.google.com/p/google-compute-engine-tools/downloads/detail?name=$GCUTIL
INSTALL_FOLDER=~/Downloads/google/
ARCHIVE=${INSTALL_FOLDER}${GCUTIL}
APP_FOLDER=~/applications/google/

mkdir -p $INSTALL_FOLDER $APP_FOLDER
wget $URL -O $ARCHIVE

tar xvf $ARCHIVE -C $APP_FOLDER
