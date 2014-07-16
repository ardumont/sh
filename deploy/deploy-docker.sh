#!/usr/bin/env bash -xe

# from http://docs.docker.io/en/latest/installation/ubuntulinux/#ubuntu-raring-saucy

install.sh linux-image-extra-`uname -r`

curl https://get.docker.io/ubuntu/ | sudo sh

# Add the current user to docker group
sudo gpasswd -a ${USER} docker

# logout the user and relog in
sudo service docker restart

# Now you can run docker
#docker run -t -t ubuntu /bin/bash
