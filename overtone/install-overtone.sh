#!/usr/bin/env bash

WDIR=$(dirname $0)/../deploy

$WDIR/install.sh supercollider jack-tools ant openjdk-6-jdk fftw3 qjackctl
