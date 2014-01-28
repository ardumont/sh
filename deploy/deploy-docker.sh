#!/bin/bash -xe

# from http://docs.docker.io/en/latest/installation/ubuntulinux/#ubuntu-raring-saucy

install.sh linux-image-extra-`uname -r`

curl https://get.docker.io/ubuntu/ | sh

# Now you can run docker
#docker run -t -t ubuntu /bin/bash
