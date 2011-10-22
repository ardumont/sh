#!/bin/bash

# First install aptitude
sudo apt-get install aptitude

# Depending on the machine
# linux-generic-pae -> kernel with the flag PAE activated so that the machine see all the 4gb of ram or over
# sudo apt-get install linux-generic-pae

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
# sweethome3d -> application to manage your home inside
# inotify-tools -> tools to manage file systems notifications
# tree -> to list directory in a pretty way
# curl -> cli request
# yajl-tools -> tools to help on different occasions (json_reformat for example)
# openssh-server -> server ssh that is not installed by default
# nautilus-dropbox -> dropbox
# sysvbanner -> script to help delimit information in cli
yes | sudo aptitude install git gitk chromium-browser localepurge tree deborphan \
    language-pack-en language-pack-fr gparted stalonetray  sweethome3d \
    inotify-tools ruby curl yajl-tools openssh-server nautilus-dropbox \
    sysvbanner
