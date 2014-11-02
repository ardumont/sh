#!/usr/bin/env zsh

VIDEO_FILE=${1-"$HOME/screen/output.mpg"}

# ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq $VIDEO_FILE
ffmpeg -s wxga -r 25 $VIDEO_FILE
