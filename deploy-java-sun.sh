#!/bin/bash

# Add the repository
# TODO

# Update the repository
sudo aptitude update

# Install sun
sudo aptitude install sun-java6-jdk sun-java6-source

# Once install choose the sun-jre ad the default one
sudo update-alternatives --config java
