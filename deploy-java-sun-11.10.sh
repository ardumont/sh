#!/bin/bash

WDIR=$(dirname $0)

# Add the repository
grep "ferramroberto" /etc/apt/sources.list || sudo add-apt-repository ppa:ferramroberto/java

# Update the repository
sudo aptitude update

# Install sun
$WDIR/install.sh "sun-java6-jdk sun-java6-source sun-java6-plugin"

# Once install choose the sun-jre ad the default one
sudo update-alternatives --config java
