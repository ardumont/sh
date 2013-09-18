#!/bin/bash -xe

USER=${1-"antoine.romain.dumont@gmail.com"}

git config --local user.name "Antoine R. Dumont"
git config --local user.email $USER
