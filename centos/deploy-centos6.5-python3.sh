#!/usr/bin/env bash

# sudo yum groupinstall "Development tools"
# sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
# wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz -O /var/tmp/Python-3.4.3.tar.gz

# tar xvf /var/tmp/Python-3.4.3.tar.gz -C /var/tmp

# cd /var/tmp/Python-3.4.3
# make
# sudo make altinstall

sudo yum groupinstall -y "Development tools"
# install the right epel
sudo yum install -y https://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-14.ius.centos6.noarch.rpm
sudo yum install -y python34u python34u.pip postgresql-devel libffi-devel
