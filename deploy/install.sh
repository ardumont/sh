#!bash
# This script is destined to simplify the installation between debian and ubuntu
# Use: $0 list-of-packages
# Ex:  $0 byobu tmux emacs23...

WDIR=$(dirname $0)
PACKAGES=$*
[ -z "$PACKAGES" ] && echo "Nothing to install - STOP." && exit 1;

function package-install() {
    sudo aptitude install -y $*
}

# ubuntu
if [ -f "/etc/lsb-release" ]; then #ubuntu or linux mint
    if [ $# -eq 1 ]; then
        # one software, we can check if it is already installed or not
        ( [ "$($WDIR/package-installed.sh $PACKAGES)" = "NOT" ] \
            && echo "Installing package '$PACKAGES'..." \
            && package-install $PACKAGES ) \
              || echo "Package '$PACKAGES' already installed or does not exist!"
    else
        package-install $PACKAGES
    fi
elif [ -f "/etc/debian_version" ]; then # debian
    su -c "aptitude install -y $PACKAGES"
fi
