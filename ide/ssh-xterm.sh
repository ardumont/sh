#!/bin/bash

xhost +

# the key for passwordless connection is kept in the ssh-agent
ssh -XC -c blowfish tony@localhost "export DISPLAY=:0.0 && xterm"
