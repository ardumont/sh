#!/usr/bin/env bash

IP=$1

ssh-keygen -f "~/.ssh/known_hosts" -R $1
