#!/bin/bash

wget http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz -O ~/Downloads/node.tgz

tar xvf ~/Downloads/node.tgz -C ~/applications/node-v0.10.20

cd ~/applications/node-v0.10.20

./configure
make
sudo make install
