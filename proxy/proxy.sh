#!/bin/bash -e

# Use: $0 <on|off>
# on:  Will trigger on the proxy environment
# off: Will trigger off the proxy environment

ACTION=${1:-"on"}

# /etc/environment:
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#
# http_proxy=
# https_proxy=
# ftp_proxy=
# no_proxy=
# HTTP_PROXY=
# HTTPS_PROXY=
# FTP_PROXY=

# /etc/environment-proxy:
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#
# http_proxy="http://192.168.33.2:8123"
# https_proxy="http://192.168.33.2:8123"
# ftp_proxy="http://192.168.33.2:8123"
# no_proxy="localhost,192.168.33.2,localaddress,.localdomain.com"
# HTTP_PROXY="http://192.168.33.2:8123"
# HTTPS_PROXY="http://192.168.33.2:8123"
# FTP_PROXY="http://192.168.33.2:8123"

if [ "$ACTION" = "on" ]; then
    sudo cp /etc/environment /etc/environment-backup
    sudo cp /etc/environment-proxy /etc/environment
else
    sudo cp /etc/environment-backup /etc/environment
fi
