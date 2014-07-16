#!/usr/bin/env bash
# Use: $0
# Set the half brightness for the screen

pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness $(expr $(/usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-max-brightness) / 2)
