#!/bin/bash

# Add the repository
#sudo add-apt-repository "deb http://archive.canonical.com/ubuntu natty partner"
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu oneiric partner"

# Update the repository
sudo aptitude update

# Install sun
yes | aptitude install sun-java6-jdk sun-java6-source

# Once install choose the sun-jre ad the default one
update-alternatives --config java
