#!/usr/bin/env bash

if [ "$1" = "-h" ]; then
   echo "Use: proxy.sh (<proxy_host>) (<proxy_port>) (<proxy_username>) (<proxy_password>)";
   exit 0;
fi

PROXY_HOST=$1
PROXY_PORT=$2
PROXY_USERNAME=$3
PROXY_PASSWORD=$4

# Your .gconf directory under your home
CONF="$HOME/.gconf"
#GCONF_MANDATORY=$(dirname $(readlink $(which gconftool-2)))/../etc/gconf/gconf.xml.mandatory

if [ -n "$PROXY_HOST" ];
then
    echo "Setting proxy configuration : $PROXY_HOST:$PROXY_PORT"

    # gconftool-2 --direct --config-source xml:readwrite:$GCONF_MANDATORY --type string --set /system/proxy/mode "manual"

    gconftool-2 --direct --config-source xml:readwrite:$CONF --type string --set /system/http_proxy/host "$PROXY_HOST"
    gconftool-2 --direct --config-source xml:readwrite:$CONF --type int    --set /system/http_proxy/port "$PROXY_PORT"
    gconftool-2 --direct --config-source xml:readwrite:$CONF --type bool   --set /system/http_proxy/use_same_proxy "TRUE"
    gconftool-2 --direct --config-source xml:readwrite:$CONF --type bool   --set /system/http_proxy/use_http_proxy "TRUE"

    #gconftool-2 --direct --config-source xml:readwrite:$CONF --type list   --set /system/http_proxy/ignore_hosts [localhost,127.0.0.0/8,*.local]

    if [ -n "$PROXY_USERNAME" ]
    then
        echo "Using authentication information : $PROXY_USERNAME:$PROXY_PASSWORD"

        gconftool-2 --direct --config-source xml:readwrite:$CONF --type=bool   --set /system/http_proxy/use_authentication "TRUE"
        gconftool-2 --direct --config-source xml:readwrite:$CONF --type=string --set /system/http_proxy/authentication_user "$PROXY_USERNAME"
        gconftool-2 --direct --config-source xml:readwrite:$CONF --type=string --set /system/http_proxy/authentication_password "$PROXY_PASSWORD"
    else
        gconftool-2 --direct --config-source xml:readwrite:$CONF --type=bool   --set /system/http_proxy/use_authentication "FALSE"

    fi
else
    echo "Removing proxy configuration."

    # gconftool-2 --direct --config-source xml:readwrite:$GCONF_MANDATORY --type string --set /system/proxy/mode "none"

    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/proxy/mode
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/host
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/port
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/use_same_proxy
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/use_http_proxy
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/use_authentication
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/authentication_user
    gconftool-2 --direct --config-source xml:readwrite:$CONF --unset /system/http_proxy/authentication_password
fi

pkill gconfd
