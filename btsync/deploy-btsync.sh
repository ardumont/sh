#!/usr/bin/env bash

# to be run as root

# apt-key adv --keyserver keys.gnupg.net --recv-keys 6BF18B15
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 6BF18B15
CODENAME=$(lsb_release -cs | sed -n '/lucid\|precise\|quantal\|raring\|saucy\|trusty\|squeeze\|wheezy\|jessie\|sid/p')
CODENAME=${CODENAME:-sid}

cat <<EOF > /etc/apt/sources.list.d/btsync.list
#### BitTorrent Sync - see: http://forum.bittorrent.com/topic/19560-debian-and-ubuntu-desktop-packages-for-bittorrent-sync/
## Run this command: apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 6BF18B15
deb http://debian.yeasoft.net/btsync $CODENAME main
deb-src http://debian.yeasoft.net/btsync $CODENAME main
EOF
unset CODENAME

apt-get update

cat <<EOF
You should be able to install some btsync love:
`apt-cache search btsync`
EOF

# apt-get -y install btsync-user
