#!/bin/bash -xe

sudo aptitude install -y linux-image-extra-`uname -r`  software-properties-common

sudo add-apt-repository -y ppa:dotcloud/lxc-docker

sudo aptitude update

sudo aptitude install -y lxc-docker

# Now you can run docker
#docker run -t -t ubuntu /bin/bash
