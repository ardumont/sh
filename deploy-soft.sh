#!/bin/bash

# those we can install directly

# maven2 -> standard tool to manage java project
# git -> DCVS
# gitk -> UI for git
# chromium-browser -> some good browser
# firefox -> some good browser
# localepurge -> a soft to delete useless stuff based on the locales of your machine
# tree -> to have a good vision of your arborescence
# deborphan -> delete some orphan packages
sudo apt-get install maven2 git gitk chromium-browser localepurge tree deborphan

# depending on the machine
# linux-generic-pae -> kernel with the flag PAE activated so that the machine see all the 4gb of ram or over
# sudo apt-get install linux-generic-pae

# the other one we can't
# conkeror -> very cool browser keyboard driven
# chrome -> google browser based on chromium