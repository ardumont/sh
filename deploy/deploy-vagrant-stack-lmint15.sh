#!/bin/bash -xe

# will install vagrant, virtualbox, rubygems, ruby1.8, etc...
sudo aptitude install -y vagrant ruby-dev

# extends vagrant
sudo gem install vagrant-snap virtualbox