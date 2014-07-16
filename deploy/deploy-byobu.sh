#!bash

WDIR=$(dirname $0)

# install

$WDIR/install.sh byobu landscape-common update-motd

# setup

echo 'escape ``' > ~/.screenrc
