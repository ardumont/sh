#!/bin/bash -xe

[ $(package-installed.sh software-properties-common) = "NOT" ] && sudo aptitude install -y software-properties-common

sudo add-apt-repository $*

sudo aptitude update
