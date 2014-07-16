#!bash

OLDCONF=$(dpkg -l|grep "^rc"|awk '{print $2}')
CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
LINUXPKG="linux-(image|headers|ubuntu-modules|restricted-modules)"
METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)

YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

echo -e $YELLOW"Cleaning apt cache..."$ENDCOLOR
sudo aptitude clean

echo -e $YELLOW"Auto remove obsolete deps..."$ENDCOLOR
sudo apt-get autoremove

echo -e $YELLOW"Removing old config files..."$ENDCOLOR
sudo aptitude purge -y $OLDCONF

echo -e $YELLOW"Removing old kernels..."$ENDCOLOR
sudo aptitude purge -y $OLDKERNELS

echo -e $YELLOW"Purge orphan packages..."$ENDCOLOR
deborphan | xargs sudo apt-get -y remove --purge
deborphan --guess-all | xargs sudo apt-get -y remove --purge
deborphan --guess-dev | xargs sudo apt-get -y remove --purge

echo -e $YELLOW"Emptying every trashes..."$ENDCOLOR
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
sudo rm -rf /root/.local/share/Trash/*/** &> /dev/null

echo -e $YELLOW"Script Finished!"$ENDCOLOR
