#!/bin/bash

# Install stumpwm
sudo aptitude install stumpwm

# Create the file
sudo touch /usr/share/xsessions/stumpwm.desktop

# Add the entry for gdm
(cat <<EOF
[Desktop Entry]
        Exec=stumpwm
        TryExec=stumpwm
        Name=stumpwm
        Comment=The Mouseless Window Manager!
EOF
)> stumpwm.buffer

sudo cp stumpwm.buffer /usr/share/xsessions/stumpwm.desktop

rm stumpwm.buffer
