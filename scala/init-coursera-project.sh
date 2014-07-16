#!/usr/bin/env bash -xe

[ $# -ne 1 ] && echo "Use: $0 <FOLDER-NAME>" && exit 1

cd $0
sbt "generate ensime"
sbt gen-idea
