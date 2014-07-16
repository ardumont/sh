#!/usr/bin/env bash

result=`md5sum -b $@`

zenity --info --text="Hash MD5:\n$result"
