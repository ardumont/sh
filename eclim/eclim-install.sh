#!/bin/bash

# Source:
# - http://eclim.org/install.html
# - https://github.com/senny/emacs-eclim

[ $# -ne 1 ] && echo "Use: $0 <ECLIPSE_HOME>
ECLIPSE_HOME Folder where eclipse is installed." && exit 1

# http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/SR2/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz&mirror_id=514

ECLIPSE_HOME=$1

ECLIM_VERSION=2.3.4
ECLIM_FILENAME=eclim_$ECLIM_VERSION
ECLIM_JAR=$ECLIM_FILENAME_2.3.4.jar

# Download eclim
wget http://sourceforge.net/projects/eclim/files/eclim/$ECLIM_VERSION/$ECLIM_JAR/download \
     -o $ECLIM_JAR

# automatic install
java \
    -Dvim.skip=true \
    -Declipse.home=$ECLIPSE_HOME \
    -jar $ECLIM_JAR install
