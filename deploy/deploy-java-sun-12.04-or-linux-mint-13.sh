#!/bin/bash

WDIR=$(dirname $0)

# Add the repository
grep "webupd8team" /etc/apt/sources.list || $WDIR/add-apt-repository.sh ppa:webupd8team/java

# Update the repository
sudo aptitude update

# Install sun
$WDIR/install.sh sun-java6-jdk sun-java6-source sun-java6-plugin

# Once install choose the sun-jre ad the default one
sudo update-alternatives --config java
