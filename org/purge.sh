#!/bin/bash -xe

cd ~/org

for i in $(f html); do
    rm $i
done
