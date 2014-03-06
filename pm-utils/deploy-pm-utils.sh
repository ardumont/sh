#!/bin/sh
# Use: $0
# Script to deploy the personal pm-utils scripts
#

#sudo cp ~/bin/pm-utils/keyboard-mapping-on-resume.sh /etc/pm/sleep.d/0000keyboard-mapping
sudo cp ~/bin/pm-utils/lock-on-resume.sh /etc/pm/sleep.d/0001session-lock-resume
