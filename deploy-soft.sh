#!/bin/bash

# Depending on the machine
# linux-generic-pae -> kernel with the flag PAE activated so that the machine see all the 4gb of ram or over
# sudo apt-get install linux-generic-pae

# software that cannot be install directly
# conkeror -> very cool browser keyboard driven
# chrome -> google browser based on chromium

# software that can be directly installed

# maven2 -> standard tool to manage java project
# git -> DCVS
# gitk -> UI for git
# chromium-browser -> some good browser
# firefox -> some good browser
# localepurge -> a soft to delete useless stuff based on the locales of your machine
# tree -> to have a good vision of your arborescence
# deborphan -> delete some orphan packages
# language-pack-en, language-pack-fr -> packages for the locales management -> you need to call this command after 'sudo dpkg-reconfigure locales'
# gparted gui to manage disks
# stalonetray -> a panel to attach applet (useful to call on stumpwm to add new wifi network)
# postgresql -> db
# pgadmin3 -> administration tool for postgresql
# mysql-server -> db
# sun-java6-jdk -> sun jdk
# sun-java6-source -> sun jdk sources
# sweethome3d
aptitude install maven2 git gitk chromium-browser localepurge tree deborphan \
    language-pack-en language-pack-fr gparted stalonetray postgresql pgadmin3 \
    phppgadmin mysql-server sun-java6-jdk sun-java6-source sweethome3d stalonetray
