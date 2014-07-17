#!/usr/bin/env bash

cd ~/org

for i in $(f html); do
    rm $i
done
