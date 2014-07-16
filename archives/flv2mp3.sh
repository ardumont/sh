#!/usr/bin/env bash

########################################################################################################################
# Set variables - interrupt, extension1, extension2, and the audio file name
########################################################################################################################

USER_INTERRUPT=13
ext1=flv
ext2=mp3
audio=${filename%$ext1}$ext2
pluginmsg="$USER, please plug in the MP3 player and try again. Quitting…"

########################################################################################################################
# Set the output directory, so as not to clutter up the folder full of flv files
########################################################################################################################

if [ -n "$1" ] ; then
    outputdir=${1}/
else
    outputdir=/dev/dummy/
fi

########################################################################################################################
# Catch Control-C events to break out of the loop and remove the partial audio file
########################################################################################################################

trap 'echo "Quitting…"; rm -f $audio; exit $USER_INTERRUPT' TERM INT

########################################################################################################################
# Loop through the working directory and create from ext2 from ext1
########################################################################################################################

mount | grep -i ${outputdir%/} &> /dev/null # Is the MP3 player mounted?
if [ $? = 0 ]; then
    for filename in *.$ext1; do
        title=${filename%$ext1}
        audio=${filename%$ext1}$ext2

        if [ ! -f ${outputdir}$audio ]; # Does the mp3 already exist in the output directory?
        then
            ffmpeg -title "$title" -i $filename -acodec mp3 -ac 2 -ab 128 -vn -y $audio # Change this if ext2 is not an mp3
            mv $audio $outputdir
        fi
    done
else
    echo "$pluginmsg" # No MP3 player - try again!
    sleep 1
    exit 1
fi

exit 0
