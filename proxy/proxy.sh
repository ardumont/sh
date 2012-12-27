#!/bin/bash -e

# Use: $0 <on|off>
# on:  Will trigger on the proxy environment
# off: Will trigger off the proxy environment

ACTION=${1:-"on"}

# /etc/environment:
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#
# export http_proxy=
# export https_proxy=
# export ftp_proxy=
# export no_proxy=
# export HTTP_PROXY=
# export HTTPS_PROXY=
# export FTP_PROXY=

# /etc/environment-proxy:
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#
# export http_proxy="http://192.168.33.2:8123"
# export https_proxy="http://192.168.33.2:8123"
# export ftp_proxy="http://192.168.33.2:8123"
# export no_proxy="localhost,192.168.33.2,localaddress,.localdomain.com"
# export HTTP_PROXY="http://192.168.33.2:8123"
# export HTTPS_PROXY="http://192.168.33.2:8123"
# export FTP_PROXY="http://192.168.33.2:8123"

if [ "$ACTION" = "on" ]; then
    sudo cp /etc/environment /etc/environment-backup
    sudo cp /etc/environment-proxy /etc/environment
else
    sudo cp /etc/environment-backup /etc/environment
fi
