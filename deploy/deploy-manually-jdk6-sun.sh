#!/usr/bin/env bash -x

BIN=jdk-6u32-linux-x64.bin
FOLDER=jdk1.6.0_32

# Giving good rights
chmod +x $BIN

# Extract the bin file:
$BIN

# Move extracted folder to this location:
sudo mv $FOLDER /usr/lib/jvm/

# Create a link
cd /usr/lib/jvm
sudo ln -s $FOLDER java-6-sun

# Install new java source in system:
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-6-sun/bin/javac 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-6-sun/bin/java 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/java-6-sun/bin/javaws 1

# Choose default java:
sudo update-alternatives --config javac
sudo update-alternatives --config java
sudo update-alternatives --config javaws
