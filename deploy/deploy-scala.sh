#!/bin/bash -xe

URL=http://www.scala-lang.org/files/archive/scala-2.10.2.tgz
DIR=$HOME/applications/scala/
FILE=$HOME/Downloads/scala.tgz

mkdir -p $DIR

[ ! -f $FILE ] && wget -O $FILE $URL

tar xvf $FILE -C $DIR

cd $DIR

ln -s $DIR scala