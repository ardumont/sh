#!/bin/bash

DEST=~/Downloads/conkeror
URL_CONKEROR=http://launchpadlibrarian.net/53257451/conkeror_0.9.2%2Bgit100804-1ubuntu1_all.deb
URL_XULRUNNER=http://launchpadlibrarian.net/70321863/xulrunner-1.9.2_1.9.2.17%2Bbuild3%2Bnobinonly-0ubuntu1_i386.deb

FILE_CONKEROR=conkeror_0.9.2+git100804-1ubuntu1_all.deb
FILE_XULRUNNER=xulrunner-1.9.2_1.9.2.17+build3+nobinonly-0ubuntu1_i386.deb

# does the directory exist?
if [ ! -d $DEST ];
then
    echo "Create the directory '$DEST' to download the file."
    # create it
    mkdir -p $DEST
fi

# install the file
function install-soft() {
    file_soft=$1
    package_soft=$2
    cd $DEST
    dpkg -l | grep $package_soft
    if [ $? != 0 ];
    then
        echo "$package_soft is not installed! Install it!.".
        # Install
        sudo dpkg -i $file_soft
        echo "Installation done!"
    else
        echo "$package_soft already installed, nothing to do!"
    fi
}

# download the soft
function dl-soft() {
    file_soft=$1
    package_soft=$2
    cd $DEST
    # Is the file already downloaded?
    if [ ! -f $file_soft ];
    then
        echo "Download $2."
        # download it
        wget $URL
    fi
}

# Download or not
dl-soft $FILE_XULRUNNER $URL_XULRUNNER
dl-soft $FILE_CONKEROR $URL_CONKEROR

# Is the soft already installed?
install-soft $FILE_XULRUNNER xulrunner
install-soft $FILE_CONKEROR conkeror

