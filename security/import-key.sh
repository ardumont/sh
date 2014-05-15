#!/bin/sh

PATH_TO_KEY=$1

gpg --keyid-format long --import $PATH_TO_KEY
