#!/usr/bin/env bash

x11vnc -ncache 10 \
       -nap \
       -bg \
       -many \
       -rfbauth ~/.vnc/passwd \
       -desktop "VNC ${USER}@${HOSTNAME}" \
    | grep -Eo "[0-9]{4}" \
           > ~/.vnc/port.txt

# comment out the following if you don't want a popup telling you which port you're using.
zenity --info --text="Your VNC port is `cat ~/.vnc/port.txt`"
