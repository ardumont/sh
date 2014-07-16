#!/usr/bin/env bash

sudo sed -i 's/raring/saucy/' /etc/apt/sources.list
sudo sed -i 's/olivia/petra/' /etc/apt/sources.list
sudo sed -i 's/raring/saucy/' /etc/apt/sources.list.d/official-package-repositories.list
sudo sed -i 's/olivia/petra/' /etc/apt/sources.list.d/official-package-repositories.list

sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get upgrade
