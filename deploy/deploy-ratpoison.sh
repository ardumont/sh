#!/usr/bin/env bash

WDIR=$(dirname $0)

PACKAGE=ratpoison

$WDIR/install.sh $PACKAGE

# Create the file
sudo touch /usr/share/xsessions/$PACKAGE.desktop

# Add the entry for gdm
(cat <<EOF
[Desktop Entry]
        Type=Application
        Encoding=UTF-8
        Name=$PACKAGE
        Comment=Minimalistic Window Manager
        Exec=$PACKAGE
EOF
)> $PACKAGE.buffer

sudo cp $PACKAGE.buffer /usr/share/xsessions/$PACKAGE.desktop

rm $PACKAGE.buffer
