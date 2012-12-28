#!/bin/bash

WDIR=$(dirname $0)

# Add the repository
grep "webupd8team" /etc/apt/sources.list || $WDIR/add-apt-repository.sh ppa:webupd8team/java

# Update the repository
sudo aptitude update

# Install sun
$WDIR/install.sh oracle-java6-installer

# Once install choose the sun-jre ad the default one
sudo update-alternatives --config java
