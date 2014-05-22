#!/bin/sh -x

gpg --keyring=/usr/share/keyrings/debian-keyring.gpg --list-key CCD2ED94D21739E9 | gpg --import
