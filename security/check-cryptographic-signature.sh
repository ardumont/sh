#!/bin/sh

SIG=$1
FILE=$2

gpg2 --keyid-format long --verify $SIG $FILE
