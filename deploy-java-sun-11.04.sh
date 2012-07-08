#!/bin/bash

WDIR=$(dirname $0)

# Add the repository

grep "deb http://archive.canonical.com/ubuntu natty partner" /etc/apt/sources.list || sudo add-apt-repository "deb http://archive.canonical.com/ubuntu natty partner"

# Update the repository
sudo aptitude update

# Install sun
$WDIR/install.sh "sun-java6-jdk sun-java6-source"

# Once install choose the sun-jre ad the default one
sudo update-alternatives --config java
