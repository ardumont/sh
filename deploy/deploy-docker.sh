#!/bin/bash -xe

install.sh linux-image-extra-`uname -r` software-properties-common

add-apt-repository.sh ppa:dotcloud/lxc-docker

install.sh lxc-docker

# Now you can run docker
#docker run -t -t ubuntu /bin/bash
