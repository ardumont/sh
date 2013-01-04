#!/bin/bash -x

# Use: $0
# Set the max brightness for the screen

pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness $(/usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-max-brightness)
