#!/usr/bin/env bash -xe

# Use
# $0 /path/to/repo-which-contains-the-pom.xml-file
# Will sync the deps of the repo

[ -f $1 ] && cd $(dirname $1) || exit 0

mvn clean package
