#!/usr/bin/env bash

[ $(package-installed.sh software-properties-common) = "NOT" ] && install.sh software-properties-common

sudo add-apt-repository $*

sudo aptitude update
