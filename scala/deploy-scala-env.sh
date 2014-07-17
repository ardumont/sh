#!/usr/bin/env bash

# Use:
# $0

if [ $# -ne 0 ]; then
    echo<<EOF
Use: $0
This will trigger the installation of the simple-build-tool (sbt).
EOF
    exit 1;

fi

# static setup

URL=http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.3/sbt.deb
DDIR=$HOME/Downloads/scala
DEB=sbt.deb
DEB_FILE=$DDIR/$DEB

# actions

mkdir -p $DDIR

wget $URL -O $DEB_FILE

sudo dpkg -i $DEB_FILE
