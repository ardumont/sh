#!bash -x

# This script is destined to simplify the uninstallation between debian and ubuntu
# Use: uninstall.sh list-of-packages
# Ex:  uninstall.sh byobu tmux emacs23...

CMD=$*
[ -z "$CMD" ] && echo "Nothing to install - STOP." && exit 1;

sudo aptitude remove -y $CMD
