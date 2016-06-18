#!/usr/bin/env zsh

# Use: $0

(which gnome-screensaver-command && gnome-screensaver-command --lock) || \
    (which xscreensaver-command && xscreensaver-command -lock)
