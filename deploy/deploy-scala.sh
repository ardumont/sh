#!/bin/bash -xe

URL=http://www.scala-lang.org/files/archive/scala-2.10.2.tgz
DIR=~/applications
FILE=$HOME/scala.tgz

[ ! -f $FILE ] && wget -O $FILE $URL

tar xvf $FILE -C $DIR
