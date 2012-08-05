#!/bin/bash

WDIR=$(dirname $0)

# Install stumpwm
$WDIR/install.sh ratpoison

# Create the file
sudo touch /usr/share/xsessions/ratpoison.desktop

# Add the entry for gdm
(cat <<EOF
[Desktop Entry]
        Type=Application
        Encoding=UTF-8
        Name=Ratpoison
        Comment=Minimalistic Window Manager
        Exec=ratpoison
EOF
)> stumpwm.buffer

sudo cp stumpwm.buffer /usr/share/xsessions/stumpwm.desktop

rm stumpwm.buffer
