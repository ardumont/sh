#!/bin/sh

SIG=$1
FILE=$2

gpg --keyid-format long --verify $SIG $FILE
