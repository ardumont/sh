#!/bin/bash

# Add the repository
sudo add-apt-repository ppa:ferramroberto/java

# Update the repository
sudo aptitude update

# Install sun
yes | aptitude install sun-java6-jdk sun-java6-source sun-java6-plugin

# Once install choose the sun-jre ad the default one
update-alternatives --config java
