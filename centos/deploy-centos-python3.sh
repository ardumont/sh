#!/usr/bin/env bash


sudo yum groupinstall "Development tools"
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz -O /var/tmp/Python-3.4.3.tar.gz

tar xvf /var/tmp/Python-3.4.3.tar.gz -C /var/tmp

cd /var/tmp/Python-3.4.3
make
sudo make altinstall
