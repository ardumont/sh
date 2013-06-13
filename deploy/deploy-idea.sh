#!/bin/bash -xe

# Use
# $0 <URL-INTELLIJ-IDEA-ARCHIVE>

################ Dynamic setup

URL=${1-"http://download.jetbrains.com/idea/ideaIC-12.1.4.tar.gz"}

################ Static setup

FILENAME=$(basename "$URL")
#FILENAME_WEXT=$(basename "$URL" ".tar.gz")

DL_FILE=~/Downloads/idea/$FILENAME
EXTRACTED_FOLDER_DEST=~/applications/ide/idea

# Download the file if need be
[ ! -f $DL_FILE ] && wget $URL -O $DL_FILE

# Extract the archive
tar axvf $DL_FILE -C $EXTRACTED_FOLDER_DEST

# determine the name of the installation folder

FILENAME_WEXT=$(ls -lrt $EXTRACTED_FOLDER_DEST | tail -1 | cut -d' ' -f10) # take the file the most recent
INSTALLED_FOLDER=$EXTRACTED_FOLDER_DEST/$FILENAME_WEXT

# Link on the last install
ln -nsf $INSTALLED_FOLDER $EXTRACTED_FOLDER_DEST/idea
