#!/usr/bin/env bash

# Trying to set the proxy up for evolution
# This will generate a file in ~/.gconf/system/http_proxy/%gconf.xml

gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type bool --set /system/http_proxy/use-http-proxy "TRUE"
gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type string --set /system/http_proxy/http-proxy-host "proxy-host"
gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type int --set /system/http_proxy/http-proxy-port "8080"
# behind an authentication proxy
gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type bool --set /system/http_proxy/use-authentication "TRUE"
gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type string --set /system/http_proxy/username "user"
gconftool-2 --direct --config-source xml:readwrite:~/.gconf --type string --set /system/http_proxy/password "pass"
