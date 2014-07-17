#!/usr/bin/env bash

sudo aptitude purge -y ruby1.8 rubygems

sudo aptitude install -y ruby1.9.1-full

# set ruby 1.9 the default
sudo update-alternatives --set ruby /usr/bin/ruby1.9.1

# will install vagrant, virtualbox, rubygems, ruby1.8, etc...
sudo aptitude install -y vagrant

# extends vagrant
sudo gem install vagrant-snap virtualbox veewee
