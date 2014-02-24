#!/bin/bash

WDIR=$(dirname $0)

if [ $# -ne 1 ]; then
    echo <<EOF
Use: $0 <WINDOW_MANAGER_NAME>
- <WINDOW_MANAGER_NAME> name of the window manager to install (stumpwm or xmonad)

This will install the window manager using the linux package manager and installing the file.desktop
EOF
    exit 1
fi

PACKAGE=$1

# Install $PACKAGE
$WDIR/install.sh $PACKAGE

# Create the file
sudo touch /usr/share/xsessions/$PACKAGE.desktop

# Add the entry for login manager (gdm, mdm, lightdm, etc...)
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
