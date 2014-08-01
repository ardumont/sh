#!/usr/bin/env bash

install.sh docker.io apparmor-utils

sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker

sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
