#!/usr/bin/env bash -xe
# Use: $0
# Given a folder with source, execute the usual configure, make and use checkinstall for installation of compilation result

./configure

make

sudo checkinstall
