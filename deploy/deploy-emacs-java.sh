#!/usr/bin/env bash -e

WDIR=$(dirname $0)

$WDIR/install.sh ecj gcj-jre ecj-gcj

# download jdibug - fully elisp java compiler

cd ~/Downloads

wget http://jdibug.googlecode.com/files/jdibug-0.5.tar.bz2

echo "7b4bec9896295d54bd3c28afac15e1024707fa06" > /tmp/md5sum-check-jdi-reference
md5sum -c jdibug-05.tar.gz > /tmp/md5sum-check-jdi

diff /tmp/md5sum-check-jdi /tmp/md5sum-check-jdi-reference
