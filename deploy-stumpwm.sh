#!/bin/bash

WDIR=$(dirname $0)

PACKAGE=stumpwm

# Install $PACKAGE
$WDIR/install.sh $PACKAGE

# Create the file
sudo touch /usr/share/xsessions/$PACKAGE.desktop

# Add the entry for gdm
(cat <<EOF
[Desktop Entry]
        Exec=$PACKAGE
        TryExec=$PACKAGE
        Name=$PACKAGE
        Comment=The Mouseless Window Manager!
EOF
)> $PACKAGE.buffer

sudo cp $PACKAGE.buffer /usr/share/xsessions/$PACKAGE.desktop

rm $PACKAGE.buffer
