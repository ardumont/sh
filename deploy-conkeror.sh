#!/bin/bash

DEST=~/Downloads/conkeror
URL=http://launchpadlibrarian.net/53257451/conkeror_0.9.2%2Bgit100804-1ubuntu1_all.deb

# does the directory exist?
if [ ! -d $DEST ];
then
    echo "Create the directory '$DEST' to download the file."
    # create it
    mkdir -p $DEST
fi

# go inside it
echo "cd $DEST"
cd $DEST

# Is the file already downloaded?
if [ ! -f conkeror_0.9.2+git100804-1ubuntu1_all.deb ];
then
    echo "Download conkeror."
    # download it
    wget $URL
fi

# Is the soft already installed?
dpkg -l | grep conkeror
if [ $? != 0 ];
then
    echo "Conkeror is not installed! Install conkeror.".
    # dependency on xulrunner 192
    sudo apt-get install xulrunner-1.9.2
    # Install
    sudo dpkg -i conkeror_0.9.2+git100804-1ubuntu1_all.deb
    echo "Installation done!"
else
    echo "Conkeror already installed, nothing to do!"
fi
