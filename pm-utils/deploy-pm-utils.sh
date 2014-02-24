#!/bin/sh
# Use: $0
# Script to deploy the pm-utils script to remap the keyboard at wake up time
#

sudo cp ~/bin/pm-utils/keyboard-mapping-on-resume.sh /etc/pm/sleep.d/0000keyboard-mapping
