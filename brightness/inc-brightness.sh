#!bash

# Use: $0 <brightness increment>
# Increment the current brightness by the increment passed as parameter (default 2)

INC=${1:-2}

pkexec /usr/lib/gnome-settings-daemon/gsd-backlight-helper --set-brightness $(expr $(/usr/lib/gnome-settings-daemon/gsd-backlight-helper --get-brightness) + $INC)
